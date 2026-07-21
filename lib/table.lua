return {
  ensure = function(root, path)
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
  end,

  remove = function(list, object)
    for i = 1, #list do
      if list[i] == object then
        table.remove(list, i)
        return true
      end
    end
    return false
  end
}