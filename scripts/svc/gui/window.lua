--local db = require("scripts.svc.database")

local _prefix = "dps-gui-window"


local function _get_prefix(gui_id, name)
  local _name = name or "frame"
  return _prefix.."_"..gui_id.."_".._name
end

local function _create_title_bar(gui_name, parent, caption)
  local title_flow = parent.add{
    type = "flow",
    direction = "horizontal",
    style = "horizontal_flow",
  }
  title_flow.style.vertical_align = "center"

  title_flow.add {
    type = "label",
    caption = caption,
    style = "frame_title",
  }

  local title_drag = title_flow.add {
    type = "empty-widget",
    style = "draggable_space",
  }
  title_drag.style.horizontally_stretchable = true
  title_drag.style.height = 24
  title_drag.drag_target = parent
  title_drag.style.left_margin = 10
  title_drag.style.right_margin = 10
  title_drag.style.vertical_align = "center"

  local title_close = title_flow.add {
    type = "button",
    name = _get_prefix(gui_name, "close"),
    caption = "[virtual-signal=shape-diagonal-cross]",
    style = "red_button",
    mouse_button_filter = {"left"},
  }
  title_close.style.size = { 48, 24 }
  title_close.style.padding = 0;
  title_close.style.margin = 0;

  return {
    flow = title_flow,
    drag = title_drag,
    close = title_close,
  }
end

local __MODULE__ = {}

__MODULE__.open = function(gui_id, player, caption)
  if not player or __MODULE__.is_opened(gui_id, player) then return nil end

  local frame = player.gui.screen.add {
    type = "frame",
    name = _get_prefix(gui_id),
    direction = "vertical",
  }
  frame.style.width = 800
  frame.style.height = 600
  frame.style.horizontal_align = "center"
  frame.force_auto_center()
  player.opened = frame

  local title_bar = _create_title_bar(gui_id, frame, caption)

  local session = {
    gui_id = gui_id,
    player = player,
    frame = frame,
    title_bar = title_bar,
  }
  return session
end

__MODULE__.is_opened = function(gui_id, player)
  if player then
    local frame_id = _get_prefix(gui_id)
    local gui = player.gui.screen[frame_id]
    if gui and gui.valid then
      return gui
    end
  end
  return nil
end

__MODULE__.destroy = function(gui_id, player)
  local gui = __MODULE__.is_opened(gui_id, player)
  if gui then
    gui.destroy()
  end
end

DRV_EVENT_register_handler(defines.events.on_gui_click, function(event)
  if event.player_index and event.element and event.element.valid and util.string_starts_with(event.element.name, _prefix) then
    local str = __LIB__.string.split(event.element.name, "_");
    if #str >= 3 and str[#str] == "close" then
      __MODULE__.destroy(str[2], game.get_player(event.player_index))
    end
  end
end)

DRV_EVENT_register_handler(defines.events.on_gui_closed, function(event)
  if event.player_index and event.element and event.element.valid and util.string_starts_with(event.element.name, _prefix) then
    local str = __LIB__.string.split(event.element.name, "_");
    if #str >= 3 and str[#str] == "frame" then
      __MODULE__.destroy(str[2], game.get_player(event.player_index))
    end
  end
end)

return __MODULE__