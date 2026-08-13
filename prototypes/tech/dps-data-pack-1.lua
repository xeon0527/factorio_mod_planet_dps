data:extend {
  {
    type = "technology",
    name = "dps-tech_dorax-analysis",
    icons = {
      {
        icon = __PATH__.."graphics/entity/dorax/item-extractor-hr-animation-1.png",
        icon_size = 530,
      },
      {
        icon = __PATH__.."graphics/entity/dorax/item-extractor-ball2.png",
        icon_size = 530,
        tint = { 1.0, 0.0, 0.0 },
        floating = true
      },
    },
    prerequisites = { "dps-tech_discovery-of-dorax", "dps-tech_dps-data-pack" },
    unit =
    {
      count = 250,
      ingredients =
      {
        {"dps-item_dps-data-pack", 1},
      },
      time = 60
    },
  },

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
      time = 60
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
      time = 60
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
    icons = {
      {
        icon = "__base__/graphics/technology/artillery.png",
        icon_size = 256,
        tint = { 1.0, 1.0, 0.0 }
      },
    },
    prerequisites = { "dps-tech_dorax-analysis", },
    unit =
    {
      count = 500,
      ingredients =
      {
        {"dps-item_dps-data-pack", 1},
      },
      time = 60,
    },
    effects =
    {
      { type = "unlock-recipe", recipe = "dps-turret_apfsds-cannon" },
      { type = "unlock-recipe", recipe = "dps-ammo_apfsds-shell_1" },
      { type = "unlock-recipe", recipe = "dps-ammo_apfsds-shell_2" },
      { type = "unlock-recipe", recipe = "dps-ammo_apfsds-shell_3" },
      { type = "unlock-recipe", recipe = "dps-ammo_apfsds-shell_4" },
      { type = "unlock-recipe", recipe = "dps-ammo_apfsds-shell_5" },
    },
  },

  {
    type = "technology",
    name = "dps-tech_dps-equipment-enhancer",
    icon = "__space-exploration-graphics__/graphics/icons/space-science-lab.png",
    icon_size = 64,
    prerequisites = { "dps-tech_dorax-analysis" },
    unit =
    {
      count = 125,
      ingredients =
      {
        {"dps-item_dps-data-pack", 1},
      },
      time = 60,
    },
    effects =
    {
      { type = "unlock-recipe", recipe = "dps-building_dps-equipment-enhancer" },
    },
  },

  {
    type = "technology",
    name = "dps-tech_status-system",
    icon = __PATH__.."graphics/icons/status-system_256.png",
    icon_size = 256,
    prerequisites = { "dps-tech_dorax-analysis" },
    unit =
    {
      count = 250,
      ingredients =
      {
        {"dps-item_dps-data-pack", 1},
      },
      time = 60,
    },
    effects =
    {
      { type = "nothing", effect_description = {"technology-description.dps-tech_status-system_effects"}, },
    },
  },

  {
    type = "technology",
    name = "dps-tech_dps-data-pack2",
    essential = true,
    icons = {
      {
        icon = "__space-exploration-graphics__/graphics/technology/catalogue/deep-3.png",
        icon_size = 128,
      },
      {
        icon = "__space-exploration-graphics__/graphics/technology/catalogue/mask-3.png",
        icon_size = 128,
        tint = {1, 1, 0}
      }
    },

    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "dps-item_dps-data-pack2",
      },
    },
    prerequisites = { "dps-tech_dorax-analysis" },
    research_trigger = {
      type = "scripted",
      trigger_description = {"technology-description.dps-tech_dps-data-pack2_trigger"}
    },
  },
}