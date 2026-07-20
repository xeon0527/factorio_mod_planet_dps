local resource_autoplace = require("__core__/lualib/resource-autoplace")
local item_sounds = require("__base__.prototypes.item_sounds")
local _tint_color = { 1.0, 1.0, 0.0 }

resource_autoplace.initialize_patch_set("dps-resource_dps-scrap", true)

local _resource = table.deepcopy(data.raw.resource["iron-ore"])
_resource.name = "dps-resource_dps-scrap"
_resource.icon = nil
_resource.icons = {
  {
    icon = "__space-age__/graphics/icons/scrap.png",
    tint = _tint_color,
  }
}
_resource.minable.result = "dps-resource_dps-scrap"
_resource.map_color = { 1.0, 1.0, 0}
_resource.stages.sheet.filename = "__space-age__/graphics/entity/scrap/scrap.png"
_resource.stages.sheet.tint = _tint_color
_resource.autoplace = resource_autoplace.resource_autoplace_settings {
  name = "dps-autoplace-control_dps-scrap",
  --order = "c", -- Other resources are "b"; oil won't get placed if something else is already there.
  base_density = 1.0,
  has_starting_area_placement = true,
  regular_rq_factor_multiplier = 1,
  starting_rq_factor_multiplier = 2.0,
  candidate_spot_count = 22,

}

data:extend { _resource,
  {
    type = "item",
    name = "dps-resource_dps-scrap",
    icons = {
      {
        icon = "__space-age__/graphics/icons/scrap.png",
        tint = _tint_color,
      }
    },
    pictures =
    {
      { size = 64, filename = "__space-age__/graphics/icons/scrap.png",   scale = 0.5, mipmap_count = 4, tint = _tint_color },
      { size = 64, filename = "__space-age__/graphics/icons/scrap-1.png", scale = 0.5, mipmap_count = 4, tint = _tint_color },
      { size = 64, filename = "__space-age__/graphics/icons/scrap-2.png", scale = 0.5, mipmap_count = 4, tint = _tint_color },
      { size = 64, filename = "__space-age__/graphics/icons/scrap-3.png", scale = 0.5, mipmap_count = 4, tint = _tint_color },
      { size = 64, filename = "__space-age__/graphics/icons/scrap-4.png", scale = 0.5, mipmap_count = 4, tint = _tint_color },
      { size = 64, filename = "__space-age__/graphics/icons/scrap-5.png", scale = 0.5, mipmap_count = 4, tint = _tint_color }
    },
    subgroup = "dps-item-subgroup_item",
    inventory_move_sound = item_sounds.resource_inventory_move,
    pick_sound = item_sounds.resource_inventory_pickup,
    drop_sound = item_sounds.resource_inventory_move,
    stack_size = 50,
    default_import_location = "dps-planet_dps",
    weight = 2*kg,
    auto_recycle = false,
  },

  {
    type = "recipe",
    name = "dps-recipe_dps-scrap-recycling",
    icons = {
      {
        icon = "__recycler__/graphics/icons/recycling.png"
      },
      {
        icon = "__space-age__/graphics/icons/scrap.png",
        tint = _tint_color,
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
    ingredients = {{type = "item", name = "dps-resource_dps-scrap", amount = 1}},
    results =
    {
      {type = "item", name = "iron-plate",            amount = 1, shared_probability = { min = 0.00, max = 0.40 }, show_details_in_recipe_tooltip = false},
      {type = "item", name = "solid-fuel",            amount = 1, shared_probability = { min = 0.40, max = 0.54 }, show_details_in_recipe_tooltip = false},
      {type = "item", name = "concrete",              amount = 1, shared_probability = { min = 0.54, max = 0.66 }, show_details_in_recipe_tooltip = false},
      {type = "item", name = "copper-plate",          amount = 1, shared_probability = { min = 0.66, max = 0.76 }, show_details_in_recipe_tooltip = false},
      {type = "item", name = "stone",                 amount = 1, shared_probability = { min = 0.76, max = 0.84 }, show_details_in_recipe_tooltip = false},
      {type = "item", name = "advanced-circuit",      amount = 1, shared_probability = { min = 0.84, max = 0.90 }, show_details_in_recipe_tooltip = false},
      {type = "item", name = "processing-unit",       amount = 1, shared_probability = { min = 0.90, max = 0.94 }, show_details_in_recipe_tooltip = false},
      {type = "item", name = "steel-plate",           amount = 1, shared_probability = { min = 0.94, max = 0.96 }, show_details_in_recipe_tooltip = false},
      {type = "item", name = "low-density-structure", amount = 1, shared_probability = { min = 0.96, max = 0.98 }, show_details_in_recipe_tooltip = false},
    }
  },
}