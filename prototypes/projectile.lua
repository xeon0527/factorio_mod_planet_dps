data:extend {
  {
    type = "projectile",
    name = "dps-projectile_supersonic-grenade",
    flags = {"not-on-map"},
    hidden = true,
    --collision_box = {{-0.3, -1.1}, {0.3, 1.1}},
    acceleration = 0,
    --direction_only = true,
    --force_condition = "enemy",
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
            damage = {amount = 350 , type = "physical"}
          },
          {
            type = "nested-result",
            action =
            {
              type = "area",
              radius = 4.75,
              action_delivery =
              {
                type = "instant",
                target_effects =
                {
                  {
                    type = "damage",
                    damage = {amount = 350 , type = "explosion"}
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
          --{
          --  type = "damage",
          --  damage = {amount = 1 , type = "dps-damage-type_dps"}
          --},
          {
            type = "destroy-decoratives",
            from_render_layer = "decorative",
            to_render_layer = "object",
            include_soft_decoratives = true, -- soft decoratives are decoratives with grows_through_rail_path = true
            include_decals = false,
            invoke_decorative_trigger = true,
            decoratives_with_trigger_only = false, -- if true, destroys only decoratives that have trigger_effect set
            radius = 4.75 -- large radius for demostrative purposes
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
      priority = "high"
    }
  }
}