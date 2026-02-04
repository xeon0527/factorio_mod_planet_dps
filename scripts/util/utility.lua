function UTIL_ensure_object(root, path)
  local current = root
  for part in path:gmatch("[^%.]+") do
    if type(current[part]) ~= 'table' then
      if not current[part] then
        current[part] = {}
      end
    end
    current = current[part]
  end
  return current
end

function UTIL_string_split(str, sep)
  local t = {}
  for _str in string.gmatch(str, "([^"..sep.."]+)") do
    table.insert(t, _str)
  end
  return t
end