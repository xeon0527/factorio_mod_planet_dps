local item_sounds = require("__base__.prototypes.item_sounds")

data:extend {
  {
    type = "item",
    name = "dps-item_promethium-subcore-fragment",
    icon = __G_MOD__.."/graphics/icon/promethium-subcore-fragment.png",
    icon_size = 64,

    subgroup = "dps-item-subgroup_science",

    inventory_move_sound  = item_sounds.resource_inventory_move,
    pick_sound            = item_sounds.resource_inventory_pickup,
    drop_sound            = item_sounds.resource_inventory_move,

    stack_size = 200,
    default_import_location = "dps-planet_dps",

    weight = 5*kg,
  },
}