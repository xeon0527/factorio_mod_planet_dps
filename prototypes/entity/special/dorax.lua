require("global/_hdr")
local enemy_autoplace = require ("__base__.prototypes.entity.enemy-autoplace-utils")

data:extend {
  {
    type = "container",
    name = "dps-entity-special_dorax",
    icon = __G_MOD__.."/graphics/planet/64.png",
    icon_size = 64,
    flags = {
      "placeable-enemy",
      "not-rotatable",
      "not-repairable",
      "not-blueprintable",
      "hide-alt-info",
      --"not-flammable",
      --"no-automated-item-removal",
      "no-automated-item-insertion",
      "not-upgradable",
      "not-in-kill-statistics",
      "not-in-made-in",
      "breaths-air",
    },
    map_color = { 1, 0, 0 },
    hidden = true,
    hidden_in_factoriopedia = true,

    collision_box = {{-3.9, -3.9}, {3.9, 3.9}},
    selection_box = {{-4, -4}, {4, 4}},
    collision_mask = {layers={item=true, object=true, player=true, water_tile=true, elevated_rail=true, is_object=true, is_lower_object=true}},
    
    max_health = 1000000000,
    inventory_size = 1000,
    quality_affects_inventory_size = false,
    draw_copper_wires = false,
    draw_circuit_wires = false,

    --autoplace = enemy_autoplace.enemy_spawner_autoplace("enemy_autoplace_base(0, 6)"),

    drawing_box_vertical_extension = 0.7,
    pictures = {
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