require("global/_hdr")
local hit_effects = require("__base__.prototypes.entity.hit-effects")
local enemy_autoplace = require ("__base__.prototypes.entity.enemy-autoplace-utils")

data:extend {
  {
    type = "container",
    name = "dps-entity-building_promethium-datacore-container",
    icon = "__base__/graphics/icons/lab.png",
    --icon_size = 64,
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

    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    inventory_size = 100,

    draw_copper_wires = false,
    draw_circuit_wires = false,
  }
}