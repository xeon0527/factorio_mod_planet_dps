data:extend {
-- Tier 1 --------------------------------------------------
  {
    type = "technology",
    name = "dps-tech_apfsds-shell-enhancement-chance",
    icons = {
      {
        icon = __PATH__.."graphics/icons/apfsds-shell-256.png",
        icon_size = 256,
      },
      {
        icon = __PATH__.."graphics/icons/enhancement-chance.png",
        icon_size = 128,
        scale = 0.5,
        shift = {40, 40},
        floating = true
      }
    },
    prerequisites = { "dps-tech_dps-equipment-enhancer" },
    max_level = 60,
    upgrade = true,
    unit = { count_formula = "0", ingredients = {}, time = 1 },
    effects =
    {
      { type = "change-recipe-productivity", recipe = "dps-ammo_apfsds-shell_2", change = 0.025, },
      { type = "change-recipe-productivity", recipe = "dps-ammo_apfsds-shell_3", change = 0.025, },
      { type = "change-recipe-productivity", recipe = "dps-ammo_apfsds-shell_4", change = 0.025, },
      { type = "change-recipe-productivity", recipe = "dps-ammo_apfsds-shell_5", change = 0.025, },
    },
    hidden = true,
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
        scale = 0.75,
        shift = {50, 50},
        floating = true
      }
    },
    prerequisites = { "dps-tech_dps-equipment-enhancer" },
    max_level = 30,
    upgrade = true,
    unit = { count_formula = "0", ingredients = {}, time = 1 },
    effects =
    {
      { type = "change-recipe-productivity", recipe = "dps-ammo_apfsds-shell_1", change = 0.1, },
    },
    hidden = true,
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
        scale = 0.75,
        shift = {50, 50},
        floating = true
      }
    },
    prerequisites = { "dps-tech_dps-equipment-enhancer" },
    max_level = 40,
    upgrade = true,
    unit = { count_formula = "0", ingredients = {}, time = 1 },
    effects =
    {
      { type = "gun-speed", ammo_category = "apfsds-shell", modifier = 0.1, },
    },
    hidden = true,
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
        scale = 0.75,
        shift = {50, 50},
        floating = true
      }
    },
    prerequisites = { "dps-tech_dps-equipment-enhancer" },
    max_level = 50,
    upgrade = true,
    unit = { count_formula = "0", ingredients = {}, time = 1 },
    effects =
    {
      { type = "ammo-damage", ammo_category = "apfsds-shell", modifier = 0.1, },
    },
    hidden = true,
  },



  
-- Tier 2 --------------------------------------------------
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
        scale = 0.75,
        shift = {50, 50},
        floating = true
      }
    },
    prerequisites = { "dps-tech_advanced-apfsds-shell" },
    max_level = 50,
    upgrade = true,
    unit = { count_formula = "0", ingredients = {}, time = 1 },
    effects =
    {
      { type = "ammo-damage", ammo_category = "apfsds-shell", modifier = 0.2, },
    },
    hidden = true,
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
        icon = __PATH__.."graphics/icons/enhancement-chance.png",
        icon_size = 128,
        scale = 0.5,
        shift = {40, 40},
        floating = true
      }
    },
    prerequisites = { "dps-tech_advanced-apfsds-shell" },
    max_level = 50,
    upgrade = true,
    unit = { count_formula = "0", ingredients = {}, time = 1 },
    effects =
    {
      { type = "nothing", effect_description = {"technology-description.dps-tech_advanced-apfsds-shell-enhancement-chance_effects"}, },
    },
    hidden = true,
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
        icon = __PATH__.."graphics/icons/destruction-protection.png",
        icon_size = 128,
        scale = 0.5,
        shift = {40, 40},
        floating = true
      }
    },
    prerequisites = { "dps-tech_advanced-apfsds-shell" },
    max_level = 17,
    upgrade = true,
    unit = { count_formula = "0", ingredients = {}, time = 1 },
    effects =
    {
      { type = "nothing", effect_description = {"technology-description.dps-tech_advanced-apfsds-shell-destruction-protection_effects"}, },
    },
    hidden = true,
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
        icon = __PATH__.."graphics/icons/enhancement-chance.png",
        icon_size = 128,
        scale = 0.5,
        shift = {40, 40},
        floating = true
      }
    },
    prerequisites = { "dps-tech_apfsds-machine-gun" },
    max_level = 19,
    upgrade = true,
    unit = { count_formula = "0", ingredients = {}, time = 1 },
    effects =
    {
      { type = "nothing", effect_description = {"technology-description.dps-tech_apfsds-machine-gun-enhancement-chance_effects"}, },
    },
    hidden = true,
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
        icon = __PATH__.."graphics/icons/destruction-protection.png",
        icon_size = 128,
        scale = 0.5,
        shift = {40, 40},
        floating = true
      }
    },
    prerequisites = { "dps-tech_apfsds-machine-gun" },
    max_level = 17,
    upgrade = true,
    unit = { count_formula = "0", ingredients = {}, time = 1 },
    effects =
    {
      { type = "nothing", effect_description = {"technology-description.dps-tech_apfsds-machine-gun-destruction-protection_effects"}, },
    },
    hidden = true,
  },
}