data:extend {
  {
    type = "explosion",
    name = "dps-explosion_apfsds-shell",
    icons =
    {
      {icon = "__base__/graphics/icons/explosion.png"},
      {icon = "__base__/graphics/icons/cannon-shell.png"}
    },
    order = "a-c-a",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "explosions",
    animations = {
      {
        filename = "__base__/graphics/entity/explosion/explosion-1.png",
        draw_as_glow = true,
        priority = "high",
        line_length = 6,
        width = 48,
        height = 42,
        frame_count = 17,
        animation_speed = 1.0,
        shift = util.by_pixel(4.5,6),
        scale = 4.0,
        usage = "explosion",
      },
      {
        filename = "__base__/graphics/entity/explosion/explosion-3.png",
        draw_as_glow = true,
        priority = "high",
        line_length = 6,
        width = 102,
        height = 88,
        frame_count = 17,
        animation_speed = 1.0,
        shift = util.by_pixel(-1,1.5),
        scale = 4.0,
        usage = "explosion",
      }
    },
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = {
      filename = __PATH__.."/sound/apfsds-shell_explosion.ogg",
      aggregation = {max_count = 8, remove = true, count_already_playing = true, priority = "newest"}
    }
  },
}