local _recipe = {
  type = "recipe",
  name = "dps-recipe_dps-credit-exchange",
  icons = {
    {
      icon = "__base__/graphics/icons/arrows/right-arrow.png",
      icon_size = 64,
      scale = 0.25,
      shift = {0, 8},
    },
    {
      icon_size = 64,
      scale = 0.25,
      shift = {-8, -8},
    },
    {
      icon_size = 64,
      scale = 0.25,
      shift = {8, -8},
    }
  },
  enabled = false,
  energy_required = 1.0,
  auto_recycle = false,
  allow_quality = false,
  can_set_quality = false,
  subgroup = "dps-item-subgroup_credit",
}

local function _generate_recipe(a, b, order)
  local a_name = "dps-item_dps-credit-"..string.lower(a)
  local b_name = "dps-item_dps-credit-"..string.lower(b)

  local a_icon = data.raw["item"][a_name].icon
  local b_icon = data.raw["item"][b_name].icon

  local a2b = table.deepcopy(_recipe)
  a2b.name = a2b.name.."-"..string.lower(a).."2"..string.lower(b)


  a2b.icons[2].icon = a_icon
  a2b.icons[3].icon = b_icon
  a2b.ingredients = {{ type = "item", name = a_name, amount = 1000 }}
  a2b.results = {{ type = "item", name = b_name, amount = 1}}

  local b2a = table.deepcopy(_recipe)
  b2a.name = b2a.name.."-"..string.lower(b).."2"..string.lower(a)
  b2a.icons[2].icon = b_icon
  b2a.icons[3].icon = a_icon
  b2a.ingredients = {{ type = "item", name = b_name, amount = 1 }}
  b2a.results = {{ type = "item", name = a_name, amount = 1000 }}

  a2b.order = tostring(order)
  b2a.order = tostring(order + 4)

  data:extend { a2b, b2a, }
end

_generate_recipe("N", "K", 1)
_generate_recipe("K", "M", 2)
_generate_recipe("M", "G", 3)
_generate_recipe("G", "T", 4)