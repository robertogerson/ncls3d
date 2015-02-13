--[[ Copyright (C) 2015 Roberto Azevedo

This file is part of ncls3d.

ncls3d is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

ncls3d is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with ncls3d. If not, see <http://www.gnu.org/licenses/>.
--]]

local inspect = require 'inspect'

-- Depth control is an NCLua script that communicates with NCL documents to
-- calculate final bounds value for NCL stereoscopic applications.
user_scale_disparity = 1.0 -- an user selected value that can
orig_bounds = {"0%", "0%", "100%", "100%"} -- the original bounds
orig_depth = 1.0 -- Deph of the original media

-- Display dependent parameters
max_pos_disparity = 0.01
max_neg_disparity = 0.02

-- split the values of string s in a table.
-- e.g. "1, 2, 3" will return the table {1, 2, 3}
-- @param s The string that will be splitted (e.g. "1, 2, 3")
-- @param pattern The pattern that will split s (e.g. ",")
-- @param maxsplit The max number of sections to split s
split = function(s, pattern, maxsplit)
  local pattern = pattern or ' '
  local maxsplit = maxsplit or -1
  local s = s
  local t = {}
  local patsz = #pattern
  while maxsplit ~= 0 do
    local curpos = 1
    local found = string.find(s, pattern)
    if found ~= nil then
      table.insert(t, string.sub(s, curpos, found - 1))
      curpos = found + patsz
      s = string.sub(s, curpos)
    else
      table.insert(t, string.sub(s, curpos))
      break
    end
    maxsplit = maxsplit - 1
    if maxsplit == 0 then
      table.insert(t, string.sub(s, curpos - patsz - 1))
    end
  end
  return t
end

-- The main function of this NCLua script. Tells NCL document the updated values
-- of left- and right-size elements through NCLua event API
function update_final_bounds()
	local final_disparity = 0
	if orig_depth >= 0 then
		final_disparity = (-1.0) * orig_depth * max_pos_disparity * user_scale_disparity 
		if final_disparity > 0 then
			final_disparity = 0
		end
	else
		final_disparity = (-1.0) * orig_depth * max_neg_disparity * user_scale_disparity
		if final_disparity < 0 then
			final_disparity = 0
		end
	end
	
	local left = tonumber( string.sub(orig_bounds[1], 1, #orig_bounds[1]-1) )
	local width = tonumber( string.sub(orig_bounds[3], 1, #orig_bounds[3]-1) )
	
	-- update left values
	local bounds_str = tostring(left/2.0) .. "%," .. 
						orig_bounds[2] .. "," ..
				   		tostring( width / 2.0) .. "%," ..
				   		orig_bounds[4]	
	
  -- Update the bounds of the left-side element
	local evt = {
		class = 'ncl',
		type  = 'attribution',
		name = 'final_bounds_left',
		action = 'start',
		value = bounds_str
	}

  print ("bounds_str left: ", bounds_str)

	event.post (evt)
	evt.action = 'stop'
	event.post (evt)
	
	-- Update the bounds of the right-side element
	bounds_str = tostring((50 + left + final_disparity * 100)) .. "%," 
               .. orig_bounds[2] .. ","
               .. tostring( width / 2.0) .. "%,"
               .. orig_bounds[4]	
	
	evt.action = 'start'
	evt.name = 'final_bounds_right'
	evt.value = bounds_str
  
  print ("bounds_str right: ", bounds_str)
	
	event.post (evt)
	evt.action = 'stop'
	event.post (evt)
end

-- Main handler of NCLua events
-- @param evt An NCLua event
function handler (evt)
  if evt.class ~= 'ncl' then return end
  if evt.type ~= 'attribution' then return end

  if evt.action == 'stop' then
  
    if evt.name == 'update_user_scale_disparity_by' then
      user_scale_disparity = user_scale_disparity + evt.value
    
      if user_scale_disparity < 0 then
        user_scale_disparity = 0
      end
      if user_scale_disparity > 1 then
        user_scale_disparity = 1
      end
      update_final_bounds()
    end
  
    if evt.name == 'orig_left' then
      orig_left = tonumber(evt.value)
      update_final_bounds()
    end
  
    if evt.name == 'orig_depth' then
      orig_depth = tonumber(evt.value)
      update_final_bounds()
    end
  
    if evt.name == 'orig_bounds' then
      orig_bounds = split (evt.value, ",")
      print (orig_bounds[1], orig_bounds[2], orig_bounds[3], orig_bounds[4])  
      update_final_bounds()
    end
  end
  
  evt.action = stop
  event.post(evt)
end

-- Register the handler funtion to start to receive NCLs
-- notifications
event.register(handler)
