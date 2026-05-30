data:extend {
  {
    type = "technology",
    name = "dps-tech_planet-discovery-dps",
    order = "dps",
    icons = PlanetsLib.technology_icon_constant_planet(__G_MOD__.."/graphics/planet/512.png", 512),
    essential = true,
    effects =
    {
      {
        type = "unlock-space-location",
        space_location = "dps-planet_dps",
        use_icon_overlay_constant = true
      }
    },
    prerequisites = { "gun-turret", "electromagnetic-science-pack", "physical-projectile-damage-6"},
    unit =
    {
      count = 1000,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
        {"utility-science-pack", 1},
        {"space-science-pack", 1},
        {"electromagnetic-science-pack", 1}
      },
      time = 60
    }
  },
  {
    type = "technology",
    name = "dps-tech_subcore-scrap-recycling",
    order = "dps",
    icons = {
      {
        icon = "__base__/graphics/technology/research-speed.png",
        icon_size = 256,
        tint = { 1.0, 0.5, 0.5 },
      },
      {
        icon = "__core__/graphics/icons/technology/constants/constant-damage.png",
        icon_size = 128,
        scale = 0.5,
        shift = {50, 50},
        floating = true
      }
    },
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "dps-recipe_subcore-scrap-recycling",
      },
    },
    prerequisites = { "dps-tech_planet-discovery-dps"},
    research_trigger = {
      type = "scripted",
      trigger_description = {"technology-description.dps-tech_subcore-scrap-recycling-trigger"}
    },
  },
  {
    type = "technology",
    name = "dps-tech_cheap-magazine",
    order = "dps",
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
      {
        icon = "__base__/graphics/icons/plastic-bar.png",
        icon_size = 64,
        scale = 0.75,
        shift = {5, 50},
        floating = true
      },
      {
        icon = "__base__/graphics/icons/copper-plate.png",
        icon_size = 64,
        scale = 0.75,
        shift = {40, 40},
        floating = true
      }
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
    prerequisites = { "dps-tech_subcore-scrap-recycling"},
    research_trigger = {
      type = "scripted",
      trigger_description = {"technology-description.dps-tech_cheap-magazine-trigger"}
    },
  },


  {
    type = "technology",
    name = "dps-tech_dps-science-pack",
    order = "dps",
    icon = __G_MOD__.."/graphics/icon/dps-science-pack_256.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "dps-item_dps-science-pack",
      },
    },
    prerequisites = { "dps-tech_subcore-scrap-recycling"},
    research_trigger = {
      type = "craft-item",
      item = "dps-item_promethium-subcore-fragment",
      count = 100,
    },
  },

  {
    type = "technology",
    name = "dps-tech_basic-dps-upgrade",
    order = "dps",
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
        shift = {-47.5, 40},
        floating = true
      },
      {
        icon = "__core__/graphics/icons/technology/constants/constant-damage.png",
        icon_size = 128,
        scale = 0.5,
        shift = {7.5, 50},
        floating = true
      },
      {
        icon = "__core__/graphics/icons/technology/constants/constant-damage.png",
        icon_size = 128,
        scale = 0.5,
        shift = {57.5, 40},
        floating = true
      },
    },
    
    prerequisites = { "dps-tech_dps-science-pack" },
    unit =
    {
      count_formula = "L*500",
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
        {"utility-science-pack", 1},
        {"space-science-pack", 1},
        {"military-science-pack", 1},
        {"dps-item_dps-science-pack", 1},
      },
      time = 60
    },
    max_level = 100,
    upgrade = true,
    ignore_tech_cost_multiplier = true,
  }
}