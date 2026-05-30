require("global/_hdr")

local ammo_damage_table = {}

for _, v in pairs(data.raw["ammo-category"]) do
  if not v.hidden then
  --if v.name ~= "melee" and v.name ~= "biological" and v.name ~= "seismic" then
    table.insert(ammo_damage_table, {
      type = "ammo-damage",
      ammo_category = v.name,
      modifier = 0.01,
    })
  end
end

data.raw["technology"]["dps-tech_basic-dps-upgrade"].effects = ammo_damage_table