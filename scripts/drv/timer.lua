__DRV_TIMER_OBJECTS__ = {
  --on_1s = {},
  on_static_tick = {},
  actions = {},
}

--script.on_nth_tick(60, function()
--  for _, hdrs in pairs(__DRV_TIMER_OBJECTS__.on_1s) do
--    hdrs()
--  end
--end)

script.on_nth_tick(1, function()
  local tim_obj = DRV_STORAGE_get("DRV_TIMER_OBJECT", { tick_timer = {}, single_timer = {} })

  for _, tim in pairs(tim_obj.tick_timer) do
    tim.tick = tim.tick - 1
    __DRV_TIMER_OBJECTS__.actions[tim.action_name](tim.tick)
    if tim.tick <= 0 then
      __LIB__.table.remove(tim_obj.tick_timer, tim)
    end
  end

  for _, tim in pairs(tim_obj.single_timer) do
    tim.tick = tim.tick - 1
    if tim.tick <= 0 then
      __DRV_TIMER_OBJECTS__.actions[tim.action_name]()
      __LIB__.table.remove(tim_obj.single_timer, tim)
    end
  end

  for _, st in pairs(__DRV_TIMER_OBJECTS__.on_static_tick) do
    st.handler()
  end
end)

function DRV_TIMER_register_action(name, action)
  __DRV_TIMER_OBJECTS__.actions[name] = action
end


function DRV_TIMER_create_static_tick_handler(handler)
  table.insert(__DRV_TIMER_OBJECTS__.on_static_tick, {
    handler = handler,
  })
end


function DRV_TIMER_create_tick_timer(max_tick, action_name)
  local _max_tick = max_tick
  if _max_tick <= 0 then
    _max_tick = 1
  end

  local tim_obj = DRV_STORAGE_get("DRV_TIMER_OBJECT", { tick_timer = {}, single_timer = {} })
  table.insert(tim_obj.tick_timer, {
    tick = _max_tick,
    action_name = action_name,
  })
end

function DRV_TIMER_create_single_timer(tick, action_name)
  local _max_tick = tick
  if _max_tick <= 0 then
    _max_tick = 1
  end

  local tim_obj = DRV_STORAGE_get("DRV_TIMER_OBJECT", { tick_timer = {}, single_timer = {} })
  table.insert(tim_obj.single_timer, {
    tick = _max_tick,
    action_name = action_name,
  })
end

--function DRV_TIMER_install_1s_timer(handler)
--  table.insert(__DRV_TIMER_OBJECTS__.on_1s, handler)
--end