local function _item_delivery(container, item_name, damage, damage_per_item, inflection_point, min_amount)
  local dmg_out = damage * (inflection_point / (damage + inflection_point))
  local item_cnt = math.floor(dmg_out / damage_per_item)

  if min_amount and item_cnt <= 0 then
    item_cnt = min_amount
  end

  if item_cnt > 0 then
    container.insert{name = item_name, count = item_cnt}
  end
end

local function _entity_created(entity)
  local entities = DRV_STORAGE_get("promethium-subcore", {})

  table.insert(entities, entity)
  local c = UTIL_ensure_entity(entity.surface, { name = "dps-building_promethium-subcore-container", position = entity.position, hidden = true})
  if not c then return end

  entity.proxy_target_entity = c
  entity.proxy_target_inventory = defines.inventory.chest

  local inv = c.get_inventory(defines.inventory.chest)

  inv.set_bar(61)
  for i = 1, 20 do
    inv.set_filter(i,       {name = "dps-item_subcore-scrap"})
    inv.set_filter(i + 20,  {name = "heavy-oil-barrel"})
    inv.set_filter(i + 40,  {name = "coal"})
  end

  DRV_STORAGE_set("promethium-subcore", entities)
end

DRV_EVENT_register_built_entity_handler(function(event)
  if event.entity_name == "dps-building_promethium-subcore" and
      not event.is_ghost and
      event.entity.surface.name == "dps-planet_dps" then
    _entity_created(event.entity)
  end
end)

DRV_EVENT_register_destroy_entity_handler(function(event)
  if event.entity.name == "dps-building_promethium-subcore" and event.entity.surface.name == "dps-planet_dps" then
    local entities = DRV_STORAGE_get("promethium-subcore", event.entity.position)

    UTIL_table_remove(entities, event.entity)

    local container = event.entity.surface.find_entity("dps-building_promethium-subcore-container", event.entity.position)
    if container then
      container.destroy()
    end

    DRV_STORAGE_set("promethium-subcore", entities)
  end
end)

DRV_EVENT_register_handler(defines.events.on_chunk_generated, function(event)
  if event.surface.name == "dps-planet_dps" then
    for _, entity in pairs(event.surface.find_entities_filtered{area = event.area, name = "dps-building_promethium-subcore"}) do
      _entity_created(entity)
    end
  end
end)

DRV_TIMER_install_1s_timer(function()
  local subcore_scrap_recycling_research_trigger = false
  local cheap_magazine_research_trigger = false

  for _, entity in pairs(DRV_STORAGE_get("promethium-subcore", {})) do
    if entity.valid and entity.max_health > entity.health then
      local container = entity.surface.find_entity("dps-building_promethium-subcore-container", entity.position)
      if container then
        local damage = entity.max_health - entity.health
        if damage > 0 then
          subcore_scrap_recycling_research_trigger = true
          if damage >= 100 then
            cheap_magazine_research_trigger = true
          end
        end

        _item_delivery(container, "dps-item_subcore-scrap", damage, 10.0, 5000.0, 1)

        if damage >= 5000.0 then
          _item_delivery(container, "heavy-oil-barrel", damage - 5000.0, 250.0, 10000.0)
        end

        if damage >= 10000.0 then
          _item_delivery(container, "coal", damage - 10000.0, 25.0, 10000.0)
        end
      end
      entity.health = entity.max_health
    end
  end

  if subcore_scrap_recycling_research_trigger then
    game.forces["player"].script_trigger_research("dps-tech_subcore-scrap-recycling")
    if cheap_magazine_research_trigger then
      game.forces["player"].script_trigger_research("dps-tech_cheap-magazine")
    end
  end
end)