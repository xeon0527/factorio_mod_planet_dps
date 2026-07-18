local status = require("scripts/svc/status")

--local function _item_delivery(container, item_name, damage, damage_per_item, inflection_point, min_amount)
--  local dmg_out = damage * (inflection_point / (damage + inflection_point))
--  local item_cnt = math.floor(dmg_out / damage_per_item)
--
--  if min_amount and item_cnt <= 0 then
--    item_cnt = min_amount
--  end
--
--  if item_cnt > 0 then
--    container.insert{name = item_name, count = item_cnt}
--  end
--end

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
    inv.set_bar(21)
    for i = 1, 20 do
      inv.set_filter(i, {name = "dps-item_dorax-fragment"})
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
  local dorax_placement = DRV_STORAGE_get("DORAX_PLACEMENT", {})
  if dorax_placement.landed and dorax_placement.entity and dorax_placement.entity.valid then
    local e = dorax_placement.entity

    local container = e.surface.find_entity("dps-special_dorax-container", e.position)
    if container then
      local damage = e.max_health - e.health

      --if damage >= 1000000000 then
      --  container.insert { name = "dps-item_dps-credit-g", count = damage / 1000000000 }
      --  damage = damage % 1000000000
      --end
--
      --if damage >= 1000000 then
      --  container.insert { name = "dps-item_dps-credit-m", count = damage / 1000000 }
      --  damage = damage % 1000000
      --end
--
      --if damage >= 1000 then
      --  container.insert { name = "dps-item_dps-credit-k", count = damage / 1000 }
      --  damage = damage % 1000
      --end
--
      if damage >= 1 then
        container.insert { name = "dps-item_dorax-fragment", count = damage }
      end
    end
    e.health = e.max_health
  end
end)