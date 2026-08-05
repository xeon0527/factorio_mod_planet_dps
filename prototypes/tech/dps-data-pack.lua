data:extend {
  {
    type = "technology",
    name = "dps-tech_basic-dps-engineering",
    icons = {
      {
        icon = "__base__/graphics/technology/physical-projectile-damage-2.png",
        icon_size = 256,
        tint = { 1.0, 0.5, 0.5 },
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
    
    prerequisites = { "dps-tech_dps-data-pack" },
    unit =
    {
      count = 500,
      ingredients =
      {
        {"dps-item_dps-data-pack", 1},
      },
      time = 1
    },
  },

  {
    type = "technology",
    name = "dps-tech_cheap-magazine",
    icons = {
      {
        icon = "__base__/graphics/technology/physical-projectile-damage-1.png",
        icon_size = 256,
      },
      {
        icon = "__base__/graphics/icons/concrete.png",
        icon_size = 64,
        scale = 0.75,
        shift = {-40, 40},
        floating = true
      },
      --{
      --  icon = "__base__/graphics/icons/plastic-bar.png",
      --  icon_size = 64,
      --  scale = 0.75,
      --  shift = {5, 50},
      --  floating = true
      --},
      {
        icon = "__base__/graphics/icons/copper-plate.png",
        icon_size = 64,
        scale = 0.75,
        shift = {40, 40},
        floating = true
      }
    },
    prerequisites = { "dps-tech_dps-data-pack" },
    unit =
    {
      count = 250,
      ingredients =
      {
        {"dps-item_dps-data-pack", 1},
      },
      time = 1
    },
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "dps-recipe_concrete-magazine",
      },
      {
        type = "unlock-recipe",
        recipe = "dps-recipe_copper-magazine",
      },
    },
  },



  {
    type = "technology",
    name = "dps-tech_apfsds-cannon",
    essential = true,
    icons = {
      {
        icon = "__base__/graphics/technology/artillery.png",
        icon_size = 256,
        tint = { 1.0, 1.0, 0.0 }
      },
    },
    prerequisites = { "dps-tech_discovery-of-dorax", "dps-tech_dps-data-pack"},
    unit =
    {
      count = 500,
      ingredients =
      {
        {"dps-item_dps-data-pack", 1},
      },
      time = 1,
    },
    effects =
    {
      { type = "unlock-recipe", recipe = "dps-turret_apfsds-cannon" },
      { type = "unlock-recipe", recipe = "dps-ammo_apfsds-shell_1" },
    },
  },
}