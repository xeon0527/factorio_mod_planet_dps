data:extend {
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
    prerequisites = { "dps-tech_dps-data-pack2" },
    unit =
    {
      count = 500,
      ingredients =
      {
        {"dps-item_dps-data-pack", 1},
        {"dps-item_dps-data-pack2", 1},
      },
      time = 60,
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
        {"dps-item_dps-data-pack2", 1},
      },
      time = 60,
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
    name = "dps-tech_apfsds-machine-gun",
    icons = {
      {
        icon = "__base__/graphics/technology/artillery-speed.png",
        icon_size = 256,
        tint = { 1.0, 1.0, 0.0 }
      },
    },
    prerequisites = { "dps-tech_dps-data-pack2" },
    unit =
    {
      count = 1000,
      ingredients =
      {
        {"dps-item_dps-data-pack",  1},
        {"dps-item_dps-data-pack2", 1},
      },
      time = 60,
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
    icons = {
      {
        icon = __PATH__.."graphics/icons/apfsds-shell-256.png",
        icon_size = 256,
        tint = {1.0, 1.0, 0.5}
      },
    },
    prerequisites = { "dps-tech_dps-data-pack2" },
    unit =
    {
      count = 1000,
      ingredients =
      {
        {"dps-item_dps-data-pack",  1},
        {"dps-item_dps-data-pack2", 1},
      },
      time = 60,
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
    name = "dps-tech_dps-data-pack3",
    essential = true,
    icons = {
      {
        icon = "__space-exploration-graphics__/graphics/technology/catalogue/deep-4.png",
        icon_size = 128,
      },
      {
        icon = "__space-exploration-graphics__/graphics/technology/catalogue/mask-4.png",
        icon_size = 128,
        tint = {1, 1, 0}
      }
    },

    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "dps-item_dps-data-pack3",
      },
    },
    prerequisites = { "dps-tech_dps-data-pack2" },
    research_trigger = {
      type = "scripted",
      trigger_description = {"technology-description.dps-tech_dps-data-pack3_trigger"}
    },
  },
}