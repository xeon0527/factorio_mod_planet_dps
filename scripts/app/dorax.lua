DRV_EVENT_register_built_entity_handler(function(event)
  if event.entity_name == "dps-entity-special_dorax" and
      not event.is_ghost and
      event.entity.surface.name == "dps-planet_dps" then

    local c = UTIL_ensure_entity(event.entity.surface, { name = "dps-entity-special_dorax-container",
                position = event.entity.position, hidden = true})
    if not c then return end
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