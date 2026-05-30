local item_sounds = require("__base__.prototypes.item_sounds")
local tint_color = { 1.0, 1.0, 0.0 }

data:extend {
  {
    type = "item",
    name = "dps-item_subcore-scrap",
    icons = {
      {
        icon = "__space-age__/graphics/icons/scrap.png",
        tint = tint_color,
      }
    },
    pictures =
    {
      { size = 64, filename = "__space-age__/graphics/icons/scrap.png",   scale = 0.5, mipmap_count = 4, tint = tint_color },
      { size = 64, filename = "__space-age__/graphics/icons/scrap-1.png", scale = 0.5, mipmap_count = 4, tint = tint_color },
      { size = 64, filename = "__space-age__/graphics/icons/scrap-2.png", scale = 0.5, mipmap_count = 4, tint = tint_color },
      { size = 64, filename = "__space-age__/graphics/icons/scrap-3.png", scale = 0.5, mipmap_count = 4, tint = tint_color },
      { size = 64, filename = "__space-age__/graphics/icons/scrap-4.png", scale = 0.5, mipmap_count = 4, tint = tint_color },
      { size = 64, filename = "__space-age__/graphics/icons/scrap-5.png", scale = 0.5, mipmap_count = 4, tint = tint_color }
    },
    subgroup = "dps-item-subgroup_scrap",
    inventory_move_sound = item_sounds.resource_inventory_move,
    pick_sound = item_sounds.resource_inventory_pickup,
    drop_sound = item_sounds.resource_inventory_move,
    stack_size = 50,
    default_import_location = "dps-planet_dps",
    weight = 2*kg,
    auto_recycle = false,
  },
}