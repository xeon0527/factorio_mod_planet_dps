local item_sounds = require("__base__.prototypes.item_sounds")
local item_tints = require("__base__.prototypes.item-tints")

data:extend {
  {
    type = "tool",
    name = "dps-item_dps-science-pack",
    icon = __G_MOD__.."/graphics/icon/dps-science-pack.png",
    icon_size = 64,
    subgroup = "science-pack",
    order = "zzz",
    --subgroup = "dps-item-subgroup_science",

    inventory_move_sound = item_sounds.science_inventory_move,
    pick_sound = item_sounds.science_inventory_pickup,
    drop_sound = item_sounds.science_inventory_move,

    stack_size = 200,
    default_import_location = "dps-planet_dps",
    weight = 1*kg,

    durability = 1,
    durability_description_key = "description.science-pack-remaining-amount-key",
    factoriopedia_durability_description_key = "description.factoriopedia-science-pack-remaining-amount-key",
    durability_description_value = "description.science-pack-remaining-amount-value",
    random_tint_color = item_tints.bluish_science
  },
  {
    type = "recipe",
    name = "dps-item_dps-science-pack",
    categories = {"advanced-crafting", "electromagnetics"},
    surface_conditions =
    {
      {
        property = "pressure",
        min = __G_PLANET__.pressure,
        max = __G_PLANET__.pressure
      },
      {
        property = "magnetic-field",
        min = __G_PLANET__.magnetic_field,
        max = __G_PLANET__.magnetic_field
      },
      {
        property = "gravity",
        min = __G_PLANET__.gravity,
        max = __G_PLANET__.gravity
      },
    },
    enabled = false,
    ingredients =
    {
      {type = "item", name = "dps-item_promethium-subcore-fragment", amount = 1},
      {type = "item", name = "accumulator", amount = 1},
      {type = "item", name = "piercing-rounds-magazine", amount = 1},
    },
    energy_required = 10,
    results = {{type="item", name="dps-item_dps-science-pack", amount=1}},
    allow_productivity = true
  }
}

table.insert(data.raw.lab["lab"].inputs, "dps-item_dps-science-pack")