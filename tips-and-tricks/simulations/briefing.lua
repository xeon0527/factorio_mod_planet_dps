require("__core__/lualib/story")
require("__planet-dps__/global/_hdr")

game.simulation.camera_position = {0, 0}

local surface = game.surfaces[1]

for x = -11, 10 do
  for y = -6, -3 do
    surface.set_tiles{{position = {x, y}, name = "dirt-1"}}
  end
end

for x = -11, 10 do
  for y = -2, 6 do
    surface.set_tiles{{position = {x, y}, name = "dry-dirt"}}
  end
end

for x = -11, -4 do
  for y = 2, 6 do
    surface.set_tiles{{position = {x, y}, name = "water"}}
  end
end

for x = -11, -7 do
  for y = 1, 2 do
    surface.set_tiles{{position = {x, y}, name = "water"}}
  end
end

surface.create_entity{name = "cliff", position = {-9 ,-4}, cliff_orientation = "west-to-east"}
surface.create_entity{name = "cliff", position = {-5 ,-4}, cliff_orientation = "west-to-east"}
surface.create_entity{name = "cliff", position = {-1 ,-4}, cliff_orientation = "west-to-east"}
surface.create_entity{name = "cliff", position = {3 ,-4}, cliff_orientation = "west-to-east"}
surface.create_entity{name = "cliff", position = {7 ,-4}, cliff_orientation = "west-to-east"}
surface.create_entity{name = "cliff", position = {11 ,-4}, cliff_orientation = "west-to-east"}

surface.create_entity{name = "dps-deco_big-sand-rock", position = {-1 ,5}}
surface.create_entity{name = "dps-deco_huge-rock", position = {3 ,4}}
surface.create_entity{name = "dps-deco_big-rock", position = {0 ,2}}
surface.create_entity{name = "dps-building_dps-subcore", position = {7 ,2}}