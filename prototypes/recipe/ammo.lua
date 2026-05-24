data:extend {
  {
    type = "recipe",
    name = "dps-recipe_concrete-magazine",
    icons = {
      {
        icon = "__base__/graphics/icons/firearm-magazine.png",
        icon_size = 64,
      },
      {
        icon = "__base__/graphics/icons/concrete.png",
        icon_size = 64,
        scale = 0.25,
        shift = {-10, 10},
        floating = true,
      }
    },
    enabled = true,
    energy_required = 1,
    auto_recycle = false,
    ingredients = {
      { type = "item", name = "iron-plate", amount = 1 },
      { type = "item", name = "concrete", amount = 1 },
    },
    results = {{type="item", name="firearm-magazine", amount=1}}
  },
  {
    type = "recipe",
    name = "dps-recipe_copper-magazine",
    icons = {
      {
        icon = "__base__/graphics/icons/firearm-magazine.png",
        icon_size = 64,
      },
      {
        icon = "__base__/graphics/icons/copper-plate.png",
        icon_size = 64,
        scale = 0.25,
        shift = {-10, 10},
        floating = true,
      }
    },
    enabled = true,
    energy_required = 1,
    auto_recycle = false,
    ingredients = {
      { type = "item", name = "copper-plate", amount = 4 },
    },
    results = {{type="item", name="firearm-magazine", amount=1}}
  }
}