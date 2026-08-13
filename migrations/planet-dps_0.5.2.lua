local sf = game.get_surface("dps-planet_dps")
if sf then
  local container = sf.find_entities_filtered{ name = "dps-special_dorax-container" }
  if #container == 1 then
    local inv = container[1].get_inventory(defines.inventory.chest)
    if not inv then return end
    inv.clear()
    inv.set_bar(41)
    for i = 1, 20 do
      inv.set_filter(i, {name = "dps-item_dorax-fragment"})
      inv.set_filter(i + 20,  {name = "dps-item_dorax-component"})
    end
  end
end