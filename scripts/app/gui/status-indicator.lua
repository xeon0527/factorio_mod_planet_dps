local __MODULE__ = {}
local __PREFIX = "dps-gui_status-indicator"
local _status_window = require(__APP__.."gui/status-window")

local function _get(player)
  return player.gui.top[__PREFIX.."-frame"]
end

local function _is_opened(player)
  if player then
    local gui = _get(player)
    return gui ~= nil and gui.valid
  end
  return false
end

local function _create(player)
  local frame = player.gui.top.add {
    type = "frame",
    name = __PREFIX.."-frame",
    direction = "horizontal",
    style = "slot_window_frame",
  }
  frame.style.vertically_stretchable = false
  frame.style.width = 300
  frame.style.height = 80
  frame.style.horizontal_align = "left"
  frame.style.padding = 0

  local dps_icon = frame.add {
    type = "sprite-button",
    sprite= "space-location/dps-planet_dps",
    style = "shortcut_bar_button",
    name = __PREFIX.."_open-window",
  }

  dps_icon.style.width = 50
  dps_icon.style.height = 75

  local v_flow = frame.add { name = "v-flow", type = "flow", direction = "vertical" }
  v_flow.style.vertical_spacing = 0


  local h_flow_1= v_flow.add { name = "level-flow", type = "flow", direction = "horizontal" }

  local level_caption = h_flow_1.add {
    type = "label",
    caption = "Level",
    style = "bold_green_label"
  }
  level_caption.style.width = 50
  level_caption.style.height = 25
  level_caption.style.horizontal_align = "left"
  level_caption.style.vertical_align = "center"

  local level_value = h_flow_1.add {
    type = "label",
    name = "level_value",
    caption = "0"
  }
  level_value.style.width = 175
  level_value.style.height = 25
  level_value.style.horizontal_align = "center"
  level_value.style.vertical_align = "center"


  local h_flow_2= v_flow.add { name = "exp-flow", type = "flow", direction = "horizontal" }

  local exp_caption = h_flow_2.add {
    type = "label",
    caption = "EXP",
    style = "caption_label"
  }
  exp_caption.style.width = 50
  exp_caption.style.height = 25
  exp_caption.style.horizontal_align = "left"
  exp_caption.style.vertical_align = "center"

  local exp_value = h_flow_2.add {
    type = "progressbar",
    name = "exp_value",
    caption = "0%",
    style = "thick_progressbar",
    value = 0.0
  }
  exp_value.style.width = 175
  exp_value.style.height = 25
  exp_value.style.horizontal_align = "center"
  exp_value.style.vertical_align = "center"


  local h_flow_3 = v_flow.add { name = "dps-flow", type = "flow", direction = "horizontal" }

  local dps_caption = h_flow_3.add {
    type = "label",
    caption = "DPS",
    style = "bold_red_label"
  }
  dps_caption.style.width = 50
  dps_caption.style.height = 25
  dps_caption.style.horizontal_align = "left"
  dps_caption.style.vertical_align = "center"

  local dps_value = h_flow_3.add {
    type = "label",
    name = "dps_value",
    caption = "0"
  }
  dps_value.style.width = 175
  dps_value.style.height = 25
  dps_value.style.horizontal_align = "center"
  dps_value.style.vertical_align = "center"
end

local function _remove(player)
  if player ~= nil then
    if player.gui.top[__PREFIX.."-frame"] then
      player.gui.top[__PREFIX.."-frame"].destroy();
    end
  end
end



--DRV_EVENT_register_handler(defines.events.on_gui_click, function(event)
--  if event.player_index and event.element and event.element.valid and event.element.name == __PREFIX.."_open-window" then
--    _status_window.open(game.get_player(event.player_index))
--  end
--end)



__MODULE__.show = function(player, show)
  if show then
    if not _is_opened(player) then
      _create(player)
    end
  else
    if _is_opened(player) then
      _remove(player)
    end
  end
end

__MODULE__.set_level = function(player, level)
  if _is_opened(player) then
    local frame = _get(player)
    local value = frame["v-flow"]["level-flow"]["level_value"]
    value.caption = level
  end
end

__MODULE__.set_exp = function(player, exp, max_exp)
  if _is_opened(player) then
    local frame = _get(player)
    local value = frame["v-flow"]["exp-flow"]["exp_value"]

    local ratio = exp / max_exp

    value.caption = math.floor(ratio * 100).."%"
    value.value = ratio
    value.tooltip = exp.." / "..max_exp
  end
end

__MODULE__.set_dps = function(player, dps)
  if _is_opened(player) then
    local frame = _get(player)
    local value = frame["v-flow"]["dps-flow"]["dps_value"]
    value.caption = dps
  end
end

return __MODULE__