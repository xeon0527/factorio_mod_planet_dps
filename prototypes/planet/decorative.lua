local tint = { 1.0, 1.0, 0.0 }

local big_sand_rock = table.deepcopy(data.raw["simple-entity"]["big-sand-rock"])

big_sand_rock.localised_name = { "entity-name." .. big_sand_rock.name }
big_sand_rock.name = "dps-deco_big-sand-rock"
big_sand_rock.icon = nil
big_sand_rock.icons = {
  {
    icon = "__base__/graphics/icons/big-sand-rock.png",
    tint = tint,
  }
}
big_sand_rock.minable.results =
{
  { type = "item", name = "stone", amount_min = 19, amount_max = 25 },
  { type = "item", name = "coal", amount_min = 3, amount_max = 10 },
  { type = "item", name = "iron-ore", amount_min = 19, amount_max = 25 },
}

for i = 1, 16 do
  big_sand_rock.pictures[i].tint = tint
end


local huge_rock = table.deepcopy(data.raw["simple-entity"]["huge-rock"])

huge_rock.localised_name = { "entity-name." .. huge_rock.name }
huge_rock.name = "dps-deco_huge-rock"
huge_rock.icon = nil
huge_rock.icons = {
  {
    icon = "__base__/graphics/icons/huge-rock.png",
    tint = tint,
  }
}
huge_rock.minable.results = {
  { type = "item", name = "stone", amount_min = 24, amount_max = 50},
  { type = "item", name = "coal", amount_min = 24, amount_max = 50},
  { type = "item", name = "iron-ore", amount_min = 24, amount_max = 50 },
}

for i = 1, 16 do
  huge_rock.pictures[i].tint = tint
end


local big_rock = table.deepcopy(data.raw["simple-entity"]["big-rock"])

big_rock.localised_name = { "entity-name." .. big_rock.name }
big_rock.name = "dps-deco_big-rock"
big_rock.icon = nil
big_rock.icons = {
  {
    icon = "__base__/graphics/icons/big-rock.png",
    tint = tint,
  }
}
big_rock.minable.result = nil
big_rock.minable.results = {
  { type = "item", name = "stone", amount_min = 15, amount_max = 20},
  { type = "item", name = "coal", amount_min = 3, amount_max = 10},
  { type = "item", name = "iron-ore", amount_min = 15, amount_max = 20 },
}

for i = 1, 20 do
  big_rock.pictures[i].tint = tint
end


data:extend {
  big_sand_rock,
  huge_rock,
  big_rock,
}