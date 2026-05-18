DRV_EVENT_register_built_entity_handler(function(event)
  if event.entity_name == "dps-entity-building_promethium-datacore" and not event.is_ghost and
      event.entity.surface.name == "dps-planet_dps" then
    local entities = DRV_STORAGE_get("promethium-datacore", {})

    table.insert(entities, event.entity)
    UTIL_ensure_entity(event.entity.surface, { name = "dps-entity-building_promethium-datacore-container", position = event.entity.position, hidden = true})
    game.print("create entity!")

    DRV_STORAGE_set("promethium-datacore", entities)
  end
end)

DRV_EVENT_register_destroy_entity_handler(function(event)
  if event.entity_name == "dps-entity-building_promethium-datacore" and not event.is_ghost and
      event.entity.surface.name == "dps-planet_dps" then
    local entities = DRV_STORAGE_get("promethium-datacore", event.entity.position)

    table.remove(entities, event.entity)
    local container = event.entity.surface.find_entity("dps-entity-building_promethium-datacore-container", event.entity.position)
    game.print("remove entity!")
    if container then
      container.destroy()
      game.print("container destroy!")
    end

    DRV_STORAGE_set("promethium-datacore", entities)
  end
end)

DRV_EVENT_register_handler(defines.events.on_chunk_generated, function(event)
  if event.surface.name == "dps-planet_dps" then
    for _, entity in pairs(event.surface.find_entities_filtered{area = event.area, name = "dps-entity-building_promethium-datacore"}) do
      local entities = DRV_STORAGE_get("promethium-datacore", {})

      table.insert(entities, entity)
      UTIL_ensure_entity(entity.surface, { name = "dps-entity-building_promethium-datacore-container", position = entity.position, hidden = true})

      game.print("gen entity!")

      DRV_STORAGE_set("promethium-datacore", entities)
    end
  end
end)


DRV_BOOTSTRAP_create_tick_handler(60, function()
  for _, entity in pairs(DRV_STORAGE_get("promethium-datacore", {})) do
    if entity.max_health > entity.health then
      local damage = entity.max_health - entity.health
      local scrap_count = math.floor((damage / 10) + 1)

      local container = entity.surface.find_entity("dps-entity-building_promethium-datacore-container", entity.position)
      if container then
        container.insert{name = "scrap", count = scrap_count}
      end

      entity.health = entity.max_health
    end
  end
end)

--DRV_BOOTSTRAP_create_tick_handler(1, function()
--  for _, entity in pairs(DRV_STORAGE_get("promethium-datacore", {})) do
--    local container = entity.surface.find_entity("dps-entity-building_promethium-datacore-container", entity.position)
--    if container then
--      local einv = entity.get_inventory(defines.inventory.chest)
--      einv.clear()
--      local cinv = container.get_inventory(defines.inventory.chest)
--      for i = 1, #cinv do
--        local stack = cinv[i]
--        if stack.valid_for_read then
--          einv.insert(stack)
--        end
--      end
--    end
--  end
--end)