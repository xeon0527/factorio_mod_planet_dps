local item_sounds = require("__base__.prototypes.item_sounds")

local function _create_ammo(level, damage, tint, order)
  data:extend {
    {
      type = "ammo",
      name = "dps-ammo_apfsds-shell_"..level,
      order = order,
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
            projectile = "dps-projectile_apfsds-shell_"..level,
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
      stack_size = 10,
      --stack_size = 1000,
      weight = 1000*tons,
      auto_recycle = false,
    },
  
    {
      type = "projectile",
      name = "dps-projectile_apfsds-shell_"..level,
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
        tint = { 1.0, 1.0, 0.0 },
        scale = 3,
      }
    }
  }
end

local function _create_basic_recipe(level, credit)
  data:extend {
    {
      type = "recipe",
      name = "dps-ammo_apfsds-shell_"..level,
      enabled = false,
      energy_required = 1,
      surface_conditions = __PLANET_CONDITIONS__,
      categories = { "dps-recipe-category_dps-equipment-enhancer" },
      ingredients = {
        {type = "item", name = "dps-item_dps-credit_n", amount = credit},
        {type = "item", name = "dps-ammo_apfsds-shell_"..(level-1), amount = 1},
      },
      results = {{type="item", name="dps-ammo_apfsds-shell_"..level, amount = 1, independent_probability = 0.4}},

      maximum_productivity = 1.5,
      auto_recycle = false,
      allow_quality = false,
      can_set_quality = false,
    },
  }
end

local function _create_adv_recipe(level, tint, credit_k, probability, order)
  for pt = 0, 85, 5 do
    local pt_prob = (1 - probability) * (pt/100)

    data:extend {
      {
        type = "recipe",
        name = "dps-ammo_apfsds-shell_"..level.."_"..pt,
        icons = {
          {
            icon = __PATH__.."/graphics/icons/apfsds-shell.png",
            icon_size = 64,
            tint = tint
          }
        },

        hidden = false,
        hidden_in_factoriopedia = true,

        localised_name = {"item-name.".."dps-ammo_apfsds-shell_"..level},
        localised_description = {"item-description.".."dps-ammo_apfsds-shell_"..level},
        subgroup = "dps-item-subgroup_ammo",
        order = order,

        enabled = false,
        energy_required = 1,
        surface_conditions = __PLANET_CONDITIONS__,
        categories = { "dps-recipe-category_dps-equipment-enhancer" },
        ingredients = {
          {type = "item", name = "dps-item_dps-credit_k", amount = credit_k},
          {type = "item", name = "dps-ammo_apfsds-shell_"..(level-1), amount = 1},
        },
        main_product = "dps-ammo_apfsds-shell_"..level,
        results = {
          { type="item", name="dps-ammo_apfsds-shell_"..level, amount = 1,      shared_probability = { min = 0.0, max = probability } },
          { type="item", name="dps-ammo_apfsds-shell_"..(level-1), amount = 1,  shared_probability = { min = probability, max = probability + pt_prob } }
        },
  
        maximum_productivity = 100,
        auto_recycle = false,
        allow_quality = false,
        can_set_quality = false,
      },
    }
  end
end

_create_ammo(1, 1, {1,0,0}, "a")
_create_ammo(2, 2, {1,0.66,0}, "b")
_create_ammo(3, 3, {1,1,0}, "c")
_create_ammo(4, 4, {0,1,0}, "d")
_create_ammo(5, 5, {0.25,0.25,1}, "e")

_create_ammo(6, 10,    {208, 112, 251}, "f")
_create_ammo(7, 15,    {165, 42, 42}, "g")
_create_ammo(8, 20,    {0,1,1}, "h")
_create_ammo(9, 25,    {0.25,0.25,0.25}, "i")
_create_ammo(10, 30,  {1,1,1}, "j")




_create_basic_recipe(2, 10)
_create_basic_recipe(3, 20)
_create_basic_recipe(4, 30)
_create_basic_recipe(5, 50)

_create_adv_recipe(6, {208, 112, 251}, 1, 0.4, "f")
_create_adv_recipe(7, {165, 42, 42}, 2, 0.3, "g")
_create_adv_recipe(8, {0,1,1}, 3, 0.2, "h")
_create_adv_recipe(9, {0.25,0.25,0.25}, 5, 0.1, "i")
_create_adv_recipe(10, {1,1,1}, 10, 0.05, "j")

data:extend {
  {
    type = "recipe",
    name = "dps-ammo_apfsds-shell_1",
    enabled = false,
    energy_required = 10,
    surface_conditions = __PLANET_CONDITIONS__,
    ingredients = {
      {type = "item", name = "dps-item_dps-credit_n", amount = 50},
      {type = "item", name = "steel-plate", amount = 25},
      {type = "item", name = "copper-cable", amount = 25},
    },
    results = {{type="item", name="dps-ammo_apfsds-shell_1", amount=1}},

    maximum_productivity = 10,
    auto_recycle = false,
    allow_quality = false,
    can_set_quality = false,
  },
}