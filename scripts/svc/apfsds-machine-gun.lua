local function _research_update(e)
  if e.research.name == "dps-tech_apfsds-machine-gun-enhancement-chance" or
      e.research.name == "dps-tech_apfsds-machine-gun-destruction-protection" then
        
    local force = game.forces["player"]
    local tech = force.technologies
    local recipes = force.recipes

    local lv_ec = tech["dps-tech_apfsds-machine-gun-enhancement-chance"].level - 1
    if tech["dps-tech_apfsds-machine-gun-enhancement-chance"].researched then
      lv_ec = lv_ec + 1
    end

    local lv_dp = tech["dps-tech_apfsds-machine-gun-destruction-protection"].level - 1
    if tech["dps-tech_apfsds-machine-gun-destruction-protection"].researched then
      lv_dp = lv_dp + 1
    end

    local addition_probability = lv_ec * 0.01
    local protection_probability = lv_dp * 0.05

    for i = 1, 5, 1 do
      local ptyp = recipes["dps-turret_apfsds-machine-gun_"..i].prototype
      local probability = ptyp.main_product.shared_probability.max + addition_probability
      local total_probability = probability / (1 - (1 - probability) * protection_probability)

      local probability_0001 = 1.0 / (ptyp.main_product.shared_probability.max * 100000)

      recipes["dps-turret_apfsds-machine-gun_"..i].productivity_bonus = probability_0001 * (total_probability - ptyp.main_product.shared_probability.max) * 100000
    end
  end
end

DRV_EVENT_register_handler(defines.events.on_research_finished, _research_update)
DRV_EVENT_register_handler(defines.events.on_research_reversed, _research_update)

return {
  force_update = function()
    _research_update { research = { name = "dps-tech_apfsds-machine-gun-enhancement-chance" } }
    --_research_update { research = { name = "dps-tech_apfsds-machine-gun-destruction-protection" } }
  end
}