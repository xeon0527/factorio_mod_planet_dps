require("__core__/lualib/story")
require("__planet-dps__/global/_hdr")
__LIB__ = require("__planet-dps__/lib/_hdr")

game.simulation.camera_position = {0.5, 0.5}
game.simulation.camera_zoom = 1.35

local surface = game.surfaces[1]

surface.create_entity{name = "dps-special_dorax", force = "enemy", position = {0,0}}
__LIB__.entity.ensure(surface, { name = "dps-special_dorax-container", position = {0,0}, hidden = true})
