DRV_EVENT_register_built_entity_handler(function(event)
  if not event.is_ghost and event.entity_name == "cargo-landing-pad" and
      event.entity.surface.name == "dps-planet_dps" then

    local dorax_placement = DRV_STORAGE_get("DORAX_PLACEMENT", {})
    if dorax_placement.position == nil then
      DRV_STORAGE_set("DORAX_PLACEMENT", {
        position  = event.entity.position,
        landed    = false,
      })

      DRV_TIMER_create_single_timer(1800, function()
        game.print{"", {"system-message.dorax-appers-prefix"}, {"system-message.dorax-appers-1-1"}}
        game.print{"", {"system-message.dorax-appers-prefix"}, {"system-message.dorax-appers-1-2"}}
        game.print{"", {"system-message.dorax-appers-prefix"}, {"system-message.dorax-appers-1-3"}}
        game.play_sound{ path = "dps-sound_siren" }

        DRV_TIMER_create_tick_timer(3600, function(tick)
          local dorax_placement = DRV_STORAGE_get("DORAX_PLACEMENT", {})
          if tick == 3300 then
            game.print{"", {"system-message.dorax-appers-prefix"}, {"system-message.dorax-appers-t3300-1"}}
            game.print{"", {"system-message.dorax-appers-prefix"}, {"system-message.dorax-appers-t3300-2"}, " : [gps="..dorax_placement.position.x..","..dorax_placement.position.y..",".."dps-planet_dps".."]"}
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
            dorax_placement.landed = true
            local sf = game.get_surface("dps-planet_dps")
            if sf == nil then
              DRV_STORAGE_set("DORAX_PLACEMENT", {})
              return
            end

            sf.create_entity {
              name = "atomic-rocket",
              position = dorax_placement.position,
              target = dorax_placement.position,
            }

            dorax_placement.entity = sf.create_entity {
              name = "dps-entity-special_dorax",
              position = dorax_placement.position,
              raise_built = true,
            }
            dorax_placement.landed = true
            DRV_STORAGE_set("DORAX_PLACEMENT", dorax_placement)
          end
        end)
      end)
    end
  end
end)