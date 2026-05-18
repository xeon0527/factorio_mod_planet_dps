-- Factorio는 하나의 Event에 하나의 Handler만을 허용하므로 여러개의 Handler를 이용하기 위해 이 모듈을 사용함.
-- + event handler 시스템이 return 값을 허용하지 않아서 관련 기능 추가.

__DRV_EVENT_HANDLERS__ = {
  ["linox-internel-event_on-build-entity"] = {},
  ["linox-internel-event_on-destroy-entity"] = {},
}

function DRV_EVENT_register_handler(event, handler)
  local event_id = event
  if type(event_id) == "string" then
    event_id = script.get_event_id(event)
  end

  if __DRV_EVENT_HANDLERS__[event_id] == nil then
    __DRV_EVENT_HANDLERS__[event_id] = {}

    script.on_event(event, function(_event)
      local handlers = __DRV_EVENT_HANDLERS__[_event.name]
      for _, h in pairs(handlers) do
        h(_event)
      end
    end)
  end

  table.insert(__DRV_EVENT_HANDLERS__[event_id], handler)
end

function DRV_EVENT_register_built_entity_handler(handler)
  table.insert(__DRV_EVENT_HANDLERS__["linox-internel-event_on-build-entity"], handler);
end

function DRV_EVENT_register_destroy_entity_handler(handler)
  table.insert(__DRV_EVENT_HANDLERS__["linox-internel-event_on-destroy-entity"], handler);
end

local function __on_built_entity(event)
  local entity = event.entity or event.destination
  if not (entity and entity.valid) then return end
  local player_index = event.player_index

  if not player_index and event.robot and event.robot.valid then
      local cell = event.robot.logistic_cell
      local owner = cell and cell.owner
      if owner and owner.is_player() then player_index = owner.player.index end
  end
  
  local entity_type = entity.type;
  local entity_name = entity.name;
  if entity_type == "entity-ghost" then
    entity_type = entity.ghost_type;
    entity_name = entity.ghost_name;
  end

  local player = nil;
  if player_index then
    player = game.get_player(player_index)
  end

  local event_data = {
    player = player,
    is_ghost = (entity.type == "entity-ghost"),
    entity = entity,
    entity_type = entity_type,
    entity_name = entity_name,
    set_cancel_message = nil,
  }

  local cancel = false
  for _, proc in pairs(__DRV_EVENT_HANDLERS__["linox-internel-event_on-build-entity"]) do
    event_data.set_cancel_message = nil
    if proc(event_data) == false then
      cancel = true
      break
    end
  end

  -- 이벤트가 취소되면 Player에게 아이템을 반환하거나 바닥에 떨어뜨림.
  if cancel and event.consumed_items then
    --if player and player.admin then
    --  return
    --end

    local items = event.consumed_items.get_contents();
    if player then
      if event_data.set_cancel_message then
        player.print(event_data.set_cancel_message)
      end
      UTIL_insert_item(player, items)
    else
      for _, item in ipairs(items) do
        entity.surface.spill_item_stack {
          position = entity.position,
          enable_looted = true,
          stack = {
            name = item.name;
            count = item.count,
            quality = (type(item.quality) == "table" and item.quality.name) or item.quality,
          }
        }
      end
    end

    entity.destroy{raise_destroy = true};
  end
end

DRV_EVENT_register_handler(defines.events.on_built_entity,                __on_built_entity);
DRV_EVENT_register_handler(defines.events.on_robot_built_entity,          __on_built_entity);
DRV_EVENT_register_handler(defines.events.script_raised_built,            __on_built_entity);
DRV_EVENT_register_handler(defines.events.script_raised_revive,           __on_built_entity);
DRV_EVENT_register_handler(defines.events.on_space_platform_built_entity, __on_built_entity);
DRV_EVENT_register_handler(defines.events.on_entity_cloned,               __on_built_entity);



local function __on_destroy_entity(event)
  local entity = event.entity
  if not (entity and entity.valid) then return end
  local player_index = event.player_index

  if not player_index and event.robot and event.robot.valid then
      local cell = event.robot.logistic_cell
      local owner = cell and cell.owner
      if owner and owner.is_player() then player_index = owner.player.index end
  end
  local player = nil;
  if player_index then
    player = game.get_player(player_index)
  end

  local event_data = {
    player = player,
    entity = entity,
  }

  for _, proc in pairs(__DRV_EVENT_HANDLERS__["linox-internel-event_on-destroy-entity"]) do
    proc(event_data)
  end
end

DRV_EVENT_register_handler(defines.events.on_player_mined_entity,  __on_destroy_entity);
DRV_EVENT_register_handler(defines.events.on_robot_mined_entity,   __on_destroy_entity);
DRV_EVENT_register_handler(defines.events.on_entity_died,          __on_destroy_entity);
DRV_EVENT_register_handler(defines.events.script_raised_destroy,   __on_destroy_entity);