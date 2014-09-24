-- This file contains some utility functions for ncls3d.

-- Copy a table (not recursive version)
-- @param orig the table to be copied.
-- @return a copy of orig table
function table.shallowcopy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in pairs(orig) do
            copy[orig_key] = orig_value
        end
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end

-- Copy a table (recursive version)
-- @param orig the table to be copied.
-- @return a copy of orig table
function table.deepcopy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[table.deepcopy(orig_key)] = table.deepcopy(orig_value)
        end
        setmetatable(copy, table.deepcopy(getmetatable(orig)))
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end

-- Transform a percent value to the equivalent double 
-- (e.g. return 0.1 for "100%")
-- @param percent 
function double_from_percent (percent)
  assert (type (percent) == "string")
  assert (percent:sub(#percent, #percent) == "%")
  local v = percent:sub(1, #percent - 1)
  return v / 100.0;
end

