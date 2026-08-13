local item_sounds = require("__base__.prototypes.item_sounds")
local item_tints = require("__base__.prototypes.item-tints")

data:extend {
  {
    type = "tool",
    name = "dps-item_dps-data-pack",
    icons = {
      { icon = "__space-exploration-graphics__/graphics/icons/catalogue/deep-2.png", },
      { icon = "__space-exploration-graphics__/graphics/icons/catalogue/mask-2.png", tint = {1, 1, 0} }
    },
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
    auto_recycle = false,
    ingredients =
    {
      {type = "item", name = "dps-item_dps-credit_k", amount = 5},
      {type = "item", name = "firearm-magazine", amount = 2},
      {type = "item", name = "piercing-rounds-magazine", amount = 1},
    },
    energy_required = 5,
    results = {{type="item", name="dps-item_dps-data-pack", amount=1}},
    allow_productivity = true
  },



  {
    type = "tool",
    name = "dps-item_dps-data-pack2",
    icons = {
      { icon = "__space-exploration-graphics__/graphics/icons/catalogue/deep-3.png", },
      { icon = "__space-exploration-graphics__/graphics/icons/catalogue/mask-3.png", tint = {1, 1, 0} }
    },
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
    name = "dps-item_dps-data-pack2",
    categories = {"advanced-crafting", "electromagnetics"},
    surface_conditions = __PLANET_CONDITIONS__,
    enabled = false,
    auto_recycle = false,
    ingredients =
    {
      {type = "item", name = "dps-item_dps-credit_k", amount = 25},
      {type = "item", name = "gun-turret", amount = 1},
      {type = "item", name = "submachine-gun", amount = 1},
      {type = "item", name = "rocket-launcher", amount = 1},
      {type = "item", name = "flamethrower", amount = 1},
      {type = "item", name = "grenade", amount = 1},
      {type = "item", name = "dps-item_dorax-fragment", amount = 1},
    },
    energy_required = 10,
    results = {{type="item", name="dps-item_dps-data-pack2", amount=1}},
    allow_productivity = true
  },



  {
    type = "tool",
    name = "dps-item_dps-data-pack3",
    icons = {
      { icon = "__space-exploration-graphics__/graphics/icons/catalogue/deep-4.png", },
      { icon = "__space-exploration-graphics__/graphics/icons/catalogue/mask-4.png", tint = {1, 1, 0} }
    },
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
    name = "dps-item_dps-data-pack3",
    categories = {"advanced-crafting", "electromagnetics"},
    surface_conditions = __PLANET_CONDITIONS__,
    enabled = false,
    auto_recycle = false,
    ingredients =
    {
      {type = "item", name = "dps-item_dps-credit_k", amount = 150},
      {type = "item", name = "piercing-shotgun-shell", amount = 1},
      {type = "item", name = "cannon-shell", amount = 1},
      {type = "item", name = "rocket", amount = 1},
      {type = "item", name = "flamethrower-ammo", amount = 1},
      {type = "item", name = "cluster-grenade", amount = 1},
      {type = "item", name = "dps-item_dorax-component", amount = 2},
    },
    energy_required = 16,
    results = {{type="item", name="dps-item_dps-data-pack3", amount=2}},
    allow_productivity = true
  }
}