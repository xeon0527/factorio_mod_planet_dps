local item_sounds = require("__base__.prototypes.item_sounds")

local function _create_credit(name, icon_path)
  data:extend {
    {
      type = "item",
      name = name,
      icon = icon_path,
      icon_size = 64,
      subgroup = "dps-item-subgroup_item",
      inventory_move_sound = item_sounds.resource_inventory_move,
      pick_sound = item_sounds.resource_inventory_pickup,
      drop_sound = item_sounds.resource_inventory_move,
      stack_size = 1000,
      default_import_location = "dps-planet_dps",
      weight = 1*kg,
      auto_recycle = false,
    }
  }
end


_create_credit("dps-item_dps-credit-n", "__space-exploration-graphics__/graphics/icons/observation-frame-radio.png")
_create_credit("dps-item_dps-credit-k", "__space-exploration-graphics__/graphics/icons/observation-frame-microwave.png")
_create_credit("dps-item_dps-credit-m", "__space-exploration-graphics__/graphics/icons/observation-frame-infrared.png")
_create_credit("dps-item_dps-credit-g", "__space-exploration-graphics__/graphics/icons/observation-frame-visible.png")
_create_credit("dps-item_dps-credit-t", "__space-exploration-graphics__/graphics/icons/observation-frame-xray.png")