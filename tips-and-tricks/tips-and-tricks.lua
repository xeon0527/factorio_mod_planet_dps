local __SIM_PATH = "__planet-dps__/tips-and-tricks/simulations/"

data:extend {
  {
		type = "tips-and-tricks-item-category",
		name = "dps-tat_category",
		order = "zzz-dps",
	},
  {
    type = "tips-and-tricks-item",
    name = "dps-tat_briefing",
    tag = "[planet=dps-planet_dps]",
    category = "dps-tat_category",
    is_title = true,
    order = "dps-a",
    indent = 0,
    simulation = {
      init_update_count = 120,
      planet = "dps-planet_dps",
      init_file = __SIM_PATH.."briefing.lua"
    },
    trigger =
    {
      type = "research",
      technology = "dps-tech_planet-discovery-dps"
    },
    skip_trigger =
    {
      type = "change-surface",
      surface = "dps-planet_dps"
    },
  },
  {
    type = "tips-and-tricks-item",
    name = "dps-tat_dps-subcore",
    tag = "[item=gun-turret]",
    category = "dps-tat_category",
    order = "dps-b",
    indent = 1,
    simulation = {
      init_update_count = 600,
      planet = "dps-planet_dps",
      checkboard = true,
      init_file = __SIM_PATH.."dps-subcore.lua",
      update = [[
        local surface = game.surfaces[1]
        local c = surface.find_entity("dps-building_dps-subcore-container", {0,0})
        if c then c.insert{name = "dps-item_dps-credit-n", count = 100} end
      ]]
    },
    trigger =
    {
      type = "change-surface",
      surface = "dps-planet_dps"
    },
    skip_trigger =
    {
      type = "sequence",
      triggers =
      {
        {
          type = "change-surface",
          surface = "dps-planet_dps"
        },
        {
          type = "time-elapsed",
          ticks = 5 * minute
        }
      }
    },
  },
  --{
  --  type = "tips-and-tricks-item",
  --  name = "dps-tat_dorax",
  --  tag = "[virtual-signal=signal-red]",
  --  category = "dps-tat_category",
  --  order = "dps-c",
  --  indent = 1,
  --  simulation = {
  --    init_update_count = 600,
  --    planet = "dps-planet_dps",
  --    checkboard = true,
  --    init_file = __SIM_PATH.."dorax.lua",
  --    update = [[
  --      local surface = game.surfaces[1]
  --      local c = surface.find_entity("dps-special_dorax-container", {0,0})
  --      if c then c.insert{name = "dps-item_dorax-fragment", count = 100} end
  --    ]]
  --  },
  --  trigger =
  --  {
  --    type = "research",
  --    technology = "dps-tech_discovery-of-dorax"
  --  },
  --  skip_trigger =
  --  {
  --    type = "sequence",
  --    triggers =
  --    {
  --      {
  --        type = "research",
  --        technology = "dps-tech_discovery-of-dorax"
  --      },
  --      {
  --        type = "time-elapsed",
  --        ticks = 5 * minute
  --      }
  --    }
  --  },
  --},
  --{
  --  type = "tips-and-tricks-item",
  --  name = "dps-tat_dorax-item-graph",
  --  tag = "[virtual-signal=signal-info]",
  --  category = "dps-tat_category",
  --  order = "dps-cc",
  --  indent = 2,
  --  image = "__planet-dps__/graphics/tips-and-tricks/dorax-item-graph.png",
  --  trigger =
  --  {
  --    type = "research",
  --    technology = "dps-tech_discovery-of-dorax"
  --  },
  --  skip_trigger =
  --  {
  --    type = "sequence",
  --    triggers =
  --    {
  --      {
  --        type = "research",
  --        technology = "dps-tech_discovery-of-dorax"
  --      },
  --      {
  --        type = "time-elapsed",
  --        ticks = 5 * minute
  --      }
  --    }
  --  },
  --},
}