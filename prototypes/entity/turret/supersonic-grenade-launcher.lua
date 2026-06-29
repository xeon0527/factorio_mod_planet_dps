local sounds = require("__base__.prototypes.entity.sounds")
local item_sounds = require("__base__.prototypes.item_sounds")
local hit_effects = require ("__base__.prototypes.entity.hit-effects")

local ftt = data.raw["fluid-turret"]["flamethrower-turret"]

local function _turret_extension(opts)
  local m_line_length = 5
  local m_frame_count = 15
  return {
    layers = {
      -- diffuse
      {
        filename = "__base__/graphics/entity/flamethrower-turret/flamethrower-turret-gun-extension.png",
        priority = "medium",
        frame_count = opts and opts.frame_count or m_frame_count,
        line_length = opts and opts.line_length or m_line_length,
        run_mode = opts and opts.run_mode or "forward",
        width = 152,
        height = 128,
        direction_count = 4,
        shift = util.by_pixel(0, -26),
        scale = 0.5,
        counterclockwise = true,
      },
      -- mask
      {
        filename = "__base__/graphics/entity/flamethrower-turret/flamethrower-turret-gun-extension-mask.png",
        flags = { "mask" },
        frame_count = opts and opts.frame_count or m_frame_count,
        line_length = opts and opts.line_length or m_line_length,
        run_mode = opts and opts.run_mode or "forward",
        width = 144,
        height = 120,
        direction_count = 4,
        shift = util.by_pixel(0, -26),
        apply_runtime_tint = true,
        scale = 0.5,
        counterclockwise = true,
      },
      -- shadow
      {
        filename = "__base__/graphics/entity/flamethrower-turret/flamethrower-turret-gun-extension-shadow.png",
        frame_count = opts and opts.frame_count or m_frame_count,
        line_length = opts and opts.line_length or m_line_length,
        run_mode = opts and opts.run_mode or "forward",
        width = 180,
        height = 114,
        direction_count = 4,
        shift = util.by_pixel(33, -1),
        draw_as_shadow = true,
        scale = 0.5,
        counterclockwise = true,
      }
    }
  }
end

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
  minable = {mining_time = 0.5, result = "dps-turret_supersonic-grenade-launcher"},
  fast_replaceable_group = "ammo-turret",
  max_health = 500,
  corpse = "gun-turret-remnants",
  dying_explosion = "gun-turret-explosion",
  collision_box = {{-0.7, -0.7 }, {0.7, 0.7}},
  selection_box = {{-1, -1 }, {1, 1}},
  energy_source =
  {
    type = "electric",
    buffer_capacity = "1MJ",
    input_flow_limit = "1MW",
    usage_priority = "primary-input"
  },
  energy_per_shot = "500kJ",

  drawing_box_vertical_extension = 0.2,
  damaged_trigger_effect = hit_effects.entity(),
  rotation_speed = 0.015,
  preparing_speed = 0.08,
  preparing_sound = sounds.gun_turret_activate,
  folding_sound = sounds.gun_turret_deactivate,
  folding_speed = 0.08,
  inventory_size = 1,
  automated_ammo_count = 25,
  attacking_speed = 0.25,
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

  -- 접혀 있음
  folded_animation        = _turret_extension{ frame_count = 3, line_length = 1 },
  
  -- 공격 준비
  preparing_animation     = _turret_extension{},

  -- 공격 준비 됨
  prepared_animation      = ftt.prepared_animation,

  -- 공격
  attacking_animation     = ftt.attacking_animation,

  -- 공격 종료
  ending_attack_animation = ftt.ending_attack_animation,

  -- 접히는 중
  folding_animation       = _turret_extension { run_mode = "backward" },

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
    cooldown = 300,
    projectile_creation_distance = 0.0,
    projectile_center = {0, 0}, -- same as gun_turret_attack shift
    range = 30,
    min_range = 8,
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
    default_import_location = "dps-planet_dps",
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