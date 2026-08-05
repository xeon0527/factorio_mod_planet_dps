data:extend {
  {
    type = "technology",
    name = "dps-tech_dps-equipment-enhancer",
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
      { type = "unlock-recipe", recipe = "dps-ammo_apfsds-shell_2" },
      { type = "unlock-recipe", recipe = "dps-ammo_apfsds-shell_3" },
      { type = "unlock-recipe", recipe = "dps-ammo_apfsds-shell_4" },
      { type = "unlock-recipe", recipe = "dps-ammo_apfsds-shell_5" },

    },
  },



  {
    type = "technology",
    name = "dps-tech_supersonic-grenade-launcher",
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
    },
    prerequisites = { "dps-tech_dps-equipment-enhancer" },
    research_trigger = {
      type = "scripted",
      trigger_description = {"technology-description.dps-tech_supersonic-grenade-launcher-trigger"}
    },
    
    effects =
    {
      { type = "unlock-recipe", recipe = "dps-turret_supersonic-grenade-launcher" },
      { type = "unlock-recipe", recipe = "dps-ammo_supersonic-grenade" },
    },
  },

  {
    type = "technology",
    name = "dps-tech_supersonic-grenade_shooting-speed",
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
    prerequisites = { "dps-tech_supersonic-grenade-launcher" },
    unit =
    {
      count_formula = "200 * (L ^ 1.1)",
      ingredients =
      {
        {"dps-item_dps-data-pack", 1},
        {"dps-item_dorax-fragment", 1},
      },
      time = 1
    },
    max_level = 9,
    upgrade = true,

    effects =
    {
      {
        type = "gun-speed",
        ammo_category = "supersonic-grenade",
        modifier = 1.0
      }
    },
  },



  {
    type = "technology",
    name = "dps-tech_apfsds-shell-enhancement-chance",
    icons = {
      {
        icon = __PATH__.."graphics/icons/apfsds-shell-256.png",
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
      { type = "change-recipe-productivity", recipe = "dps-ammo_apfsds-shell_2", change = 0.025, },
      { type = "change-recipe-productivity", recipe = "dps-ammo_apfsds-shell_3", change = 0.025, },
      { type = "change-recipe-productivity", recipe = "dps-ammo_apfsds-shell_4", change = 0.025, },
      { type = "change-recipe-productivity", recipe = "dps-ammo_apfsds-shell_5", change = 0.025, },
    },
  },

  {
    type = "technology",
    name = "dps-tech_apfsds-shell-productivity",
    icons = {
      {
        icon = __PATH__.."graphics/icons/apfsds-shell-256.png",
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
      count_formula = "200 * (L ^ 1.1)",
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
      { type = "change-recipe-productivity", recipe = "dps-ammo_apfsds-shell_1", change = 0.1, },
    },
  },

  {
    type = "technology",
    name = "dps-tech_apfsds-shell-gun-speed",
    icons = {
      {
        icon = __PATH__.."graphics/icons/apfsds-shell-256.png",
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
    icons = {
      {
        icon = __PATH__.."graphics/icons/apfsds-shell-256.png",
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
      { type = "ammo-damage", ammo_category = "apfsds-shell", modifier = 0.1, },
    },
  },
}