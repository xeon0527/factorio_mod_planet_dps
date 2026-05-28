require("global/_hdr")
local hit_effects = require("__base__.prototypes.entity.hit-effects")

data:extend {
  {
    type = "proxy-container",
    name = "dps-entity-special_dorax",
    icon = __G_MOD__.."/graphics/planet/64.png",
    icon_size = 64,
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
    draw_inventory_content = true,
    order = "zzz",
    subgroup = "enemies",

    collision_box = {{-4, -4}, {4, 4}},
    selection_box = {{-4, -4}, {4, 4}},
    damaged_trigger_effect = hit_effects.entity(),

    max_health = 100000000,
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
        percent = 0,
      },
      {
        type = "poison",
        decrease = 0,
        percent = 100
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

    --drawing_box_vertical_extension = 0.7,
    picture = {
      layers = {
        {
          filename = __G_MOD__.."/graphics/entity/dorax/item-extractor-hr-animation-1.png",
          width = 530,
          height = 530,
          scale = 0.5,
        },
        {
          filename = __G_MOD__.."/graphics/entity/dorax/item-extractor-hr-emission-1.png",
          width = 530,
          height = 530,
          scale = 0.5,
          draw_as_glow = true,
          blend_mode = "additive",
          tint = { 1.0, 0.0, 0.0 },
        },
        {
          filename = __G_MOD__.."/graphics/entity/dorax/item-extractor-hr-shadow.png",
          width = 1000,
          height = 666,
          scale = 0.5,
          draw_as_shadow = true,
        },
      }
    }
  }
}