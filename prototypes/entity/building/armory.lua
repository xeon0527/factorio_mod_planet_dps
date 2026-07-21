local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")
local item_sounds = require("__base__.prototypes.item_sounds")

local function _create_pipe_pictures()
  return
  {
    east = {
      filename = "__space-exploration-graphics__/graphics/entity/assembling-machine/assembling-machine-pipe-E.png",
      height = 76,
      priority = "extra-high",
      scale = 0.5,
      shift = util.by_pixel(-24.5, 1),
      width = 42
    },
    north = {
      filename = "__space-exploration-graphics__/graphics/entity/assembling-machine/assembling-machine-pipe-N.png",
      height = 38,
      priority = "extra-high",
      scale = 0.5,
      shift = util.by_pixel(2.25, 13.5),
      width = 71
    },
    south = {
      filename = "__space-exploration-graphics__/graphics/entity/assembling-machine/assembling-machine-pipe-S.png",
      height = 61,
      priority = "extra-high",
      scale = 0.5,
      shift = util.by_pixel(0, -31.25),
      width = 88
    },
    west = {
      filename = "__space-exploration-graphics__/graphics/entity/assembling-machine/assembling-machine-pipe-W.png",
      height = 73,
      priority = "extra-high",
      scale = 0.5,
      shift = util.by_pixel(25.75, 1.25),
      width = 39
    }
  }
end

