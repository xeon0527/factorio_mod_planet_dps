require("global/_hdr")


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


local ammo_damage_table = {}

for _, v in pairs(data.raw["ammo-category"]) do
  if not v.hidden then
    table.insert(ammo_damage_table, {
      type = "ammo-damage",
      ammo_category = v.name,
      modifier = 0.05,
    })
  end
end

data.raw["technology"]["dps-tech_basic-dps-engineering"].effects = ammo_damage_table