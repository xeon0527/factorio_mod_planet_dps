data:extend {
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
      count = 125,
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
      count_formula = "100 * (L ^ 1.15)",
      ingredients =
      {
        {"dps-item_dps-data-pack", 3},
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
      count_formula = "200 * (L ^ 1.15)",
      ingredients =
      {
        {"dps-item_dps-data-pack", 3},
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
      count_formula = "100 * (L ^ 1.15)",
      ingredients =
      {
        {"dps-item_dps-data-pack", 3},
        {"dps-item_dorax-fragment", 1},
      },
      time = 1
    },
    max_level = 40,
    upgrade = true,

    effects =
    {
      { type = "gun-speed", ammo_category = "apfsds-shell", modifier = 0.1, },
    },
  },

  {
    type = "technology",
    name = "dps-tech_apfsds-shell-damage",
    order = "dps",
    icons = {
      {
        icon = __PATH__.."/graphics/icons/apfsds-shell-256.png",
        icon_size = 256,
      },
      {
        icon = "__core__/graphics/icons/technology/constants/constant-damage.png",
        icon_size = 128,
        scale = 0.5,
        shift = {50, 50},
        floating = true
      }
    },
    prerequisites = { "dps-tech_dps-equipment-enhancer" },
    unit =
    {
      count_formula = "100 * (L ^ 1.15)",
      ingredients =
      {
        {"dps-item_dps-data-pack", 3},
        {"dps-item_dorax-fragment", 1},
      },
      time = 1
    },
    max_level = 50,
    upgrade = true,

    effects =
    {
      { type = "ammo-damage", ammo_category = "apfsds-shell", modifier = 0.1, },
    },
  },

  {
    type = "technology",
    name = "dps-tech_advanced-dps-engineering",
    order = "dps",
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
    
    prerequisites = { "dps-tech_dps-equipment-enhancer" },
    research_trigger = {
      type = "scripted",
      trigger_description = {"technology-description.dps-tech_advanced-dps-engineering-trigger"}
    },
  },

}