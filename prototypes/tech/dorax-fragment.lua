data:extend {
  {
    type = "technology",
    name = "dps-tech_supersonic-grenade_shooting-speed",
    order = "dps",
    icons = {
      {
        icon = "__base__/graphics/technology/gun-turret.png",
        icon_size = 256,
      },
      {
        icon = "__space-age__/graphics/technology/railgun-damage.png",
        icon_size = 256,
        scale = 0.4,
        shift = {0, -25},
        floating = true,
      },
      {
        icon = "__core__/graphics/icons/technology/constants/constant-speed.png",
        icon_size = 128,
        scale = 0.5,
        shift = {50, 50},
        floating = true
      }
    },
    prerequisites = { "dps-tech_dps-supercomputer", "dps-tech_supersonic-grenade-launcher" },
    unit =
    {
      count_formula = "2^((L-1) * 0.5)*500",
      ingredients =
      {
        {"dps-item_dorax-fragment", 1},
      },
      time = 1
    },
    max_level = 18,
    upgrade = true,

    effects =
    {
      {
        type = "gun-speed",
        ammo_category = "supersonic-grenade",
        modifier = 0.5
      }
    },
  },


  {
    type = "technology",
    name = "dps-tech_dps-equipment-enhancer",
    order = "dps",
    icons = {
      {
        icon = "__base__/graphics/technology/gun-turret.png",
        icon_size = 256,
        --tint = { 1.0, 0.5, 0.5 },
      },
      {
        icon = "__core__/graphics/icons/technology/constants/constant-movement-speed.png",
        icon_size = 128,
        scale = 0.5,
        shift = {-40, 40},
        floating = true
      },
      {
        icon = "__core__/graphics/icons/technology/constants/constant-movement-speed.png",
        icon_size = 128,
        scale = 0.5,
        shift = {10, 50},
        floating = true
      },
      {
        icon = "__core__/graphics/icons/technology/constants/constant-movement-speed.png",
        icon_size = 128,
        scale = 0.5,
        shift = {55, 40},
        floating = true
      },
    },
    prerequisites = { "dps-tech_apfsds-cannon", },
    unit =
    {
      count = 250,
      ingredients =
      {
        {"dps-item_dps-data-pack", 10},
        {"dps-item_dorax-fragment", 1},
      },
      time = 1,
    },
    effects =
    {
      { type = "unlock-recipe", recipe = "dps-building_dps-equipment-enhancer" },
      { type = "unlock-recipe", recipe = "dps-ammo_apfsds-shell-2" },
      { type = "unlock-recipe", recipe = "dps-ammo_apfsds-shell-3" },
      { type = "unlock-recipe", recipe = "dps-ammo_apfsds-shell-4" },
      { type = "unlock-recipe", recipe = "dps-ammo_apfsds-shell-5" },

    },
  },



  {
    type = "technology",
    name = "dps-tech_apfsds-shell-enhancement-chance",
    order = "dps",
    icons = {
      {
        icon = __PATH__.."/graphics/icons/apfsds-shell-256.png",
        icon_size = 256,
      },
      {
        icon = "__core__/graphics/icons/technology/constants/constant-movement-speed.png",
        icon_size = 128,
        scale = 0.5,
        shift = {50, 50},
        floating = true
      }
    },
    prerequisites = { "dps-tech_dps-equipment-enhancer" },
    unit =
    {
      count_formula = "100 * (L ^ 1.1)",
      ingredients =
      {
        {"dps-item_dps-data-pack", 1},
        {"dps-item_dorax-fragment", 1},
      },
      time = 1
    },
    max_level = 60,
    upgrade = true,

    effects =
    {
      { type = "change-recipe-productivity", recipe = "dps-ammo_apfsds-shell-2", change = 0.025, },
      { type = "change-recipe-productivity", recipe = "dps-ammo_apfsds-shell-3", change = 0.025, },
      { type = "change-recipe-productivity", recipe = "dps-ammo_apfsds-shell-4", change = 0.025, },
      { type = "change-recipe-productivity", recipe = "dps-ammo_apfsds-shell-5", change = 0.025, },
    },
  },

  {
    type = "technology",
    name = "dps-tech_apfsds-shell-productivity",
    order = "dps",
    icons = {
      {
        icon = __PATH__.."/graphics/icons/apfsds-shell-256.png",
        icon_size = 256,
      },
      {
        icon = "__core__/graphics/icons/technology/constants/constant-recipe-productivity.png",
        icon_size = 128,
        scale = 0.5,
        shift = {50, 50},
        floating = true
      }
    },
    prerequisites = { "dps-tech_dps-equipment-enhancer" },
    unit =
    {
      count_formula = "500 * (L ^ 1.1)",
      ingredients =
      {
        {"dps-item_dps-data-pack", 1},
        {"dps-item_dorax-fragment", 1},
      },
      time = 1
    },
    max_level = 30,
    upgrade = true,

    effects =
    {
      { type = "change-recipe-productivity", recipe = "dps-ammo_apfsds-shell-1", change = 0.1, },
    },
  },

  {
    type = "technology",
    name = "dps-tech_apfsds-shell-gun-speed",
    order = "dps",
    icons = {
      {
        icon = __PATH__.."/graphics/icons/apfsds-shell-256.png",
        icon_size = 256,
      },
      {
        icon = "__core__/graphics/icons/technology/constants/constant-speed.png",
        icon_size = 128,
        scale = 0.5,
        shift = {50, 50},
        floating = true
      }
    },
    prerequisites = { "dps-tech_dps-equipment-enhancer" },
    unit =
    {
      count_formula = "100 * (L ^ 1.1)",
      ingredients =
      {
        {"dps-item_dps-data-pack", 1},
        {"dps-item_dorax-fragment", 1},
      },
      time = 1
    },
    max_level = 50,
    upgrade = true,

    effects =
    {
      { type = "gun-speed", ammo_category = "apfsds-shell", modifier = 0.1, },
    },
  },
}