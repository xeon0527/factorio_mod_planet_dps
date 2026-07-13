local item_sounds = require("__base__.prototypes.item_sounds")


local function _attach_icon(item, icon_path)
  table.insert(item.icons, {
    icon = icon_path,
    icon_size = 64,
    scale = 0.25,
    shift = {8,-8},
    floating = true,
  })
end


local _item = {
  type = "item",
  name = "dps-item_dps-credit-n",
  icons = {
    {
      icon = "__space-exploration-graphics__/graphics/icons/observation-frame-infrared.png",
      icon_size = 64,
    }
  },
  subgroup = "dps-item-subgroup_item",
  inventory_move_sound = item_sounds.resource_inventory_move,
  pick_sound = item_sounds.resource_inventory_pickup,
  drop_sound = item_sounds.resource_inventory_move,
  stack_size = 1000,
  default_import_location = "dps-planet_dps",
  weight = 1*kg,
  auto_recycle = false,
}


local _k = table.deepcopy(_item)
_k.name = "dps-item_dps-credit-k"
_attach_icon(_k, "__base__/graphics/icons/signal/signal_K.png")

local _m = table.deepcopy(_item)
_m.name = "dps-item_dps-credit-m"
_attach_icon(_m, "__base__/graphics/icons/signal/signal_M.png")

local _g = table.deepcopy(_item)
_g.name = "dps-item_dps-credit-g"
_attach_icon(_g, "__base__/graphics/icons/signal/signal_G.png")

local _t = table.deepcopy(_item)
_t.name = "dps-item_dps-credit-t"
_attach_icon(_t, "__base__/graphics/icons/signal/signal_T.png")


data:extend {
  _item,
  _k,
  _m,
  _g,
  _t,
}