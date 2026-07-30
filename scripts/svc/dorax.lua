--local status = require("scripts/svc/status")

__SVC_DORAX__ = {
  handler_update_dps = {}
}

local _STOR_NAME = "dps-dorax-list"

local function _entity_created(entity)
  local c = __LIB__.entity.ensure(entity.surface, { name = "dps-special_dorax-container", position = entity.position, hidden = true})
  if not c then
    error("dps-special_dorax-container create error")
  end

  entity.proxy_target_entity = c
  entity.proxy_target_inventory = defines.inventory.chest

  local inv = c.get_inventory(defines.inventory.chest)
  inv.set_bar(61)
  for i = 1, 20 do
    inv.set_filter(i, {name = "dps-item_dorax-fragment"})
    inv.set_filter(i + 20,  {name = "dps-item_dorax-component"})
    inv.set_filter(i + 40,  {name = "dps-item_dorax-armor-plate"})
  end
  
  local entities = DRV_STORAGE_get(_STOR_NAME, {})

  if entities[entity.unit_number] then
    if entity ~= entities[entity.unit_number].entity then
      error("dps-special_dorax-container dup error")
    end
  end

  entities[entity.unit_number] = {
    entity        = entity,
    container     = c,
    dps_enable    = false,
    dps_queue     = {},
    dps_queue_idx = 1,
    dps           = 0
  }

  for i = 1, 180, 1 do
    entities[entity.unit_number].dps_queue[i] = 0
  end

  DRV_STORAGE_set(_STOR_NAME, entities)

  game.forces["player"].script_trigger_research("dps-tech_discovery-of-dorax")
end

DRV_EVENT_register_built_entity_handler(function(event)
  if event.entity_name == "dps-special_dorax" and
      not event.is_ghost and
      event.entity.surface.name == "dps-planet_dps" then
    _entity_created(event.entity)
  end
end)

DRV_EVENT_register_destroy_entity_handler(function(event)
  if event.entity.name == "dps-special_dorax" and event.entity.surface.name == "dps-planet_dps" then
    local entities = DRV_STORAGE_get(_STOR_NAME, {})
    local u_num = event.entity.unit_number
    if entities[u_num] then
      entities[u_num].container.destroy()
      entities[u_num] = nil
    end

    DRV_STORAGE_set(_STOR_NAME, entities)
  end
end)

script.on_event(defines.events.on_entity_damaged, function(_event)
    _event.entity.health = 0.0000000000000000000001
end, {
  {
    filter = "name",
    name = "dps-special_dorax",
    mode = "and",
  },
  {
    filter = "final-health",
    comparison = "≤",
    value = 0,
    mode = "and",
  }
})

DRV_TIMER_create_static_tick_handler(function()
  for _, item in pairs(DRV_STORAGE_get(_STOR_NAME, {})) do
    local entity = item.entity
    if entity.valid then
      local damage = entity.max_health - entity.health
      if damage >= 1 then
        entity.health = entity.max_health
      end

      item.dps_queue[item.dps_queue_idx] = damage
      item.dps_queue_idx = item.dps_queue_idx + 1
      if item.dps_queue_idx >= 180 then
        item.dps_queue_idx = 1
      end
    end
  end
end)

DRV_TIMER_create_static_tick_60_handler(function()
  for _, dorax in pairs(DRV_STORAGE_get(_STOR_NAME, {})) do
    local entity = dorax.entity
    if entity.valid then
      local damage = 0
      for i = 1, #dorax.dps_queue, 1 do
        damage = damage + dorax.dps_queue[i]
      end
      damage = damage / 3.0
      dorax.dps = damage

      if damage >= 1 then
        rendering.draw_text {
          text = math.floor(damage),
          surface = entity.surface,
          target = { type = "entity", entity = entity },
          color = { 1.0, 0.66, 0.66,},
          scale = 3.0,
          time_to_live = 60,
          forces = nil,
          players = nil,
          alignment = "center",
          vertical_alignment = "middle",
        }

        if damage >= 1000 then
          game.forces["player"].script_trigger_research("dps-tech_supersonic-grenade-launcher")
          if damage >= 1000000 then
            game.forces["player"].script_trigger_research("dps-tech_advanced-dps-engineering")
          end
        end

        local container = dorax.container
        --if average >= 1000000000 then
        --  container.insert { name = "dps-item_dps-credit_g", count = average / 1000000000 }
        --  average = average % 1000000000
        --end
        --
        if damage >= 1000000 then
          container.insert { name = "dps-item_dorax-armor-plate", count = damage / 1000000 }
          damage = damage % 1000000
        end
        
        if damage >= 1000 then
          container.insert { name = "dps-item_dorax-component", count = damage / 1000 }
          damage = damage % 1000
        end

        if damage >= 1 then
          container.insert { name = "dps-item_dorax-fragment", count = damage }
        end
      end
    end
  end

  for _, h in pairs(__SVC_DORAX__.handler_update_dps) do
    h()
  end
end)

local _module = {
  add_update_dps_handler = function(handler)
    table.insert(__SVC_DORAX__.handler_update_dps, handler)
  end,

  get_dps = function()
    for _, v in pairs(DRV_STORAGE_get(_STOR_NAME, {})) do
      return v.dps
    end
    return 0
  end
}

return _module