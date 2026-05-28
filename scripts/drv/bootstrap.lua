__DRV_BOOTSTRAP_HANDLERS__ = {
  on_init = {},
  on_configuration_changed = {},
  on_load = {},
}

script.on_init(function()
  storage.__RNDG__ = storage.__RNDG__ or game.create_random_generator()

  for _, hdrs in pairs(__DRV_BOOTSTRAP_HANDLERS__.on_init) do
    hdrs()
  end
end)

script.on_configuration_changed(function()
  for _, hdrs in pairs(__DRV_BOOTSTRAP_HANDLERS__.on_configuration_changed) do
    hdrs()
  end
end)

script.on_load(function()
  for _, hdrs in pairs(__DRV_BOOTSTRAP_HANDLERS__.on_load) do
    hdrs()
  end
end)

script.on_nth_tick(1, function()
  local obj = DRV_STORAGE_get("DRV_BOOTSTRAP_OBJECT", { on_tick= {}})

  for _, hdrs in pairs(obj.on_tick) do
    hdrs.tick = hdrs.tick - 1
    if hdrs.tick <= 0 then
      hdrs.handler()
      hdrs.tick = hdrs.max_tick
    end
  end
end)

function DRV_BOOTSTRAP_create_init_handler(handler)
  table.insert(__DRV_BOOTSTRAP_HANDLERS__.on_init, handler)
end

function DRV_BOOTSTRAP_create_configuration_changed_handler(handler)
  table.insert(__DRV_BOOTSTRAP_HANDLERS__.on_configuration_changed, handler)
end

function DRV_BOOTSTRAP_create_load_handler(handler)
  table.insert(__DRV_BOOTSTRAP_HANDLERS__.on_load, handler)
end

function DRV_BOOTSTRAP_create_tick_handler(tick, handler)
  local _tick = tick
  if _tick <= 0 then
    _tick = 1
  end

  local obj = DRV_STORAGE_get("DRV_BOOTSTRAP_OBJECT", { on_tick= {}})
  table.insert(obj.on_tick, {
    max_tick = _tick,
    tick = 1,
    handler = handler,
  })
end