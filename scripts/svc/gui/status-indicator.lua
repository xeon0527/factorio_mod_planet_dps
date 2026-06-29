local __MODULE__ = {}
local __PREFIX = "dps-gui_status-indicator"

local function __is_opened(player)
  for _, gui in pairs(player.gui.top.children) do
    if gui.valid and gui.name == (__PREFIX.."-frame") then
      return true
    end
  end
  return false
end



__MODULE__.create = function(player)
  if __is_opened(player) then return false end

  local frame = player.gui.top.add {
    type = "frame",
    name = __PREFIX.."-frame",
    direction = "horizontal",
    style = "slot_window_frame",
  }
  frame.style.vertically_stretchable = false
  frame.style.width = 300
  frame.style.height = 60
  frame.style.horizontal_align = "left"
  frame.style.padding = 0

  local dps_icon = frame.add {
    type = "sprite-button",
    sprite= "space-location/dps-planet_dps",
    style = "shortcut_bar_button",
    name = "dps-icon",
  }

  dps_icon.style.width = 50
  dps_icon.style.height = 50

  local v_flow = frame.add { type = "flow", direction = "vertical" }
  v_flow.style.vertical_spacing = 0


  local h_flow_1= v_flow.add { type = "flow", direction = "horizontal" }

  local level_caption = h_flow_1.add {
    type = "label",
    caption = "Level",
    style = "bold_green_label"
  }
  level_caption.style.width = 50
  level_caption.style.height = 25

  local level_value = h_flow_1.add {
    type = "label",
    caption = "123,456,789"
  }
  level_value.style.height = 25


  --local h_flow_2= v_flow.add { type = "flow", direction = "horizontal" }

  --local credit_caption = h_flow_2.add {
  --  type = "label",
  --  caption = "Credit",
  --  style = "caption_label"
  --}
  --credit_caption.style.width = 50
  --credit_caption.style.height = 25
  
  --local credit_value = h_flow_2.add {
  --  type = "label",
  --  caption = "123,456,789,123,456,789"
  --}
  --credit_value.style.height = 25


  local h_flow_3 = v_flow.add { type = "flow", direction = "horizontal" }

  local dps_caption = h_flow_3.add {
    type = "label",
    caption = "DPS",
    style = "bold_red_label"
  }
  dps_caption.style.width = 50
  dps_caption.style.height = 25

  local dps_value = h_flow_3.add {
    type = "label",
    caption = "123,456,789,123,456,789"
  }
  dps_value.style.height = 25

end

__MODULE__.close = function(player)
  if player ~= nil then
    if player.gui.top[__PREFIX.."-frame"] then
      player.gui.top[__PREFIX.."-frame"].destroy();

      --script.raise_event("linox-custom-event_gui-dialog-on-close", {
      --  player = player,
      --  session_name = __get_session(player).name,
      --})
    end
  end
end

return __MODULE__