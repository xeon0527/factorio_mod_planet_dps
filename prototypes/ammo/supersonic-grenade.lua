local item_sounds = require("__base__.prototypes.item_sounds")

data:extend {
  {
    type = "ammo",
    name = "dps-ammo_supersonic-grenade",
    icon =  "__space-exploration-graphics__/graphics/icons/meteor-defence-ammo.png",
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

    subgroup = "dps-item-subgroup_ammo",
    --order = "d[cannon-shell]-a[basic]",
    inventory_move_sound = item_sounds.ammo_large_inventory_move,
    pick_sound = item_sounds.ammo_large_inventory_pickup,
    drop_sound = item_sounds.ammo_large_inventory_move,
    stack_size = 100,
    weight = 10*kg
  },

  {
    type = "projectile",
    name = "dps-projectile_supersonic-grenade",
    flags = {"not-on-map"},
    hidden = true,
    --collision_box = {{-0.3, -1.1}, {0.3, 1.1}},
    acceleration = 0,
    --direction_only = true,
    ---force_condition = "enemy",
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-entity",
            entity_name = "big-explosion",
            only_when_visible = true
          },
          {
            type = "damage",
            damage = {amount = 200 , type = "physical"}
          },
          {
            type = "nested-result",
            action =
            {
              type = "area",
              radius = 6.5,
              force = "enemy",
              action_delivery =
              {
                type = "instant",
                target_effects =
                {
                  {
                    type = "damage",
                    damage = {amount = 200 , type = "explosion"}
                  },
                  {
                    type = "create-entity",
                    entity_name = "explosion",
                    only_when_visible = true
                  }
                }
              }
            }
          },
          {
            type = "destroy-decoratives",
            from_render_layer = "decorative",
            to_render_layer = "object",
            include_soft_decoratives = true, -- soft decoratives are decoratives with grows_through_rail_path = true
            include_decals = false,
            invoke_decorative_trigger = true,
            decoratives_with_trigger_only = false, -- if true, destroys only decoratives that have trigger_effect set
            radius = 6.5 -- large radius for demostrative purposes
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
      scale = 2,
    }
  },



  {
    type = "recipe",
    name = "dps-ammo_supersonic-grenade",
    enabled = false,
    energy_required = 1,
    ingredients = {
      {type = "item", name = "explosives", amount = 1},
      {type = "item", name = "iron-plate", amount = 1},
      {type = "item", name = "copper-cable", amount = 2},
    },
    results = {{type="item", name="dps-ammo_supersonic-grenade", amount=1}}
  },
}