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
    prerequisites = {"space-platform-thruster"},
    unit =
    {
      count = 1000,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"space-science-pack", 1}
      },
      time = 60
    }
  },
}