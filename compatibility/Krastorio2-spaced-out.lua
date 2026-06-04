local __MODULE__ = {}

__MODULE__.data_final_fixes = function()
  local ps = data.raw["proxy-container"]["dps-building_promethium-subcore"]

  if mods["Krastorio2-spaced-out"] then
    table.insert(ps.resistances, {
        type = "physical",
        decrease = 44,
        percent = 83
      }
    )

    data.raw["recipe"]["dps-recipe_concrete-magazine"].results = {{type="item", name="kr-rifle-magazine", amount=1}}
    data.raw["recipe"]["dps-recipe_copper-magazine"].results = {{type="item", name="kr-rifle-magazine", amount=1}}
  else
    table.insert(ps.resistances,
      {
        type = "physical",
        decrease = 0,
        percent = 0
      }
    )
  end
end

return __MODULE__