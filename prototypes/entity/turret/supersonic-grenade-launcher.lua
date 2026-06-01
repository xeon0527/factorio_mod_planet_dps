local sounds = require("__base__.prototypes.entity.sounds")
local item_sounds = require("__base__.prototypes.item_sounds")
local hit_effects = require ("__base__.prototypes.entity.hit-effects")

local ftt = data.raw["fluid-turret"]["flamethrower-turret"]

local turret = {
  type = "ammo-turret",
  name = "dps-turret_supersonic-grenade-launcher",
  icons = {
    {
      icon = "__base__/graphics/icons/gun-turret.png",
      icon_size = 64,
    },
    {
      icon = "__base__/graphics/icons/rocket-launcher.png",
      icon_size = 64,
      floating = true,
    }
  },
  flags = {"placeable-player", "player-creation"},
  minable = {mining_time = 0.5, result = "gun-turret"},
  fast_replaceable_group = "ammo-turret",
  max_health = 500,
  corpse = "gun-turret-remnants",
  dying_explosion = "gun-turret-explosion",
  collision_box = {{-0.7, -0.7 }, {0.7, 0.7}},
  selection_box = {{-1, -1 }, {1, 1}},
  energy_source =
  {
    type = "electric",
    buffer_capacity = "1.5MJ",
    input_flow_limit = "1.5MW",
    usage_priority = "primary-input"
  },
  energy_per_shot = "1MJ",

  drawing_box_vertical_extension = 0.2,
  damaged_trigger_effect = hit_effects.entity(),
  rotation_speed = 0.015,
  preparing_speed = 0.08,
  preparing_sound = sounds.gun_turret_activate,
  folding_sound = sounds.gun_turret_deactivate,
  folding_speed = 0.08,
  inventory_size = 1,
  automated_ammo_count = 10,
  attacking_speed = 0.5,
  alert_when_attacking = true,
  circuit_connector = circuit_connector_definitions["gun-turret"],
  circuit_wire_max_distance = default_circuit_wire_max_distance,
  open_sound = sounds.turret_open,
  close_sound = sounds.turret_close,
  icon_draw_specification = {scale = 0.7},
  icons_positioning =
  {
    {inventory_index = defines.inventory.turret_ammo, shift = {0, -0.25}}
  },
  folded_animation        = ftt.folded_animation,
  preparing_animation     = ftt.preparing_animation,
  prepared_animation      = ftt.prepared_animation,
  attacking_animation     = ftt.attacking_animation,
  ending_attack_animation = ftt.ending_attack_animation,
  folding_animation       = ftt.folding_animation,

  gun_animation_render_layer = "object",
  gun_animation_secondary_draw_order = 1,
  graphics_set =
  {
    base_visualisation =
    {
      animation =
      {
        layers =
        {
          {
            filename = "__base__/graphics/entity/gun-turret/gun-turret-base.png",
            priority = "high",
            width = 150,
            height = 118,
            shift = util.by_pixel(0.5, -1),
            scale = 0.5
          },
          {
            filename = "__base__/graphics/entity/gun-turret/gun-turret-base-mask.png",
            flags = {"mask", "low-object"},
            line_length = 1,
            width = 122,
            height = 102,
            shift = util.by_pixel(0, -4.5),
            apply_runtime_tint = true,
            scale = 0.5
          }
        }
      }
    }
  },
  attack_parameters =
  {
    type = "projectile",
    ammo_category = "supersonic-grenade",
    --health_penalty = 1,
    cooldown = 120,
    projectile_creation_distance = 0.0,
    projectile_center = {0, 0}, -- same as gun_turret_attack shift
    range = 30,
    min_range = 10,
    sound = {
      filename = __G_MOD__.."/sound/supersonic-grenade-launcher/attack.ogg",
      aggregation = {max_count = 8, remove = true, count_already_playing = true, priority = "newest"}
    }
  },
  call_for_help_radius = 40,
}

data:extend { turret,
  {
    type = "item",
    name = "dps-turret_supersonic-grenade-launcher",
    icons = {
      {
        icon = "__base__/graphics/icons/gun-turret.png",
        icon_size = 64,
      },
      {
        icon = "__base__/graphics/icons/rocket-launcher.png",
        icon_size = 64,
        floating = true,
      }
    },
    subgroup = "dps-item-subgroup_turret",
    --order = "b[turret]-c[flamethrower-turret]",
    inventory_move_sound = item_sounds.turret_inventory_move,
    pick_sound = item_sounds.flamethrower_inventory_move,
    drop_sound = item_sounds.turret_inventory_move,
    place_result = "dps-turret_supersonic-grenade-launcher",
    stack_size = 20,
    weight = 50*kg
  },
  {
    type = "recipe",
    name = "dps-turret_supersonic-grenade-launcher",
    enabled = false,
    energy_required = 15,
    ingredients =
    {
      {type = "item", name = "steel-plate", amount = 25},
      {type = "item", name = "processing-unit", amount = 15},
      {type = "item", name = "low-density-structure", amount = 5},
      {type = "item", name = "dps-item_promethium-subcore-fragment", amount = 5}
    },
    results = {{type="item", name="dps-turret_supersonic-grenade-launcher", amount=1}}
  },
}