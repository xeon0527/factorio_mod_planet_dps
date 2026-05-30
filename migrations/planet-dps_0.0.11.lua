local sf = game.get_surface("dps-planet_dps")
if sf then
  for _, v in pairs(sf.find_entities_filtered{ name = "dps-entity-building_promethium-subcore-container" }) do
    local inv = v.get_inventory(defines.inventory.chest)
    if inv == nil then return end

    inv.clear()
    inv.set_bar(61)
    for i = 1, 20 do
      inv.set_filter(i, {name = "dps-item_subcore-scrap"})
      inv.set_filter(i + 20, {name = "heavy-oil-barrel"})
      inv.set_filter(i + 40, {name = "coal"})
    end
  end
end