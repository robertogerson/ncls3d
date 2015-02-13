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

local inspect = require "inspect"
local util    = require "util"
local slaxml  = require "slaxdom_ext"
local luatpl  = require "luatpl/luatpl"

function get_file_content(path)
  local f = assert(io.open(path, "r"))
  local xml_content = f:read("*all")
  f:close()
  return xml_content
end

function get_root_element (xml_content)
  -- Parse XML and print results
  local doc = slaxml:dom(xml_content,{ simple=true })
  if (doc) then
    return doc.kids[1]
  else
    return nil
  end
end

local TEMPLATES =
{
  depth_control_media_start_content = get_file_content("tpl/depth_control_media_start.xml"),
  depth_control_content = get_file_content("tpl/depth_control_media.xml"),
  link_update_left_content = get_file_content("tpl/link_update_left.xml"),
  link_update_right_content = get_file_content("tpl/link_update_right.xml"),
  link_stop_depth_control = get_file_content("tpl/link_stop_depth_control.xml"),
  link_set_depth_defaults = get_file_content("tpl/link_set_depth_defaults.xml")
}  

function TEMPLATES:get_depth_control_media_start (str_id)
  assert(str_id)
  -- media_id is expected by the depth_control_media.xml template
  local template_input = "local media_id = \""..str_id.."\"\n"
  local solved = luatpl:solve(TEMPLATES.depth_control_media_start_content, template_input)
  local root = get_root_element (solved)

  return table.deepcopy(root)
end

function TEMPLATES:get_depth_control_media (str_id)
  assert(str_id)
  -- media_id is expected by the depth_control_media.xml template
  local template_input = "local media_id = \""..str_id.."\"\n"
  local solved = luatpl:solve(TEMPLATES.depth_control_content, template_input)
  local root = get_root_element (solved)

  return table.deepcopy(root)
end

function TEMPLATES:get_link_update_left (str_id)
  assert(str_id)
  local template_input = "local id_depth_control = \"".. str_id .. "_depth_control\"\n"
  template_input = template_input .. "local id_left_media = \"".. str_id .. "\"\n"

  local solved = luatpl:solve(TEMPLATES.link_update_left_content, template_input)
  local root = get_root_element (solved)

  return table.deepcopy(root)
end

function TEMPLATES:get_link_update_right (str_id)
  assert(str_id)
  local template_input = "local id_depth_control = \"".. str_id .. "_depth_control\"\n"
  template_input = template_input .. "local id_right_media = \"".. str_id .. "_right\"\n"
  template_input = template_input .. "local id_left_media = \"".. str_id .. "\"\n"

  local solved = luatpl:solve(TEMPLATES.link_update_right_content, template_input)
  local root = get_root_element (solved)

  return table.deepcopy(root)
end

function TEMPLATES:get_link_stop_depth_control (str_id)
   assert(str_id)
  local template_input = "local id_depth_control = \"".. str_id .. "_depth_control\"\n"
  template_input = template_input .. "local id_right_media = \"".. str_id .. "_right\"\n"
  template_input = template_input .. "local id_left_media = \"".. str_id .. "\"\n"

  local solved = luatpl:solve(TEMPLATES.link_stop_depth_control, template_input)
  local root = get_root_element (solved)

  return table.deepcopy(root)
end

function TEMPLATES:get_link_set_depth_defaults (str_id, orig_depth, orig_bounds)
   assert(str_id)
  local template_input = "local id_depth_control = \"".. str_id .. "_depth_control\"\n"
  template_input = template_input .. "local orig_depth = \"".. orig_depth .. "\"\n"
  template_input = template_input .. "local orig_bounds = \"".. orig_bounds .. "\"\n"

  local solved = luatpl:solve(TEMPLATES.link_set_depth_defaults, template_input)
  local root = get_root_element (solved)

  return table.deepcopy(root)
end


return TEMPLATES

