local tint_color = { 1.0, 1.0, 0.0 }

data:extend {
  {
    type = "recipe",
    name = "dps-recipe_subcore-scrap-recycling",
    icons = {
      {
        icon = "__quality__/graphics/icons/recycling.png"
      },
      {
        icon = "__space-age__/graphics/icons/scrap.png",
        tint = tint_color,
        scale = 0.4
      },
      {
        icon = "__quality__/graphics/icons/recycling-top.png"
      }
    },
    category = "recycling-or-hand-crafting",
    subgroup = "dps-item-subgroup_scrap",
    enabled = false,
    auto_recycle = false,
    energy_required = 0.2,
    ingredients = {{type = "item", name = "dps-item_subcore-scrap", amount = 1}},
    results =
    {
      {type = "item", name = "iron-gear-wheel",        amount = 1, probability = 0.20, show_details_in_recipe_tooltip = false},
      {type = "item", name = "solid-fuel",             amount = 1, probability = 0.07, show_details_in_recipe_tooltip = false},
      {type = "item", name = "concrete",               amount = 1, probability = 0.06, show_details_in_recipe_tooltip = false},
      --{type = "item", name = "ice",                    amount = 1, probability = 0.05, show_details_in_recipe_tooltip = false},
      --{type = "item", name = "battery",                amount = 1, probability = 0.04, show_details_in_recipe_tooltip = false},
      {type = "item", name = "copper-cable",                            amount = 1, probability = 0.05, show_details_in_recipe_tooltip = false},
      {type = "item", name = "stone",                                   amount = 1, probability = 0.04, show_details_in_recipe_tooltip = false},
      {type = "item", name = "advanced-circuit",                        amount = 1, probability = 0.03, show_details_in_recipe_tooltip = false},
      {type = "item", name = "processing-unit",                         amount = 1, probability = 0.02, show_details_in_recipe_tooltip = false},
      {type = "item", name = "steel-plate",                             amount = 1, probability = 0.01, show_details_in_recipe_tooltip = false},
      {type = "item", name = "low-density-structure",                   amount = 1, probability = 0.01, show_details_in_recipe_tooltip = false},
      {type = "item", name = "dps-item_promethium-subcore-fragment",    amount = 1, probability = 0.005, show_details_in_recipe_tooltip = false},
    }
  },
}