data:extend {
  {
    type = "assembling-machine",
    name = "dps-building_armory",
    icon = "__space-exploration-graphics__/graphics/icons/assembling-machine.png",
    icon_size = 64,

    flags = {"placeable-neutral","placeable-player", "player-creation"},
    minable = {mining_time = 0.2, result = "dps-building_armory"},
    max_health = 400,
    corpse = "assembling-machine-3-remnants",
    dying_explosion = "assembling-machine-3-explosion",
    icon_draw_specification = {shift = {0, -0.3}},
    circuit_wire_max_distance = assembling_machine_circuit_wire_max_distance,
    circuit_connector = require("__base__.prototypes.entity.assembler-pictures").circuit_connector,
    alert_icon_shift = util.by_pixel(0, -12),
    fast_replaceable_group = "assembling-machine",
    resistances =
    {
      {
        type = "fire",
        percent = 70
      }
    },
    fluid_boxes =
    {
      {
        production_type = "input",
        pipe_picture = _create_pipe_pictures(),
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections = {{ flow_direction="input", direction = defines.direction.north, position = {0, -1} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "output",
        pipe_picture = _create_pipe_pictures(),
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections = {{ flow_direction="output", direction = defines.direction.south, position = {0, 1} }},
        secondary_draw_orders = { north = -1 }
      }
    },
    fluid_boxes_off_when_no_fluid_recipe = true,
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    impact_category = "metal",
    working_sound =
    {
      sound = {filename = "__base__/sound/assembling-machine-t3-1.ogg", volume = 0.45, audible_distance_modifier = 0.5},
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },
    effect_receiver = { base_effect = { productivity = 0.5 }},
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    damaged_trigger_effect = hit_effects.entity(),
    drawing_box_vertical_extension = 0.2,
    graphics_set = {
      animation = {
        layers = {
          {
            filename = "__space-exploration-graphics__/graphics/entity/assembling-machine/assembling-machine.png",
            frame_count = 32,
            repeat_count = 2,
            height = 237,
            line_length = 8,
            priority = "high",
            scale = 0.5,
            shift = util.by_pixel(0, -0.75),
            width = 214
          },
          {
            draw_as_shadow = true,
            filename = "__space-exploration-graphics__/graphics/entity/assembling-machine/assembling-machine-shadow.png",
            frame_count = 32,
            repeat_count = 2,
            height = 162,
            line_length = 8,
            priority = "high",
            scale = 0.5,
            shift = util.by_pixel(28, 4),
            width = 260
          },
          {
            width = 132,
            height = 130,
            frame_count = 64,
            shift = util.by_pixel(0, -27.5),
            stripes =
            {
              {
                filename = "__base__/graphics/entity/gun-turret/gun-turret-shooting-1.png",
                width_in_frames = 1,
                height_in_frames = 16
              },
              {
                filename = "__base__/graphics/entity/gun-turret/gun-turret-shooting-2.png",
                width_in_frames = 1,
                height_in_frames = 16
              },
              {
                filename = "__base__/graphics/entity/gun-turret/gun-turret-shooting-3.png",
                width_in_frames = 1,
                height_in_frames = 16
              },
              {
                filename = "__base__/graphics/entity/gun-turret/gun-turret-shooting-4.png",
                width_in_frames = 1,
                height_in_frames = 16
              }
            },
            scale = 0.5
          },
          {
            flags = {"mask"},
            --line_length = 1,
            width = 58,
            height = 54,
            frame_count = 64,
            shift = util.by_pixel(0, -32.5),
            --apply_runtime_tint = true,
            stripes =
            {
              {
                filename = "__base__/graphics/entity/gun-turret/gun-turret-shooting-mask-1.png",
                width_in_frames = 1,
                height_in_frames = 16
              },
              {
                filename = "__base__/graphics/entity/gun-turret/gun-turret-shooting-mask-2.png",
                width_in_frames = 1,
                height_in_frames = 16
              },
              {
                filename = "__base__/graphics/entity/gun-turret/gun-turret-shooting-mask-3.png",
                width_in_frames = 1,
                height_in_frames = 16
              },
              {
                filename = "__base__/graphics/entity/gun-turret/gun-turret-shooting-mask-4.png",
                width_in_frames = 1,
                height_in_frames = 16
              }
            },
            scale = 0.5
          },
          {
            width = 250,
            height = 124,
            frame_count = 64,
            shift = util.by_pixel(22, 2.5),
            draw_as_shadow = true,
            stripes =
            {
              {
                filename = "__base__/graphics/entity/gun-turret/gun-turret-shooting-shadow-1.png",
                width_in_frames = 1,
                height_in_frames = 16
              },
              {
                filename = "__base__/graphics/entity/gun-turret/gun-turret-shooting-shadow-2.png",
                width_in_frames = 1,
                height_in_frames = 16
              },
              {
                filename = "__base__/graphics/entity/gun-turret/gun-turret-shooting-shadow-3.png",
                width_in_frames = 1,
                height_in_frames = 16
              },
              {
                filename = "__base__/graphics/entity/gun-turret/gun-turret-shooting-shadow-4.png",
                width_in_frames = 1,
                height_in_frames = 16
              }
            },
            scale = 0.5
          }
        }
      }
    },

    crafting_speed = 4,
    crafting_categories = {"dps-recipe-category_armory"},

    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = { pollution = 2 }
    },
    energy_usage = "375kW",
    module_slots = 4,
    allowed_effects = {"consumption", "speed", "productivity", "pollution", "quality"},
    water_reflection = require("__base__.prototypes.entity.assembler-pictures").water_reflection,
  },

  {
    type = "item",
    name = "dps-building_armory",
    icon = "__space-exploration-graphics__/graphics/icons/assembling-machine.png",
    icon_size = 64,
    stack_size = 50,
    weight = 40 * kg,
    place_result = "dps-building_armory",
    subgroup = "dps-item-subgroup_item",
    inventory_move_sound = item_sounds.mechanical_inventory_move,
    pick_sound = item_sounds.mechanical_inventory_pickup,
    drop_sound = item_sounds.mechanical_inventory_move,
    default_import_location = "dps-planet_dps",
  },


  {
    type = "recipe",
    name = "dps-building_armory",
    energy_required = 5,
    enabled = false,
    ingredients =
    {
      {type = "item", name = "assembling-machine-3", amount = 2},
      {type = "item", name = "dps-item_dps-credit-k", amount = 50},
      {type = "item", name = "dps-item_dorax-component", amount = 1},
    },
    surface_conditions = __PLANET_CONDITIONS__,
    results = {{type="item", name="dps-building_armory", amount=1}}
  },
}