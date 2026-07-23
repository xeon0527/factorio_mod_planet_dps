local function _research_update(e)
  local force = game.forces["player"]
  local tech = force.technologies

  if e.research.name == "dps-tech_apfsds-machine-gun-enhancement-chance" then
    local recipes = force.recipes
    local level = e.research.level - 1
    if e.research.researched then
      level = level + 1
    end

    for i = 2, 5, 1 do
      for j = 0, 85, 5 do
        local ptyp = recipes["dps-turret_apfsds-machine-gun_"..i.."_"..j].prototype
        local probability_1 = 1.0 / (ptyp.main_product.shared_probability.max / 0.01)
        recipes["dps-turret_apfsds-machine-gun_"..i.."_"..j].productivity_bonus = probability_1 * level
      end
    end

  elseif e.research.name == "dps-tech_apfsds-machine-gun-destruction-protection" then
    local recipes = force.recipes
    local level = e.research.level - 1
    if e.research.researched then
      level = level + 1
    end

    for i = 2, 5, 1 do
      for j = 0, 85, 5 do
        recipes["dps-turret_apfsds-machine-gun_"..i.."_"..j].enabled = false
        recipes["dps-turret_apfsds-machine-gun_"..i.."_"..j].hidden_from_flow_stats = true
      end
    end

    if tech["dps-tech_advanced-apfsds-shell"].researched then
      for i = 2, 5, 1 do
        recipes["dps-turret_apfsds-machine-gun_"..i.."_"..(level*5)].enabled = true
        recipes["dps-turret_apfsds-machine-gun_"..i.."_"..(level*5)].hidden_from_flow_stats = false
      end
    end

    local surface = game.get_surface("dps-planet_dps")
    if surface then
      for _, entity in pairs(surface.find_entities_filtered{name = "dps-building_dps-equipment-enhancer"}) do
        local recipe = entity.get_recipe()
        if recipe and util.string_starts_with(recipe.name, "dps-turret_apfsds-machine-gun_") then
          local str = __LIB__.string.split(recipe.name, "_")
          if #str >= 4 then
            str[4] = level * 5
            entity.set_recipe(recipes[str[1].."_"..str[2].."_"..str[3].."_"..str[4]])
          end
        end
      end
    end
  end
end

DRV_EVENT_register_handler(defines.events.on_research_finished, _research_update)
DRV_EVENT_register_handler(defines.events.on_research_reversed, _research_update)