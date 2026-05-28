local function _item_delivery(container, item_name, damage, damage_per_item, inflection_point)
  local dmg_out = damage * (inflection_point / (damage + inflection_point))
  local item_cnt = math.floor(dmg_out / damage_per_item)
  if item_cnt > 0 then
    container.insert{name = item_name, count = item_cnt}
  end
end

local function _entity_created(entity)
  local entities = DRV_STORAGE_get("promethium-subcore", {})

  table.insert(entities, entity)
  local c = UTIL_ensure_entity(entity.surface, { name = "dps-entity-building_promethium-subcore-container", position = entity.position, hidden = true})
  if not c then return end

  entity.proxy_target_entity = c
  entity.proxy_target_inventory = defines.inventory.chest

  local inv = c.get_inventory(defines.inventory.chest)

  for i = 1, 10 do
    inv.set_filter(i, {name = "dps-item_subcore-scrap"})
    inv.set_filter(i + 10, {name = "heavy-oil-barrel"})
  end

  DRV_STORAGE_set("promethium-subcore", entities)
end

DRV_EVENT_register_built_entity_handler(function(event)
  if event.entity_name == "dps-entity-building_promethium-subcore" and
      not event.is_ghost and
      event.entity.surface.name == "dps-planet_dps" then
    _entity_created(event.entity)
  end
end)

DRV_EVENT_register_destroy_entity_handler(function(event)
  if event.entity.name == "dps-entity-building_promethium-subcore" and event.entity.surface.name == "dps-planet_dps" then
    local entities = DRV_STORAGE_get("promethium-subcore", event.entity.position)

    UTIL_table_remove(entities, event.entity)

    local container = event.entity.surface.find_entity("dps-entity-building_promethium-subcore-container", event.entity.position)
    if container then
      container.destroy()
    end

    DRV_STORAGE_set("promethium-subcore", entities)
  end
end)

DRV_EVENT_register_handler(defines.events.on_chunk_generated, function(event)
  if event.surface.name == "dps-planet_dps" then
    for _, entity in pairs(event.surface.find_entities_filtered{area = event.area, name = "dps-entity-building_promethium-subcore"}) do
      _entity_created(entity)
    end
  end
end)

DRV_TIMER_install_1s_timer(function()
  for _, entity in pairs(DRV_STORAGE_get("promethium-subcore", {})) do
    if entity.valid and entity.max_health > entity.health then
      local container = entity.surface.find_entity("dps-entity-building_promethium-subcore-container", entity.position)
      if container then
        local damage = entity.max_health - entity.health

        _item_delivery(container, "dps-item_subcore-scrap", damage, 10.0, 5000.0)

        if damage >= 10000.0 then
          _item_delivery(container, "coal", damage - 10000.0, 20.0, 10000.0)
        end
      end
      entity.health = entity.max_health
    end
  end
end)