__DRV_BOOTSTRAP_HANDLERS__ = {
  on_init = {},
  on_configuration_changed = {},
  on_load = {},
  on_tick = {},
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
  for _, hdrs in pairs(__DRV_BOOTSTRAP_HANDLERS__.on_tick) do
    hdrs()
  end
end)


local __MODULE__ = {}

__MODULE__.create_init_handler = function(handler)
  table.insert(__DRV_BOOTSTRAP_HANDLERS__.on_init, handler)
end

__MODULE__.create_configuration_changed_handler = function(handler)
  table.insert(__DRV_BOOTSTRAP_HANDLERS__.on_configuration_changed, handler)
end

__MODULE__.create_load_handler = function(handler)
  table.insert(__DRV_BOOTSTRAP_HANDLERS__.on_load, handler)
end

__MODULE__.create_tick_handler = function(handler)
  table.insert(__DRV_BOOTSTRAP_HANDLERS__.on_tick, handler)
end

return __MODULE__