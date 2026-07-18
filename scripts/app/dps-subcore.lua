local function _entity_created(entity)
  local entities = DRV_STORAGE_get("dps-subcore", {})

  table.insert(entities, entity)
  local c = UTIL_ensure_entity(entity.surface, { name = "dps-building_dps-subcore-container", position = entity.position, hidden = true})
  if not c then return end

  entity.proxy_target_entity = c
  entity.proxy_target_inventory = defines.inventory.chest

  local inv = c.get_inventory(defines.inventory.chest)
  for i = 1, 20 do
    inv.set_filter(i,       {name = "dps-item_dps-credit-n"})
    inv.set_filter(i + 20,  {name = "dps-item_dps-credit-k"})
    inv.set_filter(i + 40,  {name = "dps-item_dps-credit-m"})
    inv.set_filter(i + 60,  {name = "dps-item_dps-credit-g"})
    inv.set_filter(i + 80,  {name = "dps-item_dps-credit-t"})
  end
  
  DRV_STORAGE_set("dps-subcore", entities)
end

DRV_EVENT_register_built_entity_handler(function(event)
  if event.entity_name == "dps-building_dps-subcore" and
      not event.is_ghost and
      event.entity.surface.name == "dps-planet_dps" then
    _entity_created(event.entity)
  end
end)

DRV_EVENT_register_destroy_entity_handler(function(event)
  if event.entity.name == "dps-building_dps-subcore" and event.entity.surface.name == "dps-planet_dps" then
    local entities = DRV_STORAGE_get("dps-subcore", event.entity.position)

    UTIL_table_remove(entities, event.entity)

    local container = event.entity.surface.find_entity("dps-building_dps-subcore-container", event.entity.position)
    if container then
      container.destroy()
    end

    DRV_STORAGE_set("dps-subcore", entities)
  end
end)

DRV_EVENT_register_handler(defines.events.on_chunk_generated, function(event)
  if event.surface.name == "dps-planet_dps" then
    for _, entity in pairs(event.surface.find_entities_filtered{area = event.area, name = "dps-building_dps-subcore"}) do
      _entity_created(entity)
    end
  end
end)

DRV_TIMER_install_1s_timer(function()
  local dps_credit_translator_research_trigger = false
  local dps_credit_exchange_research_trigger = false
  local dps_data_pack_trigger = false

  for _, entity in pairs(DRV_STORAGE_get("dps-subcore", {})) do
    if entity.valid and entity.max_health > entity.health then
      local container = entity.surface.find_entity("dps-building_dps-subcore-container", entity.position)
      if container then
        local damage = entity.max_health - entity.health
        if damage >= 1 then
          dps_credit_translator_research_trigger = true
          if damage >= 1000 then
            dps_credit_exchange_research_trigger = true
            if damage >= 5000 then
              dps_data_pack_trigger = true
            end
          end

          rendering.draw_text {
            text = damage,
            surface = entity.surface,
            target = { type = "entity", entity = entity },
            color = { 1.0, 0.66, 0.66,},
            scale = 2.0,
            time_to_live = 60,
            forces = nil,
            players = nil,
            alignment = "center",
            vertical_alignment = "middle",
          }

          if damage >= 1000000000 then
            container.insert { name = "dps-item_dps-credit-g", count = damage / 1000000000 }
            damage = damage % 1000000000
          end

          if damage >= 1000000 then
            container.insert { name = "dps-item_dps-credit-m", count = damage / 1000000 }
            damage = damage % 1000000
          end

          if damage >= 1000 then
            container.insert { name = "dps-item_dps-credit-k", count = damage / 1000 }
            damage = damage % 1000
          end
          
          container.insert { name = "dps-item_dps-credit-n", count = damage }
        end
      end
      entity.health = entity.max_health
    end
  end

  if dps_credit_translator_research_trigger then
    game.forces["player"].script_trigger_research("dps-tech_dps-credit-translator")
    if dps_credit_exchange_research_trigger then
      game.forces["player"].script_trigger_research("dps-tech_dps-credit-exchange")
      if dps_data_pack_trigger then
        game.forces["player"].script_trigger_research("dps-tech_dps-data-pack")
      end
    end
  end
end)