local _gui_root = data.raw["gui-style"]["default"]

local _prefix = "dps-status-window_"
local _window_width = 756
local _level_hdr_height = 30
local _level_item_height = 30

local _hdr_height = 30

local _tier_width = 60
local _level_width = 100
local _effect_width = 100
local _cost_width = 100
local _invest_width = 60
local _name_width = _window_width - _tier_width - _level_width - _effect_width - _cost_width - _invest_width - 20

local _item_height = 40
local _item_padding = 5


_gui_root[_prefix.."level-hdr-level"] = {
  type = "button_style",
  parent = "button",
  width = _window_width / 3,
  height = _level_hdr_height,
}

_gui_root[_prefix.."level-hdr-exp"] = {
  type = "button_style",
  parent = "button",
  width = _window_width / 3,
  height = _level_hdr_height,
}

_gui_root[_prefix.."level-hdr-point"] = {
  type = "button_style",
  parent = "button",
  width = _window_width / 3,
  height = _level_hdr_height,
}



_gui_root[_prefix.."level-item-level"] = {
  type = "label_style",
  parent = "label",
  width = _window_width / 3,
  height = _level_hdr_height,
  horizontal_align = "center",
  vertical_align = "center",
  padding = _item_padding,
}

_gui_root[_prefix.."level-item-exp"] = {
  type = "progressbar_style",
  parent = "thick_progressbar",
  width = _window_width / 3,
  height = _level_hdr_height,
  horizontal_align = "center",
  vertical_align = "center",
}

_gui_root[_prefix.."level-item-point"] = {
  type = "label_style",
  parent = "label",
  width = _window_width / 3,
  height = _level_hdr_height,
  horizontal_align = "center",
  vertical_align = "center",
  padding = _item_padding,
}



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

_gui_root[_prefix.."hdr-level"] = {
  type = "button_style",
  parent = "button",
  width = _level_width,
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
  left_padding = 40,
}

_gui_root[_prefix.."item-level"] = {
  type = "label_style",
  parent = "label",
  width = _level_width,
  height = _item_height,
  horizontal_align = "center",
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
  font = "default-large-semibold",
  font_color = {1,1,0},
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