local sounds = require("__base__.prototypes.entity.sounds")
local hit_effects = require ("__base__.prototypes.entity.hit-effects")
local item_sounds = require("__base__.prototypes.item_sounds")

local _cannon_tint = {1.0, 1.0, 0.0}

local turret_mosion = {
  layers =
  {
    util.sprite_load("__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel",
      {
        dice = 4,
        priority = "very-low",
        allow_low_quality_rotation = true,
        direction_count = 256,
        scale = 0.5,
        shift = {0.0, 0.0, 0.9722},
        --tint = _cannon_tint,
      }
    ),
    util.sprite_load("__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-shadow",
      {
        dice = 4,
        priority = "very-low",
        allow_low_quality_rotation = true,
        draw_as_shadow = true,
        direction_count = 256,
        scale = 0.5,
      }
    ),
    util.sprite_load("__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base",
      {
        dice = 4,
        priority = "very-low",
        allow_low_quality_rotation = true,
        direction_count = 256,
        scale = 0.5,
        tint = _cannon_tint,
      }
    ),
    util.sprite_load("__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-shadow",
      {
        dice = 4,
        priority = "very-low",
        allow_low_quality_rotation = true,
        draw_as_shadow = true,
        direction_count = 256,
        scale = 0.5
      }
    )
  }
}

data:extend {
  {
    type = "ammo-turret",
    name = "dps-turret_apfsds-cannon",
    icon = "__space-age__/graphics/icons/rocket-turret.png",
    flags = {"placeable-player", "player-creation"},
    minable = {mining_time = 3, result = "dps-turret_apfsds-cannon"},
    max_health = 500,
    corpse = "rocket-turret-remnants",
    dying_explosion = "rocket-turret-explosion",
    collision_box = {{-1.2, -1.2 }, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5 }, {1.5, 1.5}},
    damaged_trigger_effect = hit_effects.entity(),
    heating_energy = "50kW",

    rotation_speed = 0.002,
    preparing_speed = 0.08,
    rotating_sound =
    {
      sound =
      {
        filename = "__base__/sound/fight/artillery-rotation-loop.ogg",
        volume = 0.6,
        aggregation = {max_count = 3, remove = true, count_already_playing = true}
      },
      stopped_sound =
      {
        filename = "__base__/sound/fight/artillery-rotation-stop.ogg",
        aggregation = {max_count = 3, remove = true, count_already_playing = true}
      }
    },
    folding_speed = 0.08,
    inventory_size = 1,
    ammo_stack_limit = 15,
    automated_ammo_count = 10,
    attacking_speed = 0.5,
    alert_when_attacking = true,
    circuit_connector = circuit_connector_definitions["rocket-turret"],
    circuit_wire_max_distance = default_circuit_wire_max_distance,
    open_sound = sounds.turret_open,
    close_sound = sounds.turret_close,

    folded_animation = turret_mosion,
    preparing_animation = turret_mosion,
    prepared_animation = turret_mosion,
    attacking_animation = turret_mosion,
    folding_animation = turret_mosion,
    graphics_set =
    {
      base_visualisation =
      {
        animation =
        {
          layers =
          {
            util.sprite_load("__space-age__/graphics/entity/rocket-turret/rocket-turret-base",
                          {
                            priority = "high",
                            frame_count = 1,
                            scale = 0.5,
                            shift = util.by_pixel( 0.0, 0.0 + -20),
                          }),
            util.sprite_load("__space-age__/graphics/entity/rocket-turret/rocket-turret-base-mask",
                          {
                            flags = {"mask", "low-object"},
                            frame_count = 1,
                            apply_runtime_tint = true,
                            scale = 0.5,
                            shift = util.by_pixel( 0.0, 0.0-20),
                          }),
            util.sprite_load("__space-age__/graphics/entity/rocket-turret/rocket-turret-base-shadow",
                          {
                            frame_count = 1,
                            scale = 0.5,
                            shift = util.by_pixel( 0.0, 0.0-20),
                            draw_as_shadow = true,
                          }),

          }
        }
      },
      water_reflection =
      {
        pictures =
        {
          filename = "__base__/graphics/entity/lab/lab-reflection.png",
          priority = "extra-high",
          width = 24,
          height = 24,
          shift = util.by_pixel(5, 40),
          variation_count = 1,
          scale = 5
        },
        rotate = false,
        orientation_to_variation = false
      }
    },

    attack_parameters =
    {
      type = "projectile",
      ammo_category = "apfsds-shell",
      cooldown = 300,
      movement_slow_down_factor = 0,
      projectile_creation_distance = 1.6,
      projectile_center = {-0.15625, -0.07812},
      projectile_creation_parameters = require("__base__.prototypes.entity.artillery-cannon-muzzle-flash-shifting"),
      min_range = 32,
      range = 64,
      sound =
      {
        filename = "__base__/sound/fight/artillery-shoots-1.ogg",
        volume = 0.7,
        modifiers = volume_multiplier("main-menu", 0.9)
      },
    },

    call_for_help_radius = 40
  },



  {
    type = "item",
    name = "dps-turret_apfsds-cannon",
    icons = {
      {
        icon = "__base__/graphics/icons/artillery-turret.png",
        icon_size = 64,
        tint = {1.0, 1.0, 0.33}
      },
    },
    subgroup = "dps-item-subgroup_turret",
    --order = "b[turret]-c[flamethrower-turret]",
    inventory_move_sound = item_sounds.artillery_large_inventory_move,
    pick_sound = item_sounds.artillery_large_inventory_pickup,
    drop_sound = item_sounds.artillery_large_inventory_move,
    place_result = "dps-turret_apfsds-cannon",
    default_import_location = "dps-planet_dps",
    stack_size = 1,
    weight = 1000*tons
  },



  {
    type = "recipe",
    name = "dps-turret_apfsds-cannon",
    enabled = false,
    energy_required = 120,
    surface_conditions = __PLANET_CONDITIONS__,
    ingredients =
    {
      {type = "item", name = "dps-item_dps-credit-k", amount = 50},
      {type = "item", name = "concrete", amount = 1000},
      {type = "item", name = "steel-plate", amount = 500},
      {type = "item", name = "processing-unit", amount = 125},
    },
    results = {{type="item", name="dps-turret_apfsds-cannon", amount=1}},

    auto_recycle = false,
    allow_quality = false,
    can_set_quality = false,
  },
}