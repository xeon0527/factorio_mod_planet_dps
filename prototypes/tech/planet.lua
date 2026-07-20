data:extend {
  {
    type = "technology",
    name = "dps-tech_planet-discovery-dps",
    order = "dps",
    icons = PlanetsLib.technology_icon_constant_planet(__PATH__.."/graphics/planet/512.png", 512),
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
    name = "dps-tech_dps-scrap-recycling",
    order = "dps",
    icons = {
      {
        icon = "__recycler__/graphics/technology/recycling.png",
        icon_size = 256,
        tint = { 1.0, 1.0, 0.5 },
      },
    },
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "dps-recipe_dps-scrap-recycling",
      },
      {
        type = "unlock-recipe",
        recipe = "recycler"
      },
    },
    prerequisites = { "dps-tech_planet-discovery-dps"},
    research_trigger = {
      type = "mine-entity",
      entities = {
        "dps-resource_dps-scrap"
      }
    },
  },
  {
    type = "technology",
    name = "dps-tech_dps-credit-translator",
    order = "dps",
    icons = {
      {
        icon = __PATH__.."/graphics/entity/dps-credit-translator/atom-forge-icon-big.png",
        icon_size = 640,
        tint = { 1.0, 1.0, 0.0 },
      },
    },
    effects =
    {
      { type = "unlock-recipe", recipe = "dps-building_dps-credit-translator", },
      { type = "unlock-recipe", recipe = "dps-recipe_dps-credit-translator_mineral", },
      { type = "unlock-recipe", recipe = "dps-recipe_dps-credit-translator_carbon", },
    },
    prerequisites = { "dps-tech_planet-discovery-dps"},
    research_trigger = {
      type = "scripted",
      trigger_description = {"technology-description.dps-tech_dps-credit-translator-trigger"}
    },
  },
  {
    type = "technology",
    name = "dps-tech_dps-credit-exchange",
    order = "dps",
    icons = {
      {
        icon = "__space-age__/graphics/technology/lithium-processing.png",
        icon_size = 256,
        tint = { 1.0, 1.0, 0.0 },
      },
      {
        icon = "__core__/graphics/icons/technology/constants/constant-capacity.png",
        icon_size = 128,
        shift = {16, 0},
        floating = true,
      }
    },
    effects =
    {
      { type = "unlock-recipe", recipe = "dps-recipe_dps-credit-exchange-n2k", },
      { type = "unlock-recipe", recipe = "dps-recipe_dps-credit-exchange-k2m", },
      { type = "unlock-recipe", recipe = "dps-recipe_dps-credit-exchange-m2g", },
      { type = "unlock-recipe", recipe = "dps-recipe_dps-credit-exchange-g2t", },

      { type = "unlock-recipe", recipe = "dps-recipe_dps-credit-exchange-k2n", },
      { type = "unlock-recipe", recipe = "dps-recipe_dps-credit-exchange-m2k", },
      { type = "unlock-recipe", recipe = "dps-recipe_dps-credit-exchange-g2m", },
      { type = "unlock-recipe", recipe = "dps-recipe_dps-credit-exchange-t2g", },
    },
    prerequisites = { "dps-tech_dps-credit-translator"},
    research_trigger = {
      type = "scripted",
      trigger_description = {"technology-description.dps-tech_dps-credit-exchange-trigger"}
    },
  },

  {
    type = "technology",
    name = "dps-tech_dps-data-pack",
    order = "dps",
    essential = true,
    icons = {
      {
        icon = "__space-exploration-graphics__/graphics/technology/catalogue/material-catalogue-2.png",
        icon_size = 128,
      },
      {
        icon = "__space-exploration-graphics__/graphics/technology/catalogue/mask-catalogue-2.png",
        icon_size = 128,
        tint = {1, 0, 0}
      }
    },

    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "dps-item_dps-data-pack",
      },
      {
        type = "unlock-recipe",
        recipe = "dps-building_dps-supercomputer",
      },
    },
    prerequisites = { "dps-tech_dps-credit-exchange", "dps-tech_dps-scrap-recycling"},
    research_trigger = {
      type = "scripted",
      trigger_description = {"technology-description.dps-tech_dps-data-pack-trigger"}
    },
  },
  {
    type = "technology",
    name = "dps-tech_discovery-of-dorax",
    order = "dps",
    icons = {
      {
        icon = "__base__/graphics/technology/atomic-bomb.png",
        icon_size = 256,
        tint = { 1.0, 0.0, 0,0 },
      },
    },
    prerequisites = { "dps-tech_planet-discovery-dps" },
    research_trigger = {
      type = "scripted",
      trigger_description = {"technology-description.dps-tech_discovery-of-dorax-trigger"}
    },
  },
}