local item_sounds = require("__base__.prototypes.item_sounds")

local function _create_ammo(level, damage, tint)
  data:extend {
    {
      type = "ammo",
      name = "dps-ammo_apfsds-shell-"..level,
      icons = {
        {
          icon = __PATH__.."/graphics/icons/apfsds-shell.png",
          icon_size = 64,
          tint = tint
        }
      },
      ammo_category = "apfsds-shell",
      ammo_type =
      {
        target_type = "entity",
        action =
        {
          type = "direct",
          action_delivery =
          {
            type = "projectile",
            projectile = "dps-projectile_apfsds-shell-"..level,
            starting_speed = 5,
            direction_deviation = 0,
            range_deviation = 0,
            source_effects =
            {
              type = "create-explosion",
              entity_name = "artillery-cannon-muzzle-flash"
            }
          }
        }
      },
  
      subgroup = "dps-item-subgroup_ammo",
      --order = "d[cannon-shell]-a[basic]",
      inventory_move_sound = item_sounds.ammo_large_inventory_move,
      pick_sound = item_sounds.ammo_large_inventory_pickup,
      drop_sound = item_sounds.ammo_large_inventory_move,
      --stack_size = 5,
      stack_size = 1000,
      weight = 1000*tons
    },
  
    {
      type = "projectile",
      name = "dps-projectile_apfsds-shell-"..level,
      flags = {"not-on-map"},
      hidden = true,
      acceleration = 0,
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            {
              type = "damage",
              damage = {amount = damage , type = "dps-damage-type_dps"}
            },
            {
              type = "create-entity",
              entity_name = "dps-explosion_apfsds-shell",
            },
          }
        }
      },
      animation =
      {
        filename = "__base__/graphics/entity/bullet/bullet.png",
        draw_as_glow = true,
        width = 3,
        height = 50,
        priority = "high",
        tint = { 0.0, 1.0, 1.0 },
        scale = 3,
      }
    }
  }
end

_create_ammo(1, 1, {1,0,0})
_create_ammo(2, 2, {1,0.66,0})
_create_ammo(3, 3, {1,1,0})
_create_ammo(4, 4, {0,1,0})
_create_ammo(5, 5, {0.25,0.25,1})


--dps-recipe-category_dps-equipment-enhancer

data:extend {
  {
    type = "recipe",
    name = "dps-ammo_apfsds-shell-1",
    enabled = false,
    energy_required = 10,
    surface_conditions = __PLANET_CONDITIONS__,
    ingredients = {
      {type = "item", name = "dps-item_dps-credit-n", amount = 100},
      {type = "item", name = "steel-plate", amount = 50},
      {type = "item", name = "copper-cable", amount = 50},
    },
    results = {{type="item", name="dps-ammo_apfsds-shell-1", amount=1}},

    auto_recycle = false,
    allow_quality = false,
    can_set_quality = false,
  },

  {
    type = "recipe",
    name = "dps-ammo_apfsds-shell-2",
    enabled = true,
    energy_required = 1,
    surface_conditions = __PLANET_CONDITIONS__,
    categories = { "dps-recipe-category_dps-equipment-enhancer" },
    ingredients = {
      {type = "item", name = "dps-item_dps-credit-n", amount = 5},
      {type = "item", name = "dps-ammo_apfsds-shell-1", amount = 1},
    },
    results = {{type="item", name="dps-ammo_apfsds-shell-2", amount = 1, independent_probability = 0.3}},

    auto_recycle = false,
    allow_quality = false,
    can_set_quality = false,
  },

  {
    type = "recipe",
    name = "dps-ammo_apfsds-shell-3",
    enabled = true,
    energy_required = 1,
    surface_conditions = __PLANET_CONDITIONS__,
    categories = { "dps-recipe-category_dps-equipment-enhancer" },
    ingredients = {
      {type = "item", name = "dps-item_dps-credit-n", amount = 10},
      {type = "item", name = "dps-ammo_apfsds-shell-2", amount = 1},
    },
    results = {{type="item", name="dps-ammo_apfsds-shell-3", amount = 1, independent_probability = 0.3}},

    auto_recycle = false,
    allow_quality = false,
    can_set_quality = false,
  },

  {
    type = "recipe",
    name = "dps-ammo_apfsds-shell-4",
    enabled = true,
    energy_required = 1,
    surface_conditions = __PLANET_CONDITIONS__,
    categories = { "dps-recipe-category_dps-equipment-enhancer" },
    ingredients = {
      {type = "item", name = "dps-item_dps-credit-n", amount = 15},
      {type = "item", name = "dps-ammo_apfsds-shell-3", amount = 1},
    },
    results = {{type="item", name="dps-ammo_apfsds-shell-4", amount = 1, independent_probability = 0.3}},

    auto_recycle = false,
    allow_quality = false,
    can_set_quality = false,
  },

  {
    type = "recipe",
    name = "dps-ammo_apfsds-shell-5",
    enabled = true,
    energy_required = 1,
    surface_conditions = __PLANET_CONDITIONS__,
    categories = { "dps-recipe-category_dps-equipment-enhancer" },
    ingredients = {
      {type = "item", name = "dps-item_dps-credit-n", amount = 20},
      {type = "item", name = "dps-ammo_apfsds-shell-4", amount = 1},
    },
    results = {{type="item", name="dps-ammo_apfsds-shell-5", amount = 1, independent_probability = 0.3}},

    auto_recycle = false,
    allow_quality = false,
    can_set_quality = false,
  },
}