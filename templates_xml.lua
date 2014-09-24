local inspect = require('inspect')
local util    = require('util')
local slaxml  = require ('slaxdom')
local luatpl  = require('luatpl/luatpl')

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
    print ("-- Parsing success.\n")
  end
  
  return doc.kids[1]
end

local TEMPLATES =
{
  depth_control_media_start_content = get_file_content("xml/depth_control_media_start.xml"),
  depth_control_content = get_file_content("xml/depth_control_media.xml"),
  link_update_left_content = get_file_content("xml/link_update_left.xml"),
  link_update_right_content = get_file_content("xml/link_update_right.xml"),
}  

function TEMPLATES:get_depth_control_media_start (str_id)
  assert(str_id)
  -- media_id is expected by the depth_control_media.xml template
  local template_input = "local media_id = \""..str_id.."\"\n"
  local solved = luatpl:solve(TEMPLATES.depth_control_media_start_content, template_input)
  print (solved)
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

return TEMPLATES

