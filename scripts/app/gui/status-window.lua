local __MODULE__ = {}
local _gui_id = "status-window"
local _window = require(__SVC__.."gui/window")

local function _create_header(parent, caption)
end

__MODULE__.open = function(player)
  local gui = _window.open(_gui_id, player, "Status")
  if not gui then return end

  local frame = gui.frame

  local header_flow = frame.add{ type = "flow",direction = "horizontal" }
  local btn_tier = header_flow.add{
    type="button",
    name="sort_tier",
    caption="Tier ▲"
  }
  btn_tier.style.width = 90
  btn_tier.style.height = 30


  local btn_name = header_flow.add{
      type="button",
      name="sort_name ▲",
      caption="Name"
  }
  btn_name.style.horizontally_stretchable = true
  btn_name.style.height = 30

  local btn_cost = header_flow.add{
      type="button",
      name="sort_cost ▲",
      caption="Required"
  }
  btn_cost.style.width = 120
  btn_cost.style.height = 30

  local btn_click = header_flow.add{
      type="label",
      caption=""
  }
  btn_click.style.width = 60
  btn_click.style.height = 30


  local scroll = frame.add{
    type = "scroll-pane",
    horizontal_scroll_policy = "never",
    vertical_scroll_policy = "always"
  }
  scroll.style.horizontally_stretchable = true
  scroll.style.vertically_stretchable = true

  local table = scroll.add{
    type = "table",
    style = "browse_games_on_lan_table",
    column_count = 3,
  }
  table.style.horizontally_stretchable = true
  table.style.vertically_stretchable = true
end


return __MODULE__