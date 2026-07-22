local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")
local item_sounds = require("__base__.prototypes.item_sounds")

data:extend {
  {
    type = "assembling-machine",
    name = "dps-building_dps-equipment-enhancer",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 1.0, result = "dps-building_dps-equipment-enhancer"},
    max_health = 1000,
    corpse = "electromagnetic-plant-remnants",
    dying_explosion = "electromagnetic-plant-explosion",

    icon = "__space-exploration-graphics__/graphics/icons/space-science-lab.png",
    icon_size = 64,

    collision_box = {{-3.2, -3.2}, {3.2, 3.2}},
    selection_box = {{-3.5, -3.5}, {3.5, 3.5}},
    display_box = {{-3.5, -4.8}, {3.5, 3.5}},

    damaged_trigger_effect = hit_effects.entity(),
    open_sound = sounds.electric_large_open,
    close_sound = sounds.electric_large_close,
    working_sound =
    {
      sound =
      {
        filename = __PATH__.."/sound/dps-equipment-enhancer.ogg",
        volume = 1.0,
        modifiers = {volume_multiplier("main-menu", 2.2), volume_multiplier("tips-and-tricks", 0.8)},
        audible_distance_modifier = 0.7,
      },
    },

    allowed_effects = {"consumption", "speed", "pollution"},
    impact_category = "metal-large",

    --fast_replaceable_group = "assembling-machine",
    crafting_speed = 10,
    crafting_categories = {"dps-recipe-category_dps-equipment-enhancer"},
    module_slots = 4,

    energy_usage = "1000kW",
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = { pollution = 24 }
    },

    circuit_wire_max_distance = assembling_machine_circuit_wire_max_distance,
    circuit_connector = circuit_connector_definitions["biochamber"],

    use_mirroring = true,

    graphics_set =
    {
      animation =
      {
        layers =
        {
          {
              filename = "__space-exploration-graphics-3__/graphics/entity/space-science-lab/space-science-lab-base.png",
              width = 467,
              height = 290,
              line_length = 1,
              frame_count = 1,
              repeat_count = 64,
              animation_speed = 1,
              shift = { 0/32, 50.75/32 },
              scale = 0.5,
            },
            {
              height = 448,
              width = 402,
              frame_count = 64,
              animation_speed = 1,
              shift = { 0.75/32, -34.75/32 },
              stripes =
              {
                {
                 filename = "__space-exploration-graphics-3__/graphics/entity/space-science-lab/space-science-lab-1.png",
                 width_in_frames = 4,
                 height_in_frames = 4,
                },
                {
                 filename = "__space-exploration-graphics-3__/graphics/entity/space-science-lab/space-science-lab-2.png",
                 width_in_frames = 4,
                 height_in_frames = 4,
                },
                {
                 filename = "__space-exploration-graphics-3__/graphics/entity/space-science-lab/space-science-lab-3.png",
                 width_in_frames = 4,
                 height_in_frames = 4,
                },
                {
                 filename = "__space-exploration-graphics-3__/graphics/entity/space-science-lab/space-science-lab-4.png",
                 width_in_frames = 4,
                 height_in_frames = 4,
                },
              },
              scale = 0.5,
            },
            {
              draw_as_shadow = true,
              filename = "__space-exploration-graphics-3__/graphics/entity/space-science-lab/space-science-lab-shadow.png",
              width = 599,
              height = 345,
              line_length = 1,
              frame_count = 1,
              repeat_count = 64,
              animation_speed = 1,
              scale = 0.5,
              shift = { 1.40625, 0.34375 },
            }
        }
      }
    },
  },


  {
    type = "item",
    name = "dps-building_dps-equipment-enhancer",
    icon = "__space-exploration-graphics__/graphics/icons/space-science-lab.png",
    icon_size = 64,
    stack_size = 10,
    weight = 1000 * tons,
    place_result = "dps-building_dps-equipment-enhancer",
    subgroup = "dps-item-subgroup_item",
    inventory_move_sound = item_sounds.electric_large_inventory_move,
    pick_sound = item_sounds.electric_large_inventory_pickup,
    drop_sound = item_sounds.electric_large_inventory_move,
    default_import_location = "dps-planet_dps",
  },


  {
    type = "recipe",
    name = "dps-building_dps-equipment-enhancer",
    energy_required = 10,
    enabled = false,
    auto_recycle = false,
    ingredients =
    {
      {type = "item", name = "iron-gear-wheel", amount = 40},
      {type = "item", name = "steel-plate", amount = 20},
      {type = "item", name = "advanced-circuit", amount = 10},
      {type = "item", name = "dps-item_dps-credit-n", amount = 500},
    },
    surface_conditions = __PLANET_CONDITIONS__,
    results = {{type="item", name="dps-building_dps-equipment-enhancer", amount=1}}
  },
}