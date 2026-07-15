local __MODULE__ = {}

__MODULE__.data_final_fixes = function()
  if mods["Krastorio2-spaced-out"] then
    if settings.startup["kr-realistic-weapons"].value then
      data.raw["recipe"]["dps-recipe_concrete-magazine"].results = {
        { type="item", name="kr-rifle-magazine", amount=1 }
      }

      data.raw["recipe"]["dps-recipe_copper-magazine"].results = {
        { type="item", name="kr-rifle-magazine", amount=1 }
      }

      data.raw["recipe"]["dps-item_dps-data-pack"].ingredients = {
        {type = "item", name = "dps-item_dps-credit-k", amount = 5},
        {type = "item", name = "kr-rifle-magazine", amount = 2},
        {type = "item", name = "kr-armor-piercing-rifle-magazine", amount = 1},
      }
    end
  end
end

return __MODULE__