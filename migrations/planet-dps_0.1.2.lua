local sf = game.get_surface("dps-planet_dps")
if sf then
  for _, v in pairs(sf.find_entities_filtered{ name = "dps-building_dps-subcore-container" }) do
    local inv = v.get_inventory(defines.inventory.chest)
    if inv == nil then return end

    inv.clear()
    inv.set_bar(nil)
    for i = 1, 20 do
      inv.set_filter(i,       {name = "dps-item_dps-credit_n"})
      inv.set_filter(i + 20,  {name = "dps-item_dps-credit_k"})
      inv.set_filter(i + 40,  {name = "dps-item_dps-credit_m"})
      inv.set_filter(i + 60,  {name = "dps-item_dps-credit_g"})
      inv.set_filter(i + 80,  {name = "dps-item_dps-credit_t"})
    end
  end
end

local stor = DRV_STORAGE_get("promethium-subcore", {})
if stor then
  DRV_STORAGE_set("dps-subcore", stor)
  DRV_STORAGE_set("promethium-subcore", nil)
end