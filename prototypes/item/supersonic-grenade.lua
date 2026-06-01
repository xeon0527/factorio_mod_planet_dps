local item_sounds = require("__base__.prototypes.item_sounds")

data:extend {
  {
    type = "ammo",
    name = "dps-ammo_supersonic-grenade",
    icon = "__space-exploration-graphics__/graphics/icons/meteor-defence-ammo.png",
    icon_size = 64,
    ammo_category = "supersonic-grenade",
    ammo_type =
    {
      target_type = "entity",
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "projectile",
          projectile = "dps-projectile_supersonic-grenade",
          starting_speed = 3,
        }
      }
    },

    subgroup = "ammo",
    order = "d[cannon-shell]-a[basic]",
    inventory_move_sound = item_sounds.ammo_large_inventory_move,
    pick_sound = item_sounds.ammo_large_inventory_pickup,
    drop_sound = item_sounds.ammo_large_inventory_move,
    stack_size = 100,
    weight = 20*kg
  },
  {
    type = "recipe",
    name = "dps-ammo_supersonic-grenade",
    enabled = false,
    energy_required = 1,
    ingredients = {
      {type = "item", name = "explosives", amount = 1},
      {type = "item", name = "steel-plate", amount = 2},
      {type = "item", name = "copper-cable", amount = 2},
    },
    results = {{type="item", name="dps-ammo_supersonic-grenade", amount=1}}
  },
}