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

-- Add deps path to the package.path.
-- Thus, the dependencies will be found
package.path = package.path..";./deps/?.lua;./deps/?/?.lua;./deps/?/src/?.lua"
                           ..";./deps/?/?/.lua"

local lfs = require 'lfs'
local colors = require 'ansicolors'

local TESTS_DIR = "./tests/"
local VERSION_CMD = "git --git-dir=.git describe --all --long"
local handle = io.popen(VERSION_CMD)
local VERSION = handle:read("*a")
handle:close()

local HR = "========================================================"

-- Counters
local TOTAL_TESTS = 0
local PASS_TESTS = 0
local FAIL_TESTS = 0

for file in lfs.dir(TESTS_DIR) do
  local color = '%{green}'
  local pass = 'PASS'

  if lfs.attributes(file, "mode") ~= "directory" then    
    -- We should skip out files.
    local found = string.find(file, "_out.ncl", 1)    -- find 'next' newline
    if found == nil then -- We use only the ones that does not ends with 
                         -- '_out.ncl'

      -- Run the ncls3d with the .ncl test
      handle = io.popen ("lua ncls3d.lua " .. TESTS_DIR .. file .. " -o a.out")
      local ncsl3d_result = handle:read("*a")
      handle:close()

      local out_content = string.gsub (file, ".ncl", "_out.ncl")
      handle = io.popen ("diff a.out " .. TESTS_DIR .. out_content)
      local diff_result = handle:read("*a")
      local error_returned = handle:close()
      
      if error_returned then
        pass = 'PASS'
        color = "%{green}"
        PASS_TESTS = PASS_TESTS + 1
      else
        pass = 'FAIL'
        color = "%{red}"
        FAIL_TESTS = FAIL_TESTS + 1
      end

      print (colors(color..pass..": ") .. file)
      TOTAL_TESTS = TOTAL_TESTS + 1
    end
  end
end

print (colors('%{red}'.. HR))
print (colors("%{red}Testsuite summary for ncls3d.lua " .. VERSION .. HR))

print (colors("%{white}# TOTAL: " .. TOTAL_TESTS))
print (colors("%{green}# PASS: " .. PASS_TESTS))
print (colors("%{red}# FAIL: " .. FAIL_TESTS))

