local list = {
  "dps-tech_apfsds-shell-enhancement-chance",
  "dps-tech_apfsds-shell-productivity",
  "dps-tech_apfsds-shell-gun-speed",
  "dps-tech_apfsds-shell-damage",
  "dps-tech_advanced-apfsds-shell-damage",
  "dps-tech_advanced-apfsds-shell-enhancement-chance",
  "dps-tech_advanced-apfsds-shell-destruction-protection",
  "dps-tech_apfsds-machine-gun-enhancement-chance",
  "dps-tech_apfsds-machine-gun-destruction-protection",
}

local techs = game.forces["player"].technologies

for _, n in pairs(list) do
  local t = techs[n]
  t.level = 1
  t.researched = false
end