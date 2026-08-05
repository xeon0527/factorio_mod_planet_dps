local _gui_root = data.raw["gui-style"]["default"]

local _prefix = "dps-status-window_"
local _window_width = 756
local _hdr_height = 30

local _tier_width = 60
local _effect_width = 80
local _cost_width = 80
local _invest_width = 60
local _name_width = _window_width - _tier_width - _effect_width - _cost_width - _invest_width - 12

local _item_height = 40
local _item_padding = 5

_gui_root[_prefix.."hdr-tier"] = {
  type = "button_style",
  parent = "button",
  width = _tier_width,
  height = _hdr_height,
  left_margin = 4,
}

_gui_root[_prefix.."hdr-name"] = {
  type = "button_style",
  parent = "button",
  width  = _name_width,
  height = _hdr_height,
}

_gui_root[_prefix.."hdr-effect"] = {
  type = "button_style",
  parent = "button",
  width = _effect_width,
  height = _hdr_height,
}

_gui_root[_prefix.."hdr-cost"] = {
  type = "button_style",
  parent = "button",
  width = _cost_width,
  height = _hdr_height,
}

_gui_root[_prefix.."hdr-invest"] = {
  type = "label_style",
  parent = "label",
  width = _invest_width,
  height = _hdr_height,
}



_gui_root[_prefix.."item-tier"] = {
  type = "label_style",
  parent = "label",
  width = _tier_width,
  height = _item_height,
  horizontal_align = "center",
  vertical_align = "center",
  padding = _item_padding,
}

_gui_root[_prefix.."item-name"] = {
  type = "label_style",
  parent = "label",
  width  = _name_width,
  height = _item_height,
  horizontal_align = "left",
  vertical_align = "center",
  padding = _item_padding,
}

_gui_root[_prefix.."item-effect"] = {
  type = "label_style",
  parent = "label",
  width = _effect_width,
  height = _item_height,
  horizontal_align = "center",
  vertical_align = "center",
  padding = _item_padding,
}

_gui_root[_prefix.."item-cost"] = {
  type = "label_style",
  parent = "label",
  width = _cost_width,
  height = _item_height,
  horizontal_align = "center",
  vertical_align = "center",
  padding = _item_padding,
}

_gui_root[_prefix.."item-invest"] = {
  type = "button_style",
  parent = "button",
  width = _invest_width,
  height = _item_height,
  horizontal_align = "center",
  vertical_align = "center",
  padding = _item_padding,
}