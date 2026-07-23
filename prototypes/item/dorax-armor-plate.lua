local item_sounds = require("__base__.prototypes.item_sounds")

data:extend {
  {
    type = "tool",
    name = "dps-item_dorax-armor-plate",
    icon = "__space-exploration-graphics__/graphics/icons/solar-panel-2.png",
    icon_size = 64,
    subgroup = "dps-item-subgroup_science",
    inventory_move_sound = item_sounds.resource_inventory_move,
    pick_sound = item_sounds.resource_inventory_pickup,
    drop_sound = item_sounds.resource_inventory_move,
    stack_size = 1000,
    default_import_location = "dps-planet_dps",
    weight = 1000*tons,

    order = "d",

    durability = 1,
    durability_description_key = "description.science-pack-remaining-amount-key",
    factoriopedia_durability_description_key = "description.factoriopedia-science-pack-remaining-amount-key",
    durability_description_value = "description.science-pack-remaining-amount-value",

    auto_recycle = false,
  },
}