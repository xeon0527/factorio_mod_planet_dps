DRV_EVENT_register_handler(defines.events.on_pre_surface_deleted, function(event)
  if game.get_surface(event.surface_index).name == "dps-planet_dps" then
    DRV_STORAGE_set("dps-subcore-list", nil)
    DRV_STORAGE_set("dps-dorax-list", nil)

    local appers = DRV_STORAGE_get("dps-dorax-appers", {})
    if appers.tid then
      DRV_TIMER_cancel_timer(appers.tid)
    end
    DRV_STORAGE_set("dps-dorax-appers", nil)

    for _, f in pairs(game.forces) do
      for _, t in pairs(f.technologies) do
        if util.string_starts_with(t.name, "dps-tech_") then
          t.saved_progress = 0
          t.researched = false
        end
      end
    end
  end
end)