local status_instance = require(__APP__.."status-instance")
local status_window = require(__APP__.."gui/status-window")
local level = require(__SVC__.."level")

local function _set_technology_level(name, level)
  local tech = game.forces["player"].technologies["dps-tech_"..name]
  local tech_level = level + 1
  local max_level = tech.prototype.max_level
  if tech_level > max_level then
    tech.level = max_level
    tech.researched = true
  else
    tech.level = tech_level
  end
end

local function _update_status_effect(name, level)
  _set_technology_level(name, level)
end

DRV_EVENT_register_handler("dps-custom-event_on-update-level", function(e)
  for _, p in pairs(game.players) do
    status_window.update_level(p, level.get_level(), level.get_exp(), level.get_max_exp(), level.get_level_point())
  end
end)


local function _update_technology(e)
  for _, p in pairs(game.players) do
    for _, inst in pairs(status_instance.get_all()) do
      status_window.update(p, inst)
    end
  end
end

DRV_EVENT_register_handler(defines.events.on_research_finished, _update_technology)
DRV_EVENT_register_handler(defines.events.on_research_reversed, _update_technology)

DRV_EVENT_register_handler("dps-custom-event_on-status-upgrade", function(e)
  local instance = status_instance.get(e.status_name)
  local pt = __SVC_STATUS_PROTOTYPE__[e.status_name]

  if pt.max_level > instance.level then
    if level.sub_level_point(instance.cost) then
      status_instance.add_level(e.status_name)
      
      _update_status_effect(e.status_name, instance.level)
    else
    end
  end
end)

DRV_EVENT_register_handler("dps-custom-event_on-cleaner", function(e)
  for _, v in pairs(status_instance.get_all()) do
    status_instance.set_level(v.name, 0)
  end
end)