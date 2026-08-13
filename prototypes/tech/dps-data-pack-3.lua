data:extend {
  {
    type = "technology",
    name = "dps-tech_advanced-dps-engineering",
    icons = {
      {
        icon = "__base__/graphics/technology/physical-projectile-damage-1.png",
        icon_size = 256,
        tint = { 1.0, 0.66, 0.0 },
      },
      {
        icon = "__core__/graphics/icons/technology/constants/constant-damage.png",
        icon_size = 128,
        scale = 0.5,
        shift = {-40, 40},
        floating = true
      },
      {
        icon = "__core__/graphics/icons/technology/constants/constant-damage.png",
        icon_size = 128,
        scale = 0.5,
        shift = {10, 50},
        floating = true
      },
      {
        icon = "__core__/graphics/icons/technology/constants/constant-damage.png",
        icon_size = 128,
        scale = 0.5,
        shift = {55, 40},
        floating = true
      },
    },

    prerequisites = { "dps-tech_dps-data-pack3" },
    unit =
    {
      count = 500,
      ingredients =
      {
        {"dps-item_dps-data-pack", 1},
        {"dps-item_dps-data-pack2", 1},
        {"dps-item_dps-data-pack3", 1},
      },
      time = 60,
    },
  },

  {
    type = "technology",
    name = "dps-tech_armory",
    icon = "__space-exploration-graphics__/graphics/technology/space-assembling.png",
    icon_size = 128,
    prerequisites = { "dps-tech_dps-data-pack3" ,"automation-3"},
    unit =
    {
      count = 500,
      ingredients =
      {
        {"dps-item_dps-data-pack", 1},
        {"dps-item_dps-data-pack2", 1},
        {"dps-item_dps-data-pack3", 1},
      },
      time = 60,
    },
    effects =
    {
      { type = "unlock-recipe", recipe = "dps-building_armory" },
    },
  },
}