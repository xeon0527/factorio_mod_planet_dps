local item_sounds = require("__base__.prototypes.item_sounds")
local item_tints = require("__base__.prototypes.item-tints")

data:extend {
  {
    type = "tool",
    name = "dps-item_dps-data-pack",
    icons = {
      {
        icon = "__space-exploration-graphics__/graphics/icons/catalogue/material-catalogue-2.png",
        --icon_size = 64,
      },
      {
        icon = "__space-exploration-graphics__/graphics/icons/catalogue/mask-catalogue-2.png",
        --icon_size = 64,
        tint = {1, 0, 0}
      }
    },
    --subgroup = "science-pack",
    order = "a",
    subgroup = "dps-item-subgroup_science",

    inventory_move_sound = item_sounds.science_inventory_move,
    pick_sound = item_sounds.science_inventory_pickup,
    drop_sound = item_sounds.science_inventory_move,

    stack_size = 200,
    default_import_location = "dps-planet_dps",
    weight = 1000*tons,

    durability = 1,
    durability_description_key = "description.science-pack-remaining-amount-key",
    factoriopedia_durability_description_key = "description.factoriopedia-science-pack-remaining-amount-key",
    durability_description_value = "description.science-pack-remaining-amount-value",
    random_tint_color = item_tints.bluish_science
  },
  {
    type = "recipe",
    name = "dps-item_dps-data-pack",
    categories = {"advanced-crafting", "electromagnetics"},
    surface_conditions = __PLANET_CONDITIONS__,
    enabled = false,
    ingredients =
    {
      {type = "item", name = "dps-item_dps-credit-k", amount = 5},
      {type = "item", name = "firearm-magazine", amount = 2},
      {type = "item", name = "piercing-rounds-magazine", amount = 1},
    },
    energy_required = 5,
    results = {{type="item", name="dps-item_dps-data-pack", amount=1}},
    allow_productivity = true
  }
}