return {
  insert_item = function(entity, items)
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
  end,

  ensure = function(surface, create_entity_param)
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
          entity.minable_flag = false
        end
      end
    end
    return entity
  end
}