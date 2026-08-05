data:extend {
  {
    type = "technology",
    name = "dps-tech_armory",
    icon = "__space-exploration-graphics__/graphics/technology/space-assembling.png",
    icon_size = 128,
    prerequisites = { "dps-tech_advanced-dps-engineering" ,"automation-3"},
    unit =
    {
      count = 500,
      ingredients =
      {
        {"dps-item_dps-data-pack", 10},
        {"dps-item_dorax-armor-plate", 1},
      },
      time = 1,
    },
    effects =
    {
      { type = "unlock-recipe", recipe = "dps-building_armory" },
    },
  },

  {
    type = "technology",
    name = "dps-tech_apfsds-machine-gun",
    essential = true,
    icons = {
      {
        icon = "__base__/graphics/technology/artillery-speed.png",
        icon_size = 256,
        tint = { 1.0, 1.0, 0.0 }
      },
    },
    prerequisites = { "dps-tech_supersonic-grenade-launcher" },
    unit =
    {
      count = 500,
      ingredients =
      {
        {"dps-item_dps-data-pack",  5},
        {"dps-item_dorax-component", 1},
      },
      time = 1,
    },
    effects =
    {
      { type = "unlock-recipe", recipe = "dps-turret_apfsds-machine-gun_1" },
      { type = "unlock-recipe", recipe = "dps-turret_apfsds-machine-gun_2" },
      { type = "unlock-recipe", recipe = "dps-turret_apfsds-machine-gun_3" },
      { type = "unlock-recipe", recipe = "dps-turret_apfsds-machine-gun_4" },
      { type = "unlock-recipe", recipe = "dps-turret_apfsds-machine-gun_5" },
    },
  },

  {
    type = "technology",
    name = "dps-tech_advanced-apfsds-shell",
    essential = true,
    icons = {
      {
        icon = __PATH__.."graphics/icons/apfsds-shell-256.png",
        icon_size = 256,
        tint = {1.0, 1.0, 0.5}
      },
    },
    prerequisites = { "dps-tech_supersonic-grenade-launcher" },
    unit =
    {
      count = 500,
      ingredients =
      {
        {"dps-item_dps-data-pack",  5},
        {"dps-item_dorax-component", 1},
      },
      time = 1,
    },
    effects =
    {
      { type = "unlock-recipe", recipe = "dps-ammo_apfsds-shell_6" },
      { type = "unlock-recipe", recipe = "dps-ammo_apfsds-shell_7" },
      { type = "unlock-recipe", recipe = "dps-ammo_apfsds-shell_8" },
      { type = "unlock-recipe", recipe = "dps-ammo_apfsds-shell_9" },
      { type = "unlock-recipe", recipe = "dps-ammo_apfsds-shell_10" },
    },
  },

  {
    type = "technology",
    name = "dps-tech_advanced-apfsds-shell-damage",
    icons = {
      {
        icon = __PATH__.."graphics/icons/apfsds-shell-256.png",
        icon_size = 256,
        tint = {1.0, 1.0, 0.5}
      },
      {
        icon = "__core__/graphics/icons/technology/constants/constant-damage.png",
        icon_size = 128,
        scale = 0.5,
        shift = {50, 50},
        floating = true
      }
    },
    prerequisites = { "dps-tech_advanced-apfsds-shell" },
    unit =
    {
      count_formula = "100 * (L ^ 1.1)",
      ingredients =
      {
        {"dps-item_dps-data-pack", 3},
        {"dps-item_dorax-component", 1},
      },
      time = 1
    },
    max_level = 50,
    upgrade = true,

    effects =
    {
      { type = "ammo-damage", ammo_category = "apfsds-shell", modifier = 0.2, },
    },
  },

  {
    type = "technology",
    name = "dps-tech_advanced-apfsds-shell-enhancement-chance",
    icons = {
      {
        icon = __PATH__.."graphics/icons/apfsds-shell-256.png",
        icon_size = 256,
        tint = {1.0, 1.0, 0.5}
      },
      {
        icon = "__core__/graphics/icons/technology/constants/constant-movement-speed.png",
        icon_size = 128,
        scale = 0.5,
        shift = {50, 50},
        floating = true
      }
    },
    prerequisites = { "dps-tech_advanced-apfsds-shell" },
    unit =
    {
      count_formula = "100 * (L ^ 1.1)",
      ingredients =
      {
        {"dps-item_dps-data-pack", 3},
        {"dps-item_dorax-component", 1},
      },
      time = 1
    },
    max_level = 50,
    upgrade = true,

    effects =
    {
      { type = "nothing", effect_description = {"technology-description.dps-tech_advanced-apfsds-shell-enhancement-chance_effects"}, },
    },
  },

  {
    type = "technology",
    name = "dps-tech_advanced-apfsds-shell-destruction-protection",
    icons = {
      {
        icon = __PATH__.."graphics/icons/apfsds-shell-256.png",
        icon_size = 256,
        tint = {1.0, 1.0, 0.5}
      },
      {
        icon = "__core__/graphics/icons/technology/constants/constant-battery.png",
        icon_size = 128,
        scale = 0.5,
        shift = {50, 50},
        floating = true
      }
    },
    prerequisites = { "dps-tech_advanced-apfsds-shell" },
    unit =
    {
      count_formula = "200 * (L ^ 1.1)",
      ingredients =
      {
        {"dps-item_dps-data-pack", 3},
        {"dps-item_dorax-component", 1},
      },
      time = 1
    },
    max_level = 17,
    upgrade = true,

    effects =
    {
      { type = "nothing", effect_description = {"technology-description.dps-tech_advanced-apfsds-shell-destruction-protection_effects"}, },
    },
  },



  {
    type = "technology",
    name = "dps-tech_apfsds-machine-gun-enhancement-chance",
    icons = {
      {
        icon = "__base__/graphics/technology/artillery-speed.png",
        icon_size = 256,
        tint = { 1.0, 1.0, 0.0 }
      },
      {
        icon = "__core__/graphics/icons/technology/constants/constant-movement-speed.png",
        icon_size = 128,
        scale = 0.5,
        shift = {50, 50},
        floating = true
      }
    },
    prerequisites = { "dps-tech_apfsds-machine-gun" },
    unit =
    {
      count_formula = "300 * (L ^ 1.1)",
      ingredients =
      {
        {"dps-item_dps-data-pack", 3},
        {"dps-item_dorax-component", 1},
      },
      time = 1
    },
    max_level = 19,
    upgrade = true,

    effects =
    {
      { type = "nothing", effect_description = {"technology-description.dps-tech_apfsds-machine-gun-enhancement-chance_effects"}, },
    },
  },

  {
    type = "technology",
    name = "dps-tech_apfsds-machine-gun-destruction-protection",
    icons = {
      {
        icon = "__base__/graphics/technology/artillery-speed.png",
        icon_size = 256,
        tint = { 1.0, 1.0, 0.0 }
      },
      {
        icon = "__core__/graphics/icons/technology/constants/constant-battery.png",
        icon_size = 128,
        scale = 0.5,
        shift = {50, 50},
        floating = true
      }
    },
    prerequisites = { "dps-tech_apfsds-machine-gun" },
    unit =
    {
      count_formula = "500 * (L ^ 1.1)",
      ingredients =
      {
        {"dps-item_dps-data-pack", 3},
        {"dps-item_dorax-component", 1},
      },
      time = 1
    },
    max_level = 17,
    upgrade = true,

    effects =
    {
      { type = "nothing", effect_description = {"technology-description.dps-tech_apfsds-machine-gun-destruction-protection_effects"}, },
    },
  },


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

    prerequisites = { "dps-tech_advanced-apfsds-shell", "dps-tech_apfsds-machine-gun" },
    research_trigger = {
      type = "scripted",
      trigger_description = {"technology-description.dps-tech_advanced-dps-engineering-trigger"}
    },
  },
}