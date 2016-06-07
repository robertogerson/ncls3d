#!/usr/bin/env lua
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

-- A very simple script to get the dependencies of ncls3d.lua
local _depsdir = "./deps"

local _deps = {
  ["inspect"]     = "https://github.com/kikito/inspect.lua.git",
  ["slaxml"]      = "https://github.com/Phrogz/SLAXML.git",
  ["slaxdom_ext"] = "https://github.com/robertogerson/slaxdom_ext.git",
  ["luatpl"]      = "https://github.com/robertogerson/luatpl.git",
  ["argparse"]    = "https://github.com/mpeterv/argparse.git",
  ["30log"]       = "https://github.com/Yonaba/30log.git",
  ["ansicolors"]  = "https://github.com/kikito/ansicolors.lua.git"
}

for k,v in pairs(_deps) do
  local cmd = "git clone " .. v .. " deps/" .. k
  local t = os.execute (cmd)
  if t ~= 0 then
    print ("Error getting dependency: " .. v )
  end
end

