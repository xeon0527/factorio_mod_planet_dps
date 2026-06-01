local item_sounds = require("__base__.prototypes.item_sounds")

data:extend {
  {
    type = "item",
    name = "dps-item_dorax-fragment",
    icon = "__space-exploration-graphics__/graphics/icons/contaminated-scrap.png",
    icon_size = 64,
    subgroup = "dps-item-subgroup_item",
    inventory_move_sound = item_sounds.resource_inventory_move,
    pick_sound = item_sounds.resource_inventory_pickup,
    drop_sound = item_sounds.resource_inventory_move,
    stack_size = 50,
    default_import_location = "dps-planet_dps",
    weight = 10*kg,
  },
}