local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")
local item_sounds = require("__base__.prototypes.item_sounds")

local pipe_pic = table.deepcopy(require("__space-age__.prototypes.entity.electromagnetic-plant-pictures").pipe_pictures)
pipe_pic.north.layers[2] = nil
pipe_pic.east.layers[2] = nil
pipe_pic.south.layers[2] = nil
pipe_pic.west.layers[2] = nil

local pipe_covers = table.deepcopy(pipecoverspictures())
pipe_covers.north.layers[2] = nil
pipe_covers.east.layers[2] = nil
pipe_covers.south.layers[2] = nil
pipe_covers.west.layers[2] = nil

data:extend {
  {
    type = "assembling-machine",
    name = "dps-building_dps-credit-translator",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 0.2, result = "dps-building_dps-credit-translator"},
    max_health = 1500,
    corpse = "electromagnetic-plant-remnants",
    dying_explosion = "electromagnetic-plant-explosion",

    icon = __PATH__.."/graphics/entity/dps-credit-translator/atom-forge-icon.png",
    icon_size = 64,

    collision_box = {{-2.8, -2.8}, {2.8, 2.8}},
    selection_box = {{-3, -3}, {3, 3}},
    damaged_trigger_effect = hit_effects.entity(),
    open_sound = sounds.electric_large_open,
    close_sound = sounds.electric_large_close,
    working_sound =
    {
      sound = sound_variations("__base__/sound/centrifuge", 3, 0.3, volume_multiplier("main-menu", 1.5) ),
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },

    allowed_effects = {"consumption", "speed", "pollution"},
    impact_category = "metal-large",

    crafting_speed = 1,
    crafting_categories = {"dps-recipe-category_dps-credit-translator"},
    module_slots = 4,

    energy_usage = "250kW",
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = { pollution = 4 }
    },

    circuit_wire_max_distance = assembling_machine_circuit_wire_max_distance,
    circuit_connector = circuit_connector_definitions["biochamber"],

    fluid_boxes =
    {
      {
        production_type = "output",
        pipe_picture = pipe_pic,
        pipe_covers = pipe_covers,
        volume = 100,
        secondary_draw_orders = { north = -1 },
        pipe_connections =
        {
          {
            flow_direction = "output",
            direction = defines.direction.south,
            position = {-1.5, 2.5}
          }
        }
      },
      {
        production_type = "output",
        pipe_picture = pipe_pic,
        pipe_covers = pipe_covers,
        volume = 100,
        secondary_draw_orders = { north = -1 },
        pipe_connections =
        {
          {
            flow_direction = "output",
            direction = defines.direction.south,
            position = {1.5, 2.5}
          }
        }
      }
    },
    fluid_boxes_off_when_no_fluid_recipe = true,
    use_mirroring = true,

    graphics_set =
    {
      animation =
      {
        layers =
        {
          {
            filename = __PATH__.."/graphics/entity/dps-credit-translator/atom-forge-animation.png",
            width = 400,
            height = 480,
            line_length = 10,
            animation_speed = 1,
            frame_count = 80,
            scale = 0.48,
            shift = util.by_pixel(0, -12),
          },

          {
            filename = __PATH__.."/graphics/entity/dps-credit-translator/atom-forge-color1.png",
            width = 400,
            height = 480,
            line_length = 10,
            animation_speed = 1,
            frame_count = 80,
            scale = 0.48,
            shift = util.by_pixel(0, -12),
            tint = { 1.0, 1.0, 0.0 },
          },

          {
            filename = __PATH__.."/graphics/entity/dps-credit-translator/atom-forge-shadow.png",
            animation_speed = 1,
            width = 900,
            height = 500,
            scale = 0.48,
            frame_count = 1,
            repeat_count = 80,
            draw_as_shadow = true,
            shift = util.by_pixel(0, -12),
          },

          {
            filename = __PATH__.."/graphics/entity/dps-credit-translator/atom-forge-emission1.png",
            width = 400,
            height = 480,
            line_length = 10,
            animation_speed = 1,
            frame_count = 80,
            scale = 0.48,
            draw_as_glow = true,
            blend_mode = "additive",
            shift = util.by_pixel(0, -12),
            tint = { 1.0, 1.0, 0.0 },
          },

          {
            filename = __PATH__.."/graphics/entity/dps-credit-translator/atom-forge-emission2.png",
            width = 400,
            height = 480,
            line_length = 10,
            animation_speed = 1,
            frame_count = 80,
            scale = 0.48,
            draw_as_glow = true,
            blend_mode = "additive",
            shift = util.by_pixel(0, -12),
          },
        }
      }
    },
  },


  {
    type = "item",
    name = "dps-building_dps-credit-translator",
    icon = __PATH__.."/graphics/entity/dps-credit-translator/atom-forge-icon.png",
    icon_size = 64,
    stack_size = 5,
    weight = 200 * kg,
    place_result = "dps-building_dps-credit-translator",
    subgroup = "dps-item-subgroup_item",
    inventory_move_sound = item_sounds.electric_large_inventory_move,
    pick_sound = item_sounds.electric_large_inventory_pickup,
    drop_sound = item_sounds.electric_large_inventory_move,
    default_import_location = "dps-planet_dps",
  },


  {
    type = "recipe",
    name = "dps-building_dps-credit-translator",
    energy_required = 5,
    enabled = false,
    ingredients =
    {
      {type = "item", name = "iron-gear-wheel", amount = 40},
      {type = "item", name = "steel-plate", amount = 20},
      {type = "item", name = "processing-unit", amount = 10},
      {type = "item", name = "dps-item_dps-credit-n", amount = 500},
    },
    surface_conditions = __PLANET_CONDITIONS__,
    results = {{type="item", name="dps-building_dps-credit-translator", amount=1}}
  },
}