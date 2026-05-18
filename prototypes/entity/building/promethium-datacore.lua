require("global/_hdr")
local hit_effects = require("__base__.prototypes.entity.hit-effects")
local enemy_autoplace = require ("__base__.prototypes.entity.enemy-autoplace-utils")

data:extend {
  {
    type = "container",
    name = "dps-entity-building_promethium-datacore",
    icon = "__base__/graphics/icons/lab.png",
    --icon_size = 64,
    flags = {
      "placeable-enemy",
      "not-rotatable",
      "not-repairable",
      "not-blueprintable",
      "hide-alt-info",
      "not-flammable",
      "no-automated-item-removal",
      "no-automated-item-insertion",
      "not-upgradable",
      --"not-in-kill-statistics",
      "not-in-made-in",
      --"breaths-air",
    },
    map_color = { 1, 0, 0 },
    hidden = true,
    hidden_in_factoriopedia = true,
    draw_inventory_content = true,

    corpse = "lab-remnants",
    dying_explosion = "lab-explosion",
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    damaged_trigger_effect = hit_effects.entity(),
    --collision_mask = {layers={item=true, object=true, player=true, water_tile=true, elevated_rail=true, is_object=true, is_lower_object=true, trigger_target=true,}},

    autoplace = {
      probability_expression = "voronoi_spot_noise{x = x,\z
                                                    y = y,\z
                                                    seed0 = map_seed,\z
                                                    seed1 = 1234,\z
                                                    grid_size = 200,\z
                                                    distance_type = 'euclidean',\z
                                                    jitter = 0.5\z
                                                  } < (1/199)",
      force = "enemy",
    },
    
    max_health = 1000000,
    resistances = {
      {
        type = "fire",
        decrease = 0,
        percent = 100
      },
      {
        type = "physical",
        decrease = 0,
        percent = 0
      },
      {
        type = "impact",
        decrease = 0,
        percent = 0
      },
      {
        type = "explosion",
        decrease = 0,
        percent = 0
      },
      {
        type = "acid",
        decrease = 0,
        percent = 100
      },
      {
        type = "laser",
        decrease = 0,
        percent = 100
      },
      {
        type = "electric",
        decrease = 0,
        percent = 100
      },
    },
    healing_per_tick = 0,
    inventory_size = 100,

    is_military_target = true,
    quality_affects_inventory_size = false,
    draw_copper_wires = false,
    draw_circuit_wires = false,

    picture = {
      layers = {
        {
          filename = "__base__/graphics/entity/lab/lab.png",
          width = 194,
          height = 174,
          shift = util.by_pixel(0, 1.5),
          scale = 0.5,
          tint = { 1, 0.8, 0.8 },
        },
        {
          filename = "__base__/graphics/entity/lab/lab-integration.png",
          width = 242,
          height = 162,
          shift = util.by_pixel(0, 15.5),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/lab/lab-shadow.png",
          width = 242,
          height = 136,
          shift = util.by_pixel(13, 11),
          scale = 0.5,
          draw_as_shadow = true
        }
      }
    },

    stateless_visualisation = {
      {
        count = 1,
        render_layer = "object",
        animation = {
          layers = {
            {
              filename = "__base__/graphics/entity/lab/lab-light.png",
              blend_mode = "additive",
              draw_as_glow = true,
              width = 216,
              height = 194,
              frame_count = 33,
              line_length = 11,
              animation_speed = 1,
              shift = util.by_pixel(0, 0),
              scale = 0.5,
              tint = { 1.0, 0.0, 0.0 },
            }
          }
        }
      }
    }
  }
}