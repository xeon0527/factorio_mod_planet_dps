local status_indicator = require(__APP__.."gui/status-indicator")
local dorax = require(__SVC__.."dorax")
local status = require(__SVC__.."status")

local function _update_status(player)
  status_indicator.set_level(player, status.get_level())
  status_indicator.set_exp(player, status.get_exp(), status.get_max_exp())
  status_indicator.set_dps(player, dorax.get_dps())
end

DRV_EVENT_register_handler(defines.events.on_player_joined_game, function(e)
  local p = game.get_player(e.player_index)
  if p then
    local show = p.surface.name == "dps-planet_dps"
    status_indicator.show(p, show)
    if show then
      _update_status(p)
    end
  end
end)

--DRV_EVENT_register_handler(defines.events.on_player_controller_changed, function(e)
--  status_indicator.show(game.get_player(e.player_index))
--end)

DRV_EVENT_register_handler(defines.events.on_player_changed_surface, function(e)
  local p = game.get_player(e.player_index)
  if p then
    local surface_old_name = ""
    if e.surface_index then
      local surface_old = game.get_surface(e.surface_index)
      if surface_old then
        surface_old_name = surface_old.name
      end
    end
    
    local surface_new_name = p.surface.name
    local show = surface_old_name ~= "dps-planet_dps" and surface_new_name == "dps-planet_dps"
    status_indicator.show(p, show)
    if show then
      _update_status(p)
    end
  end
end)

dorax.add_update_dps_handler(function()
  local dps = dorax.get_dps()
  status.add_exp(dps)

  for _, p in pairs(game.players) do
    _update_status(p)
  end
end)