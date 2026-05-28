__DRV_TIMER_OBJECTS__ = {
  tick_timer = {},
  single_timer = {},
}

DRV_BOOTSTRAP_create_tick_handler(1, function()
  for _, tim in pairs(__DRV_TIMER_OBJECTS__.tick_timer) do
    tim.tick = tim.tick - 1
    tim.handler(tim.tick)
    if tim.tick <= 0 then
      UTIL_table_remove(__DRV_TIMER_OBJECTS__.tick_timer, tim)
    end
  end

  for _, tim in pairs(__DRV_TIMER_OBJECTS__.single_timer) do
    tim.tick = tim.tick - 1
    if tim.tick <= 0 then
      tim.handler()
      UTIL_table_remove(__DRV_TIMER_OBJECTS__.single_timer, tim)
    end
  end
end)

function DRV_TIMER_create_tick_timer(max_tick, handler)
  local _max_tick = max_tick
  if _max_tick <= 0 then
    _max_tick = 1
  end

  table.insert(__DRV_TIMER_OBJECTS__.tick_timer, {
    tick = _max_tick,
    handler = handler,
  })
end

function DRV_TIMER_create_single_timer(tick, handler)
  local _max_tick = tick
  if _max_tick <= 0 then
    _max_tick = 1
  end

  table.insert(__DRV_TIMER_OBJECTS__.single_timer, {
    tick = _max_tick,
    handler = handler,
  })
end