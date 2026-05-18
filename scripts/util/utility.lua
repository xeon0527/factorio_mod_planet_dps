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

function UTIL_insert_item(entity, items)
  for _, item in pairs(items) do
    local num_item = entity.insert(item);
    if item.count > num_item then
      entity.surface.spill_item_stack {
        position = entity.position,
        enable_looted = true,
        stack = {
          name = item.name;
          count = item.count - num_item,
          quality = (type(item.quality) == "table" and item.quality.name) or item.quality,
        }
      }
    end
  end
end

function UTIL_ensure_entity(surface, create_entity_param)
  local entity = nil
  if surface and create_entity_param and create_entity_param.name then
    if not create_entity_param.position then
      create_entity_param.position = {0,0}
    end

    if not create_entity_param.force then
      create_entity_param.force = "player"
    end

    entity = surface.find_entity(create_entity_param.name, create_entity_param.position);
    if not entity then
      entity = surface.create_entity(create_entity_param)
      if create_entity_param.hidden then
        entity.destructible = false
        entity.minable = false
      end
    end
  end
  return entity
end