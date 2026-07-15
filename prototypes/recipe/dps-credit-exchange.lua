local _recipe = {
  type = "recipe",
  name = "dps-recipe_dps-credit-exchange",
  icons = {
    {
      icon = "__space-exploration-graphics__/graphics/icons/observation-frame-infrared.png",
      icon_size = 64,
    },
    {
      icon_size = 64,
      scale = 0.25,
      shift = {-8, -8},
      floating = true,
    },
    {
      icon_size = 64,
      scale = 0.25,
      shift = {8, -8},
      floating = true,
    }
  },
  enabled = false,
  energy_required = 1.0,
  auto_recycle = false,
  subgroup = "dps-item-subgroup_recipe",
}

local function _generate_recipe(a, b)
  local a2b = table.deepcopy(_recipe)
  a2b.name = a2b.name.."-"..string.lower(a).."2"..string.lower(b)
  a2b.icons[2].icon = "__base__/graphics/icons/signal/signal_"..string.upper(a)..".png"
  a2b.icons[3].icon = "__base__/graphics/icons/signal/signal_"..string.upper(b)..".png"
  a2b.ingredients = {{ type = "item", name = "dps-item_dps-credit-"..string.lower(a), amount = 1000 }}
  a2b.results = {{ type = "item", name = "dps-item_dps-credit-"..string.lower(b), amount = 1}}

  local b2a = table.deepcopy(_recipe)
  b2a.name = b2a.name.."-"..string.lower(b).."2"..string.lower(a)
  b2a.icons[2].icon = "__base__/graphics/icons/signal/signal_"..string.upper(b)..".png"
  b2a.icons[3].icon = "__base__/graphics/icons/signal/signal_"..string.upper(a)..".png"
  b2a.ingredients = {{ type = "item", name = "dps-item_dps-credit-"..string.lower(b), amount = 1 }}
  b2a.results = {{ type = "item", name = "dps-item_dps-credit-"..string.lower(a), amount = 1000 }}

  data:extend { a2b, b2a, }
end

_generate_recipe("N", "K")
_generate_recipe("K", "M")
_generate_recipe("M", "G")
_generate_recipe("G", "T")