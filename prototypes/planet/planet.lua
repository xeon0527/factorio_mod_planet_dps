--local linox_map_gen = require("prototypes.planet.map-gen")
--local effects = require("__core__/lualib/surface-render-parameter-effects")
local asteroid_util = require("__space-age__.prototypes.planet.asteroid-spawn-definitions")
local _nauvis = data.raw["planet"]["nauvis"]

PlanetsLib:extend {
  {
    type = "planet",
    name = "dps-planet_dps",
    icon = __G_MOD__.."/graphics/planet/512.png",
    icon_size = 512,
    starmap_icon = __G_MOD__.."/graphics/planet/512.png",
    starmap_icon_size = 512,
    gravity_pull = 10,      -- 행성에 근접할 시 행성 중력에 의해 우주선에 가감되는 속도.

    orbit = {
      parent = { type = "space-location", name = "star" },
			distance = 13,
			orientation = 0.5,
    },

    --distance = 5,          -- 태양으로부터의 거리. 행성의 크기와는 무관.
    --orientation = 0.1,    -- 행성의 현재 위치. 0~1 사이의 값으로, 0은 태양에서 오른쪽, 0.25는 태양에서 위쪽, 0.5는 태양에서 왼쪽, 0.75는 태양에서 아래쪽.
    magnitude = 1,        -- 행성의 크기. 행성의 거리와는 무관.
    label_orientation = 0.25, -- 행성 이름의 위치. 0~1 사이의 값으로, 0은 태양에서 오른쪽, 0.25는 태양에서 위쪽, 0.5는 태양에서 왼쪽, 0.75는 태양에서 아래쪽.
    order = "dps",   -- 행성의 순서. starmap에서 행성의 위치에 영향을 줌.
    subgroup = "planets",
    map_gen_settings = require("prototypes/planet/map-gen"),
    pollutant_type = nil,
    solar_power_in_space = __G_PLANET__.solar_power_in_space, -- 우주 공간에서 태양광 패널이 얻는 태양광 발전량. 행성의 태양광 발전량과는 무관.

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
    asteroid_spawn_influence = _nauvis.asteroid_spawn_influence,
    asteroid_spawn_definitions = _nauvis.asteroid_spawn_definitions,
  },
}

data:extend {
  {
    type = "space-connection",
    name = "dps-space-connection_nauvis-dps",
    subgroup = "planet-connections",
    from = "nauvis",
    to = "dps-planet_dps",
    order = "a",
    length = 10000,

    asteroid_spawn_influence = 10,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_vulcanus)
  },
}