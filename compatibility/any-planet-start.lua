local __MODULE__ = {}

__MODULE__.control = function()
  if script.active_mods["any-planet-start"] and settings.startup["aps-planet"].value == "dps-planet_dps" then
    DRV_BOOTSTRAP_create_init_handler(function()
      local tech = game.forces["player"].technologies

      tech["gun-turret"].researched = true
      tech["steel-processing"].researched = true
      tech["oil-processing"].researched = true
      tech["electric-energy-distribution-1"].researched = true
      tech["recycling"].researched = true
      tech["fluid-handling"].researched = true

      tech["physical-projectile-damage-1"].researched = true
      tech["physical-projectile-damage-2"].researched = true
      tech["physical-projectile-damage-3"].researched = true
      tech["physical-projectile-damage-4"].researched = true
    end)
  end
end

__MODULE__.data = function()
  if mods["any-planet-start"] then
    APS.add_planet {
      name = "dps-planet_dps",
      filename = "__planet-dps__/compatibility/any-planet-start_data-updates.lua",
      technology = "dps-tech_planet-discovery-dps",
    }
  end
end

__MODULE__.settings = function()
  if mods["any-planet-start"] then
    APS.add_choice("dps-planet_dps")
  end
end

return __MODULE__