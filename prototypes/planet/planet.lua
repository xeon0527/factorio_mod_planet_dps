--local linox_map_gen = require("prototypes.planet.map-gen")
--local effects = require("__core__/lualib/surface-render-parameter-effects")
local asteroid_util = require("__space-age__/prototypes/planet/asteroid-spawn-definitions")
local _nauvis = data.raw["planet"]["nauvis"]

PlanetsLib:extend {
  {
    type = "planet",
    name = "dps-planet_dps",
    icon = __G_MOD__.."/graphics/planet/512.png",
    icon_size = 512,
    starmap_icon = __G_MOD__.."/graphics/planet/512.png",
    starmap_icon_size = 512,
    gravity_pull = 8,

    orbit = {
      parent = { type = "space-location", name = "star" },
			distance = 18,
			orientation = 0.4,
    },

    magnitude = 1,
    label_orientation = 0.4,
    order = "dps",
    subgroup = "planets",
    map_gen_settings = require("prototypes/planet/map-gen"),
    pollutant_type = nil,
    solar_power_in_space = __G_PLANET__.solar_power_in_space,

    platform_procession_set =
    {
      arrival = {"planet-to-platform-b"},
      departure = {"platform-to-planet-a"}
    },
    planet_procession_set =
    {
      arrival = {"platform-to-planet-b"},
      departure = {"planet-to-platform-a"}
    },

    surface_properties =
    {
      ["day-night-cycle"] = 7 * minute,
      ["magnetic-field"] = __G_PLANET__.magnetic_field,
      ["solar-power"] = __G_PLANET__.solar_power,
      pressure = __G_PLANET__.pressure,
      gravity = __G_PLANET__.gravity
    },

    procession_graphic_catalogue = _nauvis.procession_graphic_catalogue,
    persistent_ambient_sounds = _nauvis.persistent_ambient_sounds,
    surface_render_parameters = _nauvis.surface_render_parameters,
    asteroid_spawn_influence = 1,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_fulgora, 0.9),
  },
}

data:extend {
  {
    type = "space-connection",
    name = "dps-space-connection_fulgora-dps",
    subgroup = "planet-connections",
    from = "fulgora",
    to = "dps-planet_dps",
    order = "a",
    length = 10000,

    asteroid_spawn_influence = 1,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.gleba_fulgora)
  },
}