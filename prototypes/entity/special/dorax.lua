require("global/_hdr")
local hit_effects = require("__base__.prototypes.entity.hit-effects")

data:extend {
  {
    type = "proxy-container",
    name = "dps-special_dorax",
    icon = __PATH__.."/graphics/planet/64.png",
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
    --resistances = {
    --  {
    --    type = "physical",
    --    decrease = 10000,
    --    percent = 99,
    --  },
    --  {
    --    type = "explosion",
    --    decrease = 1000,
    --    percent = 99,
    --  },
    --},
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
          filename = __PATH__.."/graphics/entity/dorax/item-extractor-hr-animation-1.png",
          width = 530,
          height = 530,
          scale = 0.5,
        },
        {
          filename = __PATH__.."/graphics/entity/dorax/item-extractor-hr-emission-1.png",
          width = 530,
          height = 530,
          scale = 0.5,
          draw_as_glow = true,
          blend_mode = "additive",
          tint = { 1.0, 0.0, 0.0 },
        },
        {
          filename = __PATH__.."/graphics/entity/dorax/item-extractor-hr-shadow.png",
          width = 1000,
          height = 666,
          scale = 0.5,
          draw_as_shadow = true,
        },
      }
    }
  },
  {
    type = "container",
    name = "dps-special_dorax-container",
    icon = __PATH__.."/graphics/planet/64.png",
    icon_size = 64,
    flags = {
      "placeable-player",
      "not-rotatable",
      "not-repairable",
      "not-blueprintable",
      "hide-alt-info",
      "not-flammable",
      "no-automated-item-insertion",
      "not-upgradable",
      "hide-alt-info",
      "not-in-made-in",
      "not-in-kill-statistics",
    },
    hidden = true,
    hidden_in_factoriopedia = true,

    --selection_box = nil,
    collision_box = {{-4, -4}, {4, 4}},
    --hit_visualization_box = nil,
    --shooting_cursor_size = 0,

    inventory_size = 100,
    inventory_type = "with_filters_and_bar",

    draw_copper_wires = false,
    draw_circuit_wires = false,
    selectable_in_game = false,
  }
}