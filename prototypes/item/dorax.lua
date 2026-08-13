local item_sounds = require("__base__.prototypes.item_sounds")

data:extend {
  {
    type = "item",
    name = "dps-item_dorax-fragment",
    icon = "__space-exploration-graphics__/graphics/icons/contaminated-scrap.png",
    icon_size = 64,
    subgroup = "dps-item-subgroup_science",
    inventory_move_sound = item_sounds.resource_inventory_move,
    pick_sound = item_sounds.resource_inventory_pickup,
    drop_sound = item_sounds.resource_inventory_move,
    stack_size = 1000,
    default_import_location = "dps-planet_dps",
    weight = 1000*tons,

    order = "b",
    flags = {
      "always-show",
    },
    auto_recycle = false,
  },
  {
    type = "item",
    name = "dps-item_dorax-component",
    icon = "__space-exploration-graphics__/graphics/icons/aeroframe-scaffold.png",
    icon_size = 64,
    subgroup = "dps-item-subgroup_science",
    inventory_move_sound = item_sounds.resource_inventory_move,
    pick_sound = item_sounds.resource_inventory_pickup,
    drop_sound = item_sounds.resource_inventory_move,
    stack_size = 1000,
    default_import_location = "dps-planet_dps",
    weight = 1000*tons,

    order = "c",
    flags = {
      "always-show",
    },
    auto_recycle = false,
  },
}