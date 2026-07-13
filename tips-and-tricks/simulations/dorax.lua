require("__core__/lualib/story")
require("__planet-dps__/global/_hdr")
require("__planet-dps__/scripts/util/_hdr")

game.simulation.camera_position = {0.5, 0.5}
game.simulation.camera_zoom = 1.35

local surface = game.surfaces[1]

surface.create_global_electric_network()

surface.create_entity{name = "electric-energy-interface", force = "player", position = {-20,-20}}
surface.create_entity{name = "dps-special_dorax", force = "enemy", position = {0,0}}
UTIL_ensure_entity(surface, { name = "dps-special_dorax-container", position = {0,0}, hidden = true})


local belt_pos = {
  { -8, 0},
  { -9, 0},
  { -10, 0},
  { -11, 0},
  { -12, 0},
  { -13, 0},
  { -14, 0},
  { -15, 0},
  { -16, 0},
  { -17, 0},
  { -18, 0},

  { 16, -2},
  { 17, -2},
  { 18, -2},

  { 16,  2},
  { 17,  2},
  { 18,  2},
}

for _, v in pairs(belt_pos) do
  surface.create_entity{name = "turbo-transport-belt", force = "player", position = v,
                        direction = defines.direction.west}
end

surface.create_entity{name = "fast-inserter", force = "player", position = {-19,0}, direction = defines.direction.east}
surface.create_entity{name = "long-handed-inserter", force = "player", position = {-6,0}, direction = defines.direction.east}

surface.create_entity{name = "fast-inserter", force = "player", position = {19, -2}, direction = defines.direction.east}
surface.create_entity{name = "fast-inserter", force = "player", position = {19, 2}, direction = defines.direction.east}

surface.create_entity{name = "fast-inserter", force = "player", position = {15,-2}, direction = defines.direction.east}
surface.create_entity{name = "fast-inserter", force = "player", position = {15,2}, direction = defines.direction.east}

surface.create_entity{name = "rocket-turret", force = "player", position = {13.5, -2}, direction = defines.direction.west}
surface.create_entity{name = "dps-turret_supersonic-grenade-launcher", force = "player", position = {14,3}, direction = defines.direction.west}


surface.create_entity{name = "infinity-chest", force = "player", position = {-20,0}}.remove_unfiltered_items = true

surface.create_entity{name = "infinity-chest", force = "player", position = {20,-2}}.set_infinity_container_filter(1, { name = "rocket", count = 100})
surface.create_entity{name = "infinity-chest", force = "player", position = {20,2}}.set_infinity_container_filter(1, { name = "dps-ammo_supersonic-grenade", count = 100})