local __MODULE__ = {}
local _gui_id = "status-window"
local _style_prefix = "dps-status-window_"
local _window = require(__SVC__.."gui/window")

DRV_EVENT_register_handler(defines.events.on_gui_click, function(event)
  if event.player_index and event.element and event.element.valid and event.element.name == "item_invest" then
    local parent = event.element.parent
    if parent.type == "flow" then
      local item_name = parent.name
      script.raise_event("dps-custom-event_on-status-upgrade", {
        player = game.get_player(event.player_index),
        status_name = item_name
      })
    end
  end
end)


local function _create_level_info(frame)
  local level_hdr_flow = frame.add { type = "flow", name = "level_hdr_flow", direction = "horizontal" }
  level_hdr_flow.add { type = "button", name = "level_hdr_level", style = _style_prefix.."level-hdr-level", caption = "DPS Level", enabled = false, }
  level_hdr_flow.add { type = "button", name = "level_hdr_exp",   style = _style_prefix.."level-hdr-exp",   caption = "Experience", enabled = false, }
  level_hdr_flow.add { type = "button", name = "level_hdr_point", style = _style_prefix.."level-hdr-point", caption = "Level Point", enabled = false, }

  local level_item_flow = frame.add { type = "flow", name = "level_item_flow", direction = "horizontal" }
  level_item_flow.add { type = "label",       name = "level_item_level", style = _style_prefix.."level-item-level", }
  level_item_flow.add { type = "progressbar", name = "level_item_exp",   style = _style_prefix.."level-item-exp", }
  level_item_flow.add { type = "label",       name = "level_item_point", style = _style_prefix.."level-item-point", }
end

local function _create_header(frame)
  local hdr_flow = frame.add { type = "flow", name = "hdr_flow", direction = "horizontal" }
  hdr_flow.add { type = "button", name = "hdr_tier",    style = _style_prefix.."hdr-tier",    caption = "Tier",   }
  hdr_flow.add { type = "button", name = "hdr_name",    style = _style_prefix.."hdr-name",    caption = "Name",   }
  hdr_flow.add { type = "button", name = "hdr_level",   style = _style_prefix.."hdr-level",   caption = "Level",  }
  hdr_flow.add { type = "button", name = "hdr_effect",  style = _style_prefix.."hdr-effect",  caption = "Effect", }
  hdr_flow.add { type = "button", name = "hdr_cost",    style = _style_prefix.."hdr-cost",    caption = "Cost",   }
  hdr_flow.add { type = "label",  name = "hdr_invest",  style = _style_prefix.."hdr-invest" }
end

local function _add_item(item_list, status_prototype)
  local item_flow = item_list.add { type = "flow", name = status_prototype.name, direction = "horizontal" }
  item_flow.style.padding = 0
  item_flow.style.margin = 0

  item_flow.add { type = "label",   name = "item_tier",   style = _style_prefix.."item-tier",     caption = status_prototype.tier }
  item_flow.add { type = "label",   name = "item_name",   style = _style_prefix.."item-name",     caption = status_prototype.status_name, tooltip = status_prototype.status_description}
  item_flow.add { type = "label",   name = "item_level",  style = _style_prefix.."item-level",    caption = "" }
  item_flow.add { type = "label",   name = "item_effect", style = _style_prefix.."item-effect",   caption = "" }
  item_flow.add { type = "label",   name = "item_cost",   style = _style_prefix.."item-cost",     caption = "" }
  item_flow.add { type = "button",  name = "item_invest", style = _style_prefix.."item-invest",   caption = "[ + ]" }

  item_list.add { type = "line", direction = "horizontal" }
end

__MODULE__.open = function(player)
  local gui = _window.open(_gui_id, player, "Status")
  if not gui then return end

  local frame = gui.frame
  _create_level_info(frame)
  _create_header(frame)

  local item_scroll = frame.add { type = "scroll-pane", name = "item_list_scoll", horizontal_scroll_policy = "never", vertical_scroll_policy = "always" }
  item_scroll.style.horizontally_stretchable = true
  item_scroll.style.vertically_stretchable = true
  item_scroll.style.padding = 0
  item_scroll.style.margin = 0

  local item_list = item_scroll.add { type = "flow", name = "item_list_flow", direction = "vertical" }
  item_list.style.horizontally_stretchable = true
  item_list.style.vertically_stretchable = true
  item_list.style.padding = 0
  item_list.style.margin = 0

  for _, v in pairs(__SVC_STATUS_PROTOTYPE__) do
    _add_item(item_list, v)
  end
end

__MODULE__.update = function(player, item_instance)
  local gui = _window.is_opened(_gui_id, player)
  if gui and item_instance then
    local pt = __SVC_STATUS_PROTOTYPE__[item_instance.name]
    local item = gui["item_list_scoll"]["item_list_flow"][item_instance.name]

    item["item_level"].caption  = item_instance.level
    item["item_level"].tooltip  = item_instance.level.." / "..pt.max_level

    item["item_effect"].caption = {"", "+", pt.effect_per_level_func(item_instance.level), pt.effect_unit }

    if pt.max_level > item_instance.level then
      item["item_cost"].caption = item_instance.cost
      if pt.condition_func then
        if pt.condition_func(pt) then
          item["item_name"].style.font_color = {1,1,1}
          item["item_invest"].enabled = true
        else
          item["item_name"].style.font_color = {0.4, 0.4, 0.4}
          item["item_invest"].enabled = false
        end
      else
        item["item_name"].style.font_color = {1,1,1}
        item["item_invest"].enabled = true
      end
    else
      item["item_name"].style.font_color = {1,1,0}
      item["item_cost"].caption = "-"
      item["item_invest"].enabled = false
    end
  end
end

__MODULE__.update_level = function(player, level, exp, max_exp, level_point)
  local gui = _window.is_opened(_gui_id, player)
  if gui and gui["level_item_flow"] then
    gui["level_item_flow"]["level_item_level"].caption = level
    gui["level_item_flow"]["level_item_exp"].caption = exp.." / "..max_exp
    gui["level_item_flow"]["level_item_exp"].value = exp / max_exp
    gui["level_item_flow"]["level_item_point"].caption = level_point
  end
end

__MODULE__.is_opened = function(player)
  return _window.is_opened(_gui_id, player) ~= nil
end

return __MODULE__