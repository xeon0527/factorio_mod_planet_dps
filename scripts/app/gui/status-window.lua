local __MODULE__ = {}
local _gui_id = "status-window"
local _style_prefix = "dps-status-window_"
local _window = require(__SVC__.."gui/window")

local function _create_header(parent, caption)
end

__MODULE__.open = function(player)
  local gui = _window.open(_gui_id, player, "Status")
  if not gui then return end

  local frame = gui.frame

  local hdr_flow = frame.add { type = "flow", name = "hdr_flow", direction = "horizontal" }
  hdr_flow.add { type = "button", name = "hdr_tier",    style = _style_prefix.."hdr-tier", caption = "Tier" }
  hdr_flow.add { type = "button", name = "hdr_name",    style = _style_prefix.."hdr-name", caption = "Name" }
  hdr_flow.add { type = "button", name = "hdr_effect",  style = _style_prefix.."hdr-effect", caption = "Effect" }
  hdr_flow.add { type = "button", name = "hdr_cost",    style = _style_prefix.."hdr-cost", caption = "Cost" }
  hdr_flow.add { type = "label",  name = "hdr_invest",  style = _style_prefix.."hdr-invest" }


  local item_scroll = frame.add { type = "scroll-pane", horizontal_scroll_policy = "never", vertical_scroll_policy = "always" }
  item_scroll.style.horizontally_stretchable = true
  item_scroll.style.vertically_stretchable = true
  item_scroll.style.padding = 0
  item_scroll.style.margin = 0

  local item_list = item_scroll.add { type = "flow", name = "item_list_flow", direction = "vertical" }
  item_list.style.horizontally_stretchable = true
  item_list.style.vertically_stretchable = true
  item_list.style.padding = 0
  item_list.style.margin = 0

  local item_flow1 = item_list.add { type = "flow", name = "item_flow1", direction = "horizontal" }
  item_flow1.style.padding = 0
  item_flow1.style.margin = 0
  item_flow1.add { type = "label", name = "item_tier",  style = _style_prefix.."item-tier", caption = "1" }
  item_flow1.add { type = "label", name = "item_name",  style = _style_prefix.."item-name", caption = "APFSDS 포탄 강화 확률 +1%p" }
  item_flow1.add { type = "label", name = "item_effect",  style = _style_prefix.."item-effect", caption = "+30%p" }
  item_flow1.add { type = "label", name = "item_cost",  style = _style_prefix.."item-cost", caption = "7200" }
  item_flow1.add { type = "button",  name = "item_invest", style = _style_prefix.."item-invest", caption = "[ + ]" }

  item_list.add { type = "line", direction = "horizontal" }

  local item_flow2= item_list.add { type = "flow", name = "item_flow2", direction = "horizontal" }
  item_flow2.style.padding = 0
  item_flow2.style.margin = 0
  item_flow2.add { type = "label", name = "item_tier",  style = _style_prefix.."item-tier", caption = "1" }
  item_flow2.add { type = "label", name = "item_name",  style = _style_prefix.."item-name", caption = "APFSDS 포탄 강화 확률 +1%p" }
  item_flow2.add { type = "label", name = "item_effect",  style = _style_prefix.."item-effect", caption = "+30%p" }
  item_flow2.add { type = "label", name = "item_cost",  style = _style_prefix.."item-cost", caption = "7200" }
  item_flow2.add { type = "button",  name = "item_invest", style = _style_prefix.."item-invest", caption = "[ + ]" }

  item_list.add { type = "line", direction = "horizontal" }

  local item_flow3 = item_list.add { type = "flow", name = "item_flow3", direction = "horizontal" }
  item_flow3.style.padding = 0
  item_flow3.style.margin = 0
  item_flow3.add { type = "label", name = "item_tier",  style = _style_prefix.."item-tier", caption = "1" }
  item_flow3.add { type = "label", name = "item_name",  style = _style_prefix.."item-name", caption = "APFSDS 포탄 강화 확률 +1%p" }
  item_flow3.add { type = "label", name = "item_effect",  style = _style_prefix.."item-effect", caption = "+30%p" }
  item_flow3.add { type = "label", name = "item_cost",  style = _style_prefix.."item-cost", caption = "7200" }
  item_flow3.add { type = "button",  name = "item_invest", style = _style_prefix.."item-invest", caption = "[ + ]" }
end


return __MODULE__