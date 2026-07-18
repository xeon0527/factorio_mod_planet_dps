require("global/_hdr")

local function _create_dps_engineering(tech_name, modifier)
  local ammo_damage_table = {}

  for _, v in pairs(data.raw["ammo-category"]) do
    if not v.hidden and v.name ~= "apfsds-shell" then
      table.insert(ammo_damage_table, {
        type = "ammo-damage",
        ammo_category = v.name,
        modifier = modifier,
      })
    end
  end

  data.raw["technology"][tech_name].effects = ammo_damage_table
end

_create_dps_engineering("dps-tech_basic-dps-engineering", 0.2)



for _, v in pairs(data.raw["technology"]) do
  if v.effects then
    for _, vv in pairs(v.effects) do
      if vv.type == "ammo-damage" and (vv.ammo_category == "bullet" or vv.ammo_category == "rocket") then
        table.insert(v.effects, {
          type = "ammo-damage",
          ammo_category = "supersonic-grenade",
          modifier = vv.modifier,
        })
      end
    end
  end
end



local dorax_resistances_old = data.raw["proxy-container"]["dps-special_dorax"].resistances or {}
local dorax_resistances = {}

for _, v in pairs(data.raw["damage-type"]) do
  for _, v2 in pairs(dorax_resistances_old) do
    if v.name == v2.name then
      goto continue
    end
  end

  table.insert(dorax_resistances, {
    type = v.name,
    decrease = 0,
    percent = 100,
  })

  ::continue::
end

for _, v in pairs(dorax_resistances_old) do
  table.insert(dorax_resistances, v)
end

data.raw["proxy-container"]["dps-special_dorax"].resistances = dorax_resistances