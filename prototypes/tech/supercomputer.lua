data:extend {
  {
    type = "technology",
    name = "dps-tech_supersonic-grenade_shooting-speed",
    order = "dps",
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
    prerequisites = { "dps-tech_dps-supercomputer", "dps-tech_supersonic-grenade-launcher" },
    unit =
    {
      count_formula = "2^((L-1) * 0.5)*5000",
      ingredients =
      {
        {"dps-item_dorax-fragment", 1},
      },
      time = 1
    },
    max_level = 18,
    upgrade = true,

    effects =
    {
      {
        type = "gun-speed",
        ammo_category = "supersonic-grenade",
        modifier = 0.5
      }
    },
  },
}