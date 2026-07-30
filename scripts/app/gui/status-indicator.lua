local status_indicator = require(__SVC__.."status-indicator")
local dorax = require(__SVC__.."dorax")

DRV_EVENT_register_handler(defines.events.on_player_joined_game, function(e)
  local p = game.get_player(e.player_index)
  if p then
    local surface_new = p.surface.name
    status_indicator.show(p, surface_new == "dps-planet_dps")
  end
end)
--
--DRV_EVENT_register_handler(defines.events.on_player_controller_changed, function(e)
--  status_indicator.create(game.get_player(e.player_index))
--end)

DRV_EVENT_register_handler(defines.events.on_player_changed_surface, function(e)
  local p = game.get_player(e.player_index)
  if p then
    local surface_old = game.get_surface(e.surface_index).name
    local surface_new = p.surface.name

    status_indicator.show(p, surface_old ~= "dps-planet_dps" and surface_new == "dps-planet_dps")
  end
end)

dorax.add_update_dps_handler(function()
  local dps = dorax.get_dps()
  for _, p in pairs(game.players) do
    status_indicator.set_dps(p, dps)
  end
end)