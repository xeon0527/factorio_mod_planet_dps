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

function DRV_BOOTSTRAP_create_init_handler(handler)
  table.insert(__DRV_BOOTSTRAP_HANDLERS__.on_init, handler)
end

function DRV_BOOTSTRAP_create_configuration_changed_handler(handler)
  table.insert(__DRV_BOOTSTRAP_HANDLERS__.on_configuration_changed, handler)
end

function DRV_BOOTSTRAP_create_load_handler(handler)
  table.insert(__DRV_BOOTSTRAP_HANDLERS__.on_load, handler)
end