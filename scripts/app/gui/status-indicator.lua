

local function _open_gui()

end

local status_indicator = require("scripts/svc/gui/status-indicator")

DRV_EVENT_register_handler(defines.events.on_player_joined_game, function(e)
  status_indicator.create(game.get_player(e.player_index))
end)

DRV_EVENT_register_handler(defines.events.on_player_controller_changed, function(e)
  status_indicator.create(game.get_player(e.player_index))
end)

DRV_EVENT_register_handler(defines.events.on_player_changed_surface, function(e)
  status_indicator.create(game.get_player(e.player_index))
end)