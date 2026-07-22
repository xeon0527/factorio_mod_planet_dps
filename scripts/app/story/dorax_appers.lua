local _STOR_NAME = "dps-dorax-appers"

DRV_EVENT_register_built_entity_handler(function(event)
  if not event.is_ghost and event.entity_name == "cargo-landing-pad" and
      event.entity.surface.name == "dps-planet_dps" then

    local appers = DRV_STORAGE_get(_STOR_NAME, {})
    if not appers.position then
      local tid = DRV_TIMER_create_single_timer(1800, "story_dorax_start")

      DRV_STORAGE_set(_STOR_NAME, {
        position      = event.entity.position,
        surface_index = event.entity.surface.index,
        landed        = false,
        tid           = tid,
      })
    end
  end
end)


DRV_TIMER_register_action("story_dorax_start", function()
  game.print{"", {"system-message.dorax-appers-prefix"}, {"system-message.dorax-appers-1-1"}}
  game.print{"", {"system-message.dorax-appers-prefix"}, {"system-message.dorax-appers-1-2"}}
  game.print{"", {"system-message.dorax-appers-prefix"}, {"system-message.dorax-appers-1-3"}}
  game.play_sound{ path = "dps-sound_siren" }

  DRV_STORAGE_get(_STOR_NAME, {}).tid = DRV_TIMER_create_tick_timer(3600, "story_dorax_approach")

end)

DRV_TIMER_register_action("story_dorax_approach", function(tick)
  local appers = DRV_STORAGE_get(_STOR_NAME, {})

  if tick == 3300 then
    game.print{"", {"system-message.dorax-appers-prefix"}, {"system-message.dorax-appers-t3300-1"}}
    game.print{"", {"system-message.dorax-appers-prefix"}, {"system-message.dorax-appers-t3300-2"}, " : [gps="..appers.position.x..","..appers.position.y..",".."dps-planet_dps".."]"}
    game.print{"", {"system-message.dorax-appers-prefix"}, {"system-message.dorax-appers-t3300-3"}}
  elseif tick == 1800 then  game.print{"", {"system-message.dorax-appers-prefix"}, {"system-message.dorax-appers-t1800-1"}}
  elseif tick == 1200 then  game.print{"", {"system-message.dorax-appers-prefix"}, {"system-message.dorax-appers-t1200-1"}}
  elseif tick == 600 then   game.print{"", {"system-message.dorax-appers-prefix"}, {"system-message.dorax-appers-t600-1"}}
  elseif tick == 300 then   game.print{"", {"system-message.dorax-appers-prefix"}, {"system-message.dorax-appers-t300-1"}}
  elseif tick == 240 then   game.print{"", {"system-message.dorax-appers-prefix"}, {"system-message.dorax-appers-t240-1"}}
  elseif tick == 180 then   game.print{"", {"system-message.dorax-appers-prefix"}, {"system-message.dorax-appers-t180-1"}}
  elseif tick == 120 then   game.print{"", {"system-message.dorax-appers-prefix"}, {"system-message.dorax-appers-t120-1"}}
  elseif tick == 60 then    game.print{"", {"system-message.dorax-appers-prefix"}, {"system-message.dorax-appers-t60-1"}}
  elseif tick == 0 then
    appers.landed = true
    local sf = game.get_surface("dps-planet_dps")
    if sf == nil then
      DRV_STORAGE_set(_STOR_NAME, {})
      return
    end


    local entities = sf.find_entities_filtered { area = {
      { appers.position.x - 4, appers.position.y - 4 },
      { appers.position.x + 4, appers.position.y + 4 }
    }}

    for _, v in pairs(entities) do
      if v.valid then
        if v.type == "character" then
          v.damage(1000000000, "enemy")
        else
          v.destroy { raise_destroy = true }
        end
      end
    end

    sf.create_entity {
      name = "atomic-rocket",
      position = appers.position,
      target = appers.position,
    }

    appers.entity = sf.create_entity {
      name = "dps-special_dorax",
      position = appers.position,
      raise_built = true,
    }
    appers.landed = true

    appers.tid = DRV_TIMER_create_tick_timer(1600, "story_dorax_end")
  end
end)

DRV_TIMER_register_action("story_dorax_end", function(t)
  if t == 1200 then
    local appers = DRV_STORAGE_get(_STOR_NAME, {})
    game.print("[gps="..appers.position.x..","..appers.position.y..",".."dps-planet_dps".."]")
    game.print{"system-message.dorax-appers-2-1"}
  elseif t == 800 then
    game.print{"system-message.dorax-appers-2-2"}
  elseif t == 400 then
    game.print{"system-message.dorax-appers-2-3"}
  elseif t == 0 then
    game.print{"system-message.dorax-appers-2-4"}
  end
end)