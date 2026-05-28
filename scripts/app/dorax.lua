DRV_EVENT_register_built_entity_handler(function(event)
  if event.entity_name == "dps-entity-special_dorax" and
      not event.is_ghost and
      event.entity.surface.name == "dps-planet_dps" then

    local c = UTIL_ensure_entity(event.entity.surface, { name = "dps-entity-special_dorax-container",
                position = event.entity.position, hidden = true})
    if not c then return end

    event.entity.proxy_target_entity = c
    event.entity.proxy_target_inventory = defines.inventory.chest
  end
end)

DRV_EVENT_register_destroy_entity_handler(function(event)
  if event.entity.name == "dps-entity-special_dorax" and event.entity.surface.name == "dps-planet_dps" then
    local container = event.entity.surface.find_entity("dps-entity-special_dorax-container", event.entity.position)
    if container then
      container.destroy()
    end

    local dorax_placement = DRV_STORAGE_get("DORAX_PLACEMENT", {})
    if dorax_placement.entity then
      dorax_placement = nil
    end
  end
end)

DRV_BOOTSTRAP_create_tick_handler(60, function()
  local dorax_placement = DRV_STORAGE_get("DORAX_PLACEMENT", {})
  if dorax_placement.landed and dorax_placement.entity and dorax_placement.entity.valid then
    local e = dorax_placement.entity

    local container = e.surface.find_entity("dps-entity-special_dorax-container", e.position)
    if container then
      local damage = e.max_health - e.health

      --_item_delivery(container, "dps-item_subcore-scrap", damage, 20.0, 5000.0)
--
      --if damage >= 10000.0 then
      --  _item_delivery(container, "heavy-oil-barrel", damage - 10000.0, 250.0, 10000.0)
      --end
    end
    e.health = e.max_health
  end
end)