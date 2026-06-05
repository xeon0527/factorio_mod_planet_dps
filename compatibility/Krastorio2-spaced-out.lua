local __MODULE__ = {}

__MODULE__.data_final_fixes = function()
  local ps = data.raw["proxy-container"]["dps-building_promethium-subcore"]

  if mods["Krastorio2-spaced-out"] then
    if settings.startup["kr-realistic-weapons"].value then
      table.insert(ps.resistances, {
          type = "physical",
          decrease = 44,
          percent = 83
        }
      )

      data.raw["recipe"]["dps-recipe_concrete-magazine"].results = {
        { type="item", name="kr-rifle-magazine", amount=1 }
      }

      data.raw["recipe"]["dps-recipe_copper-magazine"].results = {
        { type="item", name="kr-rifle-magazine", amount=1 }
      }

      data.raw["recipe"]["dps-item_dps-science-pack"].ingredients = {
        {type = "item", name = "dps-item_promethium-subcore-fragment", amount = 1},
        {type = "item", name = "accumulator", amount = 1},
        {type = "item", name = "kr-armor-piercing-rifle-magazine", amount = 1},
      }
    else
      table.insert(ps.resistances, {
          type = "physical",
          decrease = 20,
          percent = 62.5
        }
      )
    end
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