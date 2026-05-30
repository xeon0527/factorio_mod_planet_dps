require("global/_hdr")

local ammo_damage_table = {}

for _, v in pairs(data.raw["ammo-category"]) do
  if not v.hidden then
    table.insert(ammo_damage_table, {
      type = "ammo-damage",
      ammo_category = v.name,
      modifier = 0.01,
    })
  end
end

data.raw["technology"]["dps-tech_basic-dps-engineering"].effects = ammo_damage_table