data:extend {
  {
    type = "recipe",
    name = "dps-recipe_dps-credit-translator_mineral",
    icons = {
      {
        icon = "__base__/graphics/icons/iron-ore.png",
        icon_size = 64,
        scale = 0.25,
        shift = {-8, 0},
      },
      {
        icon = "__base__/graphics/icons/stone.png",
        icon_size = 64,
        scale = 0.25,
        shift = {0, -16},
      },
      {
        icon = "__base__/graphics/icons/copper-ore.png",
        icon_size = 64,
        scale = 0.25,
        shift = {8, 0},
      }
    },
    energy_required = 0.1,
    enabled = false,
    auto_recycle = false,
    subgroup = "dps-item-subgroup_recipe",
    categories = {"dps-recipe-category_dps-credit-translator"},
    ingredients =
    {
      {type = "item", name = "dps-item_dps-credit-n", amount = 1},
    },
    results = {
      { type="item", name="iron-ore",   amount = 1, shared_probability = { min = 0.00, max = 0.333333 }, show_details_in_recipe_tooltip = false },
      { type="item", name="copper-ore", amount = 1, shared_probability = { min = 0.333333, max = 0.666666 }, show_details_in_recipe_tooltip = false },
      { type="item", name="stone",      amount = 1, shared_probability = { min = 0.666666, max = 1 }, show_details_in_recipe_tooltip = false },
    }
  },
  {
    type = "recipe",
    name = "dps-recipe_dps-credit-translator_carbon",
    icons = {
      {
        icon = "__base__/graphics/icons/coal.png",
        icon_size = 64,
        scale = 0.25,
        shift = {-8, 0},
      },
      {
        icon = "__base__/graphics/icons/fluid/crude-oil.png",
        icon_size = 64,
        scale = 0.25,
        shift = {0, -16},
      },
      {
        icon = "__base__/graphics/icons/wood.png",
        icon_size = 64,
        scale = 0.25,
        shift = {8, 0},
      },
    },
    energy_required = 0.1,
    enabled = false,
    auto_recycle = false,
    subgroup = "dps-item-subgroup_recipe",
    categories = {"dps-recipe-category_dps-credit-translator"},
    ingredients =
    {
      {type = "item", name = "dps-item_dps-credit-n", amount = 1},
    },
    results = {
      { type="item", name="coal",       amount = 1, shared_probability = { min = 0.00, max = 0.333333 }, show_details_in_recipe_tooltip = false },
      { type="item", name="wood",       amount = 1, shared_probability = { min = 0.333333, max = 0.666666 }, show_details_in_recipe_tooltip = false },
      { type="fluid", name="crude-oil", amount = 10, shared_probability = { min = 0.666666, max = 1 }, show_details_in_recipe_tooltip = false },
    }
  },
}