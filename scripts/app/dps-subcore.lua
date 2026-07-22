local _STOR_NAME = "dps-subcore-list"

local function _entity_created(entity)
  local c = __LIB__.entity.ensure(entity.surface, { name = "dps-building_dps-subcore-container", position = entity.position, hidden = true})
  if not c then
    error("dps-building_dps-subcore-container create error")
  end

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
  
  local entities = DRV_STORAGE_get(_STOR_NAME, {})

  if entities[entity.unit_number] then
    if entity ~= entities[entity.unit_number].entity then
      error("dps-building_dps-subcore-container dup error")
    end
  end

  entities[entity.unit_number] = {
    entity = entity,
    container = c,
    dps_enable = false,
    dps_queue = {},
    dps_queue_idx = 1,
    display_tick = 0,
  }

  for i = 1, 60, 1 do
    entities[entity.unit_number].dps_queue[i] = 0
  end

  DRV_STORAGE_set(_STOR_NAME, entities)
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
    local entities = DRV_STORAGE_get(_STOR_NAME, {})
    
    if entities[event.entity.unit_number] then
      entities[event.entity.unit_number].container.destroy()
      entities[event.entity.unit_number] = nil
    end
    
    DRV_STORAGE_set(_STOR_NAME, entities)
  end
end)

DRV_EVENT_register_handler(defines.events.on_chunk_generated, function(event)
  if event.surface.name == "dps-planet_dps" then
    for _, entity in pairs(event.surface.find_entities_filtered{area = event.area, name = "dps-building_dps-subcore"}) do
      _entity_created(entity)
    end
  end
end)

script.on_event(defines.events.on_entity_damaged, function(_event)
  if _event.entity.health == 0 then
    _event.entity.health = 0.0000000000000000000001
  end
end, {
  {
    filter = "name",
    name = "dps-building_dps-subcore",
    --mode = "and",
  },
  --{
  --  filter = "final-health",
  --  comparison = "≤",
  --  value = 0,
  --}
})

DRV_TIMER_create_static_tick_handler(function()
  for _, item in pairs(DRV_STORAGE_get(_STOR_NAME, {})) do
    local entity = item.entity
    if entity.valid then
      local damage = entity.max_health - entity.health
      if damage >= 1 then
        item.dps_enable = true
        entity.health = entity.max_health
      end

      if item.dps_enable then
        item.dps_queue[item.dps_queue_idx] = damage
        item.dps_queue_idx = item.dps_queue_idx + 1
        if item.dps_queue_idx > 60 then
          item.dps_queue_idx = 1
        end

        item.display_tick = item.display_tick - 1
        if item.display_tick <= 0 then
          local average = 0
          for i = 1 , 60, 1 do
            average = average + item.dps_queue[i]
          end

          if average >= 1 then
            item.display_tick = 60
          else
            item.dps_enable = false
            item.display_tick = 0
          end

          rendering.draw_text {
            text = math.floor(average),
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



          game.forces["player"].script_trigger_research("dps-tech_dps-credit-translator")
          if average >= 1000 then
            game.forces["player"].script_trigger_research("dps-tech_dps-credit-exchange")
            if average >= 5000 then
              game.forces["player"].script_trigger_research("dps-tech_dps-data-pack")
            end
          end

          local container = item.container
          if average >= 1000000000 then
            container.insert { name = "dps-item_dps-credit-g", count = average / 1000000000 }
            average = average % 1000000000
          end
          
          if average >= 1000000 then
            container.insert { name = "dps-item_dps-credit-m", count = average / 1000000 }
            average = average % 1000000
          end
          
          if average >= 1000 then
            container.insert { name = "dps-item_dps-credit-k", count = average / 1000 }
            average = average % 1000
          end
          
          if average >= 1 then
            container.insert { name = "dps-item_dps-credit-n", count = average }
          end
        end
      end
    end
  end
end)