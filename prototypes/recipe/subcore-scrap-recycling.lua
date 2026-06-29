local tint_color = { 1.0, 1.0, 0.0 }

data:extend {
  {
    type = "recipe",
    name = "dps-recipe_subcore-scrap-recycling",
    icons = {
      {
        icon = "__recycler__/graphics/icons/recycling.png"
      },
      {
        icon = "__space-age__/graphics/icons/scrap.png",
        tint = tint_color,
        scale = 0.4
      },
      {
        icon = "__recycler__/graphics/icons/recycling-top.png"
      }
    },
    categories = {"recycling", "hand-crafting"},
    subgroup = "dps-item-subgroup_item",
    enabled = false,
    auto_recycle = false,
    energy_required = 0.2,
    ingredients = {{type = "item", name = "dps-item_subcore-scrap", amount = 1}},
    results =
    {
      {type = "item", name = "iron-gear-wheel",                         amount = 1, shared_probability = { min = 0.00, max = 0.20 }, show_details_in_recipe_tooltip = false},
      {type = "item", name = "solid-fuel",                              amount = 1, shared_probability = { min = 0.20, max = 0.27 }, show_details_in_recipe_tooltip = false},
      {type = "item", name = "concrete",                                amount = 1, shared_probability = { min = 0.27, max = 0.33 }, show_details_in_recipe_tooltip = false},
      {type = "item", name = "copper-cable",                            amount = 1, shared_probability = { min = 0.33, max = 0.38 }, show_details_in_recipe_tooltip = false},
      {type = "item", name = "stone",                                   amount = 1, shared_probability = { min = 0.38, max = 0.42 }, show_details_in_recipe_tooltip = false},
      {type = "item", name = "advanced-circuit",                        amount = 1, shared_probability = { min = 0.42, max = 0.45 }, show_details_in_recipe_tooltip = false},
      {type = "item", name = "processing-unit",                         amount = 1, shared_probability = { min = 0.45, max = 0.47 }, show_details_in_recipe_tooltip = false},
      {type = "item", name = "steel-plate",                             amount = 1, shared_probability = { min = 0.47, max = 0.48 }, show_details_in_recipe_tooltip = false},
      {type = "item", name = "low-density-structure",                   amount = 1, shared_probability = { min = 0.48, max = 0.49 }, show_details_in_recipe_tooltip = false},
      {type = "item", name = "dps-item_promethium-subcore-fragment",    amount = 1, shared_probability = { min = 0.49, max = 0.495 }, show_details_in_recipe_tooltip = false},
    }
  },
}