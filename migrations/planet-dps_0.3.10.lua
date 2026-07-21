local sf = game.get_surface("dps-planet_dps")

DRV_STORAGE_set("dps-subcore", nil)
DRV_STORAGE_set("DORAX_PLACEMENT", nil)

if sf then
  local stor_sb = DRV_STORAGE_get("dps-subcore-list", {})

  for _, e in pairs(sf.find_entities_filtered{ name = "dps-building_dps-subcore" }) do
    local c = sf.find_entity("dps-building_dps-subcore-container" ,  e.position)
    stor_sb[e.unit_number] = {
      entity = e,
      container = c,
      dps_enable = false,
      dps_queue = {},
      dps_queue_idx = 1,
      display_tick = 0,
    }

    for i = 1, 60, 1 do
      stor_sb[e.unit_number].dps_queue[i] = 0
    end
  end

  DRV_STORAGE_set("dps-subcore-list", stor_sb)


  local stor_dr = DRV_STORAGE_get("dps-dorax-list", {})

  for _, e in pairs(sf.find_entities_filtered{ name = "dps-special_dorax" }) do
    local c = sf.find_entity("dps-special_dorax-container" ,  e.position)
    stor_dr[e.unit_number] = {
      entity = e,
      container = c,
      dps_enable = false,
      dps_queue = {},
      dps_queue_idx = 1,
      display_tick = 0,
    }

    for i = 1, 60, 1 do
      stor_dr[e.unit_number].dps_queue[i] = 0
    end
  end

  DRV_STORAGE_set("dps-dorax-list", stor_dr)
end