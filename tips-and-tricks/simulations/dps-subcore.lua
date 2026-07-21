require("__core__/lualib/story")
require("__planet-dps__/global/_hdr")
require("__planet-dps__/scripts/util/_hdr")
__LIB__ = require("__planet-dps__/lib/_hdr")

game.simulation.camera_position = {0.5, 0.5}

local surface = game.surfaces[1]

surface.create_global_electric_network()

surface.create_entity{name = "electric-energy-interface", force = "player", position = {-10,-10}}
surface.create_entity{name = "dps-building_dps-subcore", force = "enemy", position = {0,0}}
__LIB__.entity.ensure(surface, { name = "dps-building_dps-subcore-container", position = {0,0}, hidden = true})


local belt_pos = {
  { -3, 0},
  { -4, 0},
  { -5, 0},
  { -6, 0},
  { -7, 0},
  { -8, 0},
  { -9, 0},
  { -10, 0},
  { -11, 0},
  { -12, 0},
  { -13, 0},
  { 8, 0},
  { 9, 0},
  { 10, 0},
  { 11, 0},
  { 12, 0},
  { 13, 0},
}

for _, v in pairs(belt_pos) do
  surface.create_entity{name = "turbo-transport-belt", force = "player", position = v,
                        direction = defines.direction.west}
end

surface.create_entity{name = "fast-inserter", force = "player", position = {14,0}, direction = defines.direction.east}
surface.create_entity{name = "fast-inserter", force = "player", position = {7,0}, direction = defines.direction.east}
surface.create_entity{name = "fast-inserter", force = "player", position = {-2,0}, direction = defines.direction.east}
surface.create_entity{name = "fast-inserter", force = "player", position = {-14,0}, direction = defines.direction.east}

surface.create_entity{name = "gun-turret", force = "player", position = {6,0}, direction = defines.direction.west}

local e1 = surface.create_entity{name = "infinity-chest", force = "player", position = {-15,0}}
e1.remove_unfiltered_items = true

local e2 = surface.create_entity{name = "infinity-chest", force = "player", position = {15,0}}
if e2 then
  e2.set_infinity_container_filter(1, { name = "firearm-magazine", count = 100})
end