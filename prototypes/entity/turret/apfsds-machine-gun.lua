local sounds = require("__base__.prototypes.entity.sounds")
local hit_effects = require ("__base__.prototypes.entity.hit-effects")
local item_sounds = require("__base__.prototypes.item_sounds")


local function _create_recipe(level, icons, credit_k, probability, order)
  --for pt = 0, 85, 5 do
  --local pt_prob = (1 - probability) * (pt/100)

  data:extend {
    {
      type = "recipe",
      name = "dps-turret_apfsds-machine-gun_"..level,--.."_"..pt,
      icons = icons,
      hidden = false,
      hidden_in_factoriopedia = true,

      localised_name = {"entity-name.".."dps-turret_apfsds-machine-gun_"..level},
      localised_description = {"entity-description.".."dps-turret_apfsds-machine-gun_"..level},
      subgroup = "dps-item-subgroup_turret",
      order = order,

      enabled = false,
      energy_required = 1,
      surface_conditions = __PLANET_CONDITIONS__,
      categories = { "dps-recipe-category_dps-equipment-enhancer" },
      ingredients = {
        {type = "item", name = "dps-item_dps-credit_k", amount = credit_k},
        {type = "item", name = "dps-turret_apfsds-machine-gun_"..(level-1), amount = 1},
      },
      main_product = "dps-turret_apfsds-machine-gun_"..level,
      results = {
        { type="item", name="dps-turret_apfsds-machine-gun_"..level, amount = 1,      shared_probability = { min = 0.0, max = probability } },
        --{ type="item", name="dps-turret_apfsds-machine-gun_"..(level-1), amount = 1,  shared_probability = { min = probability, max = probability + pt_prob } }
      },

      maximum_productivity = 100,
      auto_recycle = false,
      allow_quality = false,
      can_set_quality = false,
    },
  }
  --end
end

local function _generate(level, tint, order, credit_k, probability)
  local turret_anim = {
    layers =
    {
      {
        filename = "__base__/graphics/entity/tank/tank-turret.png",
        priority = "low",
        line_length = 8,
        width = 179,
        height = 132,
        direction_count = 64,
        shift = util.by_pixel(2.25-2, -40.5 + 19),
        animation_speed = 8,
        scale = 0.5
      },
      {
        filename = "__base__/graphics/entity/tank/tank-turret-mask.png",
        priority = "low",
        line_length = 8,
        width = 72,
        height = 66,
        direction_count = 64,
        shift = util.by_pixel(2-2, -41.5 + 19),
        scale = 0.5,
        tint = tint
      },
      {
        filename = "__base__/graphics/entity/tank/tank-turret-shadow.png",
        priority = "low",
        line_length = 8,
        width = 193,
        height = 134,
        draw_as_shadow = true,
        direction_count = 64,
        shift = util.by_pixel(0, 0.5),
        scale = 0.5
      }
    }
  }

  local _icons = {
    {
      icon = "__base__/graphics/icons/tank-cannon.png",
      tint = tint,
    },
  }

  data:extend {
    {
      type = "ammo-turret",
      name = "dps-turret_apfsds-machine-gun_"..level,
      icons = _icons,
      flags = {"placeable-player", "player-creation"},
      minable = {mining_time = 1, result = "dps-turret_apfsds-machine-gun_"..level},
      max_health = 1000,
      corpse = "gun-turret-remnants",
      dying_explosion = "gun-turret-explosion",
      collision_box = {{-0.7, -0.7 }, {0.7, 0.7}},
      selection_box = {{-1, -1 }, {1, 1}},
      damaged_trigger_effect = hit_effects.entity(),

      energy_source =
      {
        type = "electric",
        buffer_capacity = "10MJ",
        usage_priority = "primary-input"
      },
      energy_per_shot = "10MJ",

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
      folding_speed = 1,
      inventory_size = 1,
      ammo_stack_limit = 15,
      automated_ammo_count = 10,
      attacking_speed = 1,
      alert_when_attacking = false,
      circuit_connector = circuit_connector_definitions["gun-turret"],
      circuit_wire_max_distance = default_circuit_wire_max_distance,
      open_sound = sounds.turret_open,
      close_sound = sounds.turret_close,

      folded_animation = turret_anim,
      preparing_animation = turret_anim,
      prepared_animation = turret_anim,
      attacking_animation = turret_anim,
      folding_animation = turret_anim,
      graphics_set =
      {
        base_visualisation =
        {
          animation =
          {
            layers =
            {
              {
                filename = __PATH__.."/graphics/entity/apfsds-machine-gun/base.png",
                priority = "high",
                width = 150,
                height = 118,
                shift = util.by_pixel(0.5, -1),
                scale = 0.5
              },
              {
                filename = __PATH__.."/graphics/entity/apfsds-machine-gun/base-mask.png",
                flags = {"mask", "low-object"},
                line_length = 1,
                width = 122,
                height = 102,
                shift = util.by_pixel(0, -4.5),
                scale = 0.5,
                tint = tint
              }
            }
          }
        },
      },

      attack_parameters =
      {
        type = "projectile",
        ammo_category = "apfsds-shell",
        cooldown = 150,
        movement_slow_down_factor = 0,
        projectile_creation_distance = 1.6,
        projectile_center = util.by_pixel(0, -27),
        range = 64,
        damage_modifier = 1 + (level * 2),
        sound =
        {
          filename = __PATH__.."/sound/apfsds-machine-gun.ogg",
          volume = 0.7,
          modifiers = volume_multiplier("main-menu", 0.9)
        },
      },

      call_for_help_radius = 64
    },

    {
      type = "item",
      name = "dps-turret_apfsds-machine-gun_"..level,
      icons = {
        {
          icon = "__base__/graphics/icons/tank-cannon.png",
          tint = tint,
        },
      },
      subgroup = "dps-item-subgroup_turret",
      order = order,
      inventory_move_sound = item_sounds.artillery_large_inventory_move,
      pick_sound = item_sounds.artillery_large_inventory_pickup,
      drop_sound = item_sounds.artillery_large_inventory_move,
      place_result = "dps-turret_apfsds-machine-gun_"..level,
      default_import_location = "dps-planet_dps",
      stack_size = 5,
      weight = 1000*tons
    },
  }

  if level > 1 then
    _create_recipe(level, _icons, credit_k, probability, order)
  end
end

_generate(1, {1,0.25,0.25}, "ca", 0, 0)
_generate(2, {1,0.66,0},    "cb", 100, 0.01)
_generate(3, {1,1,0},       "cc", 200, 0.01)
_generate(4, {0,1,0},       "cd", 300, 0.01)
_generate(5, {0.25,0.25,1}, "ce", 400, 0.01)

data:extend {
  {
    type = "recipe",
    name = "dps-turret_apfsds-machine-gun_1",
    enabled = false,
    energy_required = 60,
    surface_conditions = __PLANET_CONDITIONS__,
    ingredients =
    {
      {type = "item", name = "dps-item_dps-credit_m", amount = 1},
      {type = "item", name = "concrete", amount = 350},
      {type = "item", name = "steel-plate", amount = 250},
      {type = "item", name = "processing-unit", amount = 100},
      {type = "item", name = "uranium-235", amount = 50},
    },
    results = {{type="item", name="dps-turret_apfsds-machine-gun_1", amount = 1}},

    auto_recycle = false,
    allow_quality = false,
    can_set_quality = false,
  },
}