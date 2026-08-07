local indicator = require(__APP__.."gui/indicator")
local status_window = require(__APP__.."gui/status-window")
local status_instance = require(__APP__.."status-instance")
local dorax = require(__SVC__.."dorax")
local level = require(__SVC__.."level")

local function _update_indicator(player)
  indicator.set_level (player, level.get_level())
  indicator.set_exp   (player, level.get_exp(), level.get_max_exp())
  indicator.set_dps   (player, dorax.get_dps())
end

DRV_EVENT_register_handler(defines.events.on_player_joined_game, function(e)
  local p = game.get_player(e.player_index)
  if p then
    local show = p.surface.name == "dps-planet_dps"
    indicator.show(p, show)
    if show then
      _update_indicator(p)
    end
  end
end)

--DRV_EVENT_register_handler(defines.events.on_player_controller_changed, function(e)
--  indicator.show(game.get_player(e.player_index))
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
    indicator.show(p, show)
    if show then
      _update_indicator(p)
    end
  end
end)

DRV_EVENT_register_handler("dps-custom-event_on-update-level", function(e)
  for _, p in pairs(game.players) do
    _update_indicator(p)
  end
end)

DRV_EVENT_register_handler("dps-custom-event_on-indicator-icon-click", function(e)
  if not status_window.is_opened(e.player) then
    status_instance.update_all()
    status_window.open(e.player)
    status_window.update_level(e.player, level.get_level(), level.get_exp(), level.get_max_exp(), level.get_level_point())
    for _, v in pairs(status_instance.get_all()) do
      status_window.update(e.player, v)
    end
  end
end)

DRV_EVENT_register_handler("dps-custom-event_on-cleaner", function(e)
  for _, p in pairs(game.players) do
    indicator.show(p, false)
  end
end)