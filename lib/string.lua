return {
  split = function(str, sep)
    local t = {}
    for _str in string.gmatch(str, "([^"..sep.."]+)") do
      table.insert(t, _str)
    end
    return t
  end
}