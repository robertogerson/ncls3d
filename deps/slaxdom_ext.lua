-- require slaxml
local SLAXML = require 'slaxml.slaxdom'

-- Get the attribute of an XML element represented by SLAXML.
-- @param xml_el
-- @param name
-- @param value
function SLAXML:get_attr(xml_el, name)
  assert(xml_el.attr)
  -- if there is the attribute in attr table, update it
  for x, attr in pairs(xml_el.attr) do
    if attr.name == name then
      return attr.value
    end
  end

  return nil
end

-- Set an value to an attribute.
-- @param xml_el
-- @param name
-- @param value
function SLAXML:set_attr(xml_el, name, value)
  assert(xml_el.attr)
  local updated = false
  -- if there is the attribute in attr table, update it
  for x, attr in pairs(xml_el.attr) do
    if attr.name == name then
      attr.value = value
      updated = true
      break
    end
  end

  -- if there is no the attribute, then, add it
  if not updated then
    table.insert(xml_el.attr, {["name"]=name,
                               ["value"] = value,
                               ["type"] = "attribute"})
  end
end

-- Find all the elements with attribute attr = value
-- @xml_el
-- @attr
-- @value
function SLAXML:find_by_attribute(xml_el, attr, value)
  local found_elements = {};
  if xml_el.attr then
    for k,v in pairs (xml_el.attr) do
      if k == attr and v == value then
      --if v.name == attr and v.value == value then
        table.insert ( found_elements, xml_el )
        break;
      end
    end
  end
  
  -- go into children recursively
  if xml_el.kids then
    for k,v in pairs (xml_el.kids) do
      local found_from_child_el = SLAXML:find_by_attribute (v, attr, value)
      if found_from_child_el then
        for k,v in pairs (found_from_child_el) do
          table.insert ( found_elements, v )
        end
      end
    end
  end
  
  return found_elements;
end

-- Get XML element by attribute.
-- @param xml_el
-- @param name
-- @param value
function SLAXML:get_elem_by_attr(root, attr, value)
  if root.attr then
     local attr_value = SLAXML:get_attr(root, attr)
    if attr_value == value then
      return root
    end
  end
  
  if root.kids then
    for k, child in pairs(root.kids) do
      local x = SLAXML:get_elem_by_attr(child, attr, value)
      if x then
        return x
      end
    end
  end
  return nil
end


-- Search all the elements with a tagname
-- @xml_el The XML element root where we want to start the search.
-- @tagname The tagname to be found.
-- @recursive It should be true if you want to search recursively in the
--            xml_el'schildren.
function SLAXML:get_elements_by_type(xml_el, tagname, recursive)
  local elements = {}
  if (xml_el.name == tagname) then
    table.insert (elements, xml_el)
  end
  
  if recursive and xml_el.kids then
    for k, v in pairs(xml_el.kids) do
      local x = SLAXML:get_elements_by_type (v, tagname, recursive)
      if (#x ~= 0) then
        for k1, v1 in pairs (x) do
          table.insert(elements, v1)
        end
      end
    end
  end

  return elements
end


-- Serialize an XML document represented as a SLAXML dom table
-- @param xml_el The SLAXML dom table.
-- @param ntabs The number of tabs to format the current element. 
function SLAXML:serialize (xml_el, ntabs, TAB)
  ntabs = ntabs or 0 -- the default value for ntabs is zero
  TAB   = TAB or '\t' -- default TAB character

  local str_el = ""    
  if xml_el.type == "pi" then
    str_el = "<?" .. xml_el.name .. " " .. xml_el.value .."?>\n"
    return str_el
  else 
    if xml_el.type == "element" then
      for i = 0,ntabs do
        str_el = str_el .. TAB
      end
      str_el = str_el .. "<" .. xml_el.name
      if xml_el.attr then
        for k, v in pairs (xml_el.attr) do
          if v.name ~= nil then
            str_el = str_el .. " " .. v.name .. "=\"" .. v.value .."\""
          end
        end
      end
    else
      -- if xml_el.type == "text" then
      --  return xml_el.value
      -- end
    end
    
    -- go recursively 
    if xml_el.kids and #xml_el.kids > 0 then
      local new_ntabs = ntabs
      if xml_el.type == "element" then
        str_el = str_el .. ">\n"
        new_ntabs = ntabs + 1
      end
      
      for k, xml_kid in pairs (xml_el.kids) do
        str_el = str_el .. SLAXML:serialize(xml_kid, new_ntabs, TAB)
      end
      
      if xml_el.type == "element" and #xml_el.kids then
        for i = 0,ntabs do
          str_el = str_el .. TAB
        end
        str_el = str_el .. "</" .. xml_el.name .. ">\n"
      end
    else
      if xml_el.type == "element" then
        str_el = str_el .. "/>\n" 
      end
    end
  end

  return str_el
end

return SLAXML
