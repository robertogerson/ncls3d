-- A very simple script to get the dependencies of ncls3d.lua
local _depsdir = "./deps"

local _deps = {
  ["inspect"]  = "https://github.com/kikito/inspect.lua.git",
  ["slaxml"]   = "https://github.com/Phrogz/SLAXML.git",
  ["luatpl"]   = "https://github.com/robertogerson/luatpl.git",
  ["argparse"] = "https://github.com/mpeterv/argparse.git",
  ["30log"]    = "https://github.com/Yonaba/30log.git"
}

for k,v in pairs(_deps) do
  local cmd = "git clone " .. v .. " deps/" .. k
  local t = os.execute (cmd)
  if t ~= 0 then
    print ("Error getting dependency: " .. v )
  end
end

