require("global/_hdr")
lib = require("lib/_hdr")

local function _setup_supersonic_grenade_damage_modifier()
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
end

local function _create_dps_engineering(tech_name, modifier)
  local ammo_damage_table = {}

  for _, v in pairs(data.raw["ammo-category"]) do
    if not v.hidden and v.name ~= "apfsds-shell" then
      if v.name == "artillery-shell" then
          table.insert(ammo_damage_table, {
            type = "ammo-damage",
            ammo_category = v.name,
            modifier = modifier * 0.2,
          })
        else
        table.insert(ammo_damage_table, {
          type = "ammo-damage",
          ammo_category = v.name,
          modifier = modifier,
        })
      end
    end
  end

  data.raw["technology"][tech_name].effects = ammo_damage_table
end

local function _setup_dorax_resistances()
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
end

local function _setup_armory_recipe()
  local ammo_names = {}

  for _, v in pairs(data.raw["ammo"]) do
    if not v.hidden then
      table.insert(ammo_names, v.name)
    end
  end

  for _, v in pairs(data.raw["capsule"]) do
    if not v.hidden then
      table.insert(ammo_names, v.name)
    end
  end

  for _, r in pairs(data.raw["recipe"]) do
    if r.categories == nil or (#r.categories == 1 and (r.categories[1] == "crafting" or r.categories[1] == "crafting-with-fluid" or r.categories[1] == "chemistry")) then
      for _, rst in pairs(r.results) do
        for _, v in pairs(ammo_names) do
          if rst.type == "item" and rst.name == v then
            if r.categories == nil then
              r.categories = { "crafting", "dps-recipe-category_armory" }
            else
              table.insert(r.categories, "dps-recipe-category_armory")
            end
            goto break_jump
          end
        end
      end
    end
    ::break_jump::
  end
end


_setup_supersonic_grenade_damage_modifier()
_create_dps_engineering("dps-tech_basic-dps-engineering", 1.0)
_create_dps_engineering("dps-tech_advanced-dps-engineering", 1.0)

_setup_dorax_resistances()
_setup_armory_recipe()