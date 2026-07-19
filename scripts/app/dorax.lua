local status = require("scripts/svc/status")

DRV_EVENT_register_built_entity_handler(function(event)
  if event.entity_name == "dps-special_dorax" and
      not event.is_ghost and
      event.entity.surface.name == "dps-planet_dps" then

    local c = UTIL_ensure_entity(event.entity.surface, { name = "dps-special_dorax-container",
                position = event.entity.position, hidden = true})
    if not c then return end

    event.entity.proxy_target_entity = c
    event.entity.proxy_target_inventory = defines.inventory.chest

    local inv = c.get_inventory(defines.inventory.chest)
    inv.set_bar(41)
    for i = 1, 20 do
      inv.set_filter(i, {name = "dps-item_dorax-fragment"})
      inv.set_filter(i + 20,  {name = "dps-item_dorax-component"})
    end

    game.forces["player"].script_trigger_research("dps-tech_discovery-of-dorax")
  end
end)

DRV_EVENT_register_destroy_entity_handler(function(event)
  if event.entity.name == "dps-special_dorax" and event.entity.surface.name == "dps-planet_dps" then
    local container = event.entity.surface.find_entity("dps-special_dorax-container", event.entity.position)
    if container then
      container.destroy()
    end

    local dorax_placement = DRV_STORAGE_get("DORAX_PLACEMENT", {})
    if dorax_placement.entity then
      dorax_placement = nil
    end
  end
end)

DRV_TIMER_install_1s_timer(function()
  local advanced_dps_engineering_trigger = false

  local dorax_placement = DRV_STORAGE_get("DORAX_PLACEMENT", {})
  if dorax_placement.landed and dorax_placement.entity and dorax_placement.entity.valid then
    local e = dorax_placement.entity

    local container = e.surface.find_entity("dps-special_dorax-container", e.position)
    if container then
      local damage = e.max_health - e.health
      if damage >= 1 then
        if damage >= 1000 then
          advanced_dps_engineering_trigger = true
        end

        rendering.draw_text {
          text = damage,
          surface = e.surface,
          target = { type = "entity", entity = e },
          color = { 1.0, 0.66, 0.66,},
          scale = 3.0,
          time_to_live = 60,
          forces = nil,
          players = nil,
          alignment = "center",
          vertical_alignment = "middle",
        }

        --if damage >= 1000000000 then
      --  container.insert { name = "dps-item_dps-credit-g", count = damage / 1000000000 }
      --  damage = damage % 1000000000
      --end
--
      --if damage >= 1000000 then
      --  container.insert { name = "dps-item_dps-credit-m", count = damage / 1000000 }
      --  damage = damage % 1000000
      --end

        if damage >= 1000 then
          container.insert { name = "dps-item_dorax-component", count = damage / 1000 }
          damage = damage % 1000
        end

        if damage >= 1 then
          container.insert { name = "dps-item_dorax-fragment", count = damage }
        end
      end
    end
    e.health = e.max_health
  end

  if advanced_dps_engineering_trigger then
    game.forces["player"].script_trigger_research("dps-tech_advanced-dps-engineering")
  end
end)