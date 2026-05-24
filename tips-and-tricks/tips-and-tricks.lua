local __SIM_PATH = "__planet-dps__/tips-and-tricks/simulations/"

data:extend {
  {
		type = "tips-and-tricks-item-category",
		name = "dps-tat_category",
		order = "z",
	},
  {
    type = "tips-and-tricks-item",
    name = "dps-tat_briefing",
    tag = "[planet=dps-planet_dps]",
    category = "dps-tat_category",
    is_title = true,
    order = "za",
    indent = 0,
    simulation = {
      init_update_count = 120,
      planet = "dps-planet_dps",
      init_file = __SIM_PATH.."briefing.lua"
    },
    starting_status = "unlocked",
  },
}