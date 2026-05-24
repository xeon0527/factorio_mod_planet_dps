require("global/_hdr")

data:extend {
  {
    type = "container",
    name = "dps-entity-building_promethium-subcore-container",
    icons = {
      {
        icon = "__base__/graphics/icons/lab.png",
        tint = { 1.0, 0.5, 0.5 },
      }
    },
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
    inventory_type = "with_filters_and_bar",

    draw_copper_wires = false,
    draw_circuit_wires = false,
  }
}