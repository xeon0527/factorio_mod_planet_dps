data:extend {
  {
    type = "technology",
    name = "dps-tech_armory",
    order = "dps",
    icon = "__space-exploration-graphics__/graphics/technology/space-assembling.png",
    icon_size = 128,
    prerequisites = { "dps-tech_advanced-dps-engineering" ,"automation-3"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"dps-item_dorax-component", 1},
      },
      time = 5,
    },
    effects =
    {
      { type = "unlock-recipe", recipe = "dps-building_armory" },
    },
  },
}