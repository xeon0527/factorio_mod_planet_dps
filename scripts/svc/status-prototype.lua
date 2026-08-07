__SVC_STATUS_PROTOTYPE__ = {}

local function _add_prototype(ptyp)
  __SVC_STATUS_PROTOTYPE__[ptyp.name] = ptyp
end



local function _condition_func_tech(item_prototype)
  local player_techs = game.forces["player"].technologies
  local ptyp = prototypes.technology["dps-tech_"..item_prototype.name]
  for _, v in pairs(ptyp.prerequisites) do
    if not player_techs[v.name].researched then
      return false
    end
  end
  return true
end

local function _add_prototype_from_tech(ptyp)
  local tech_name = "dps-tech_"..ptyp.name
  ptyp.max_level = prototypes.technology[tech_name].max_level
  ptyp.status_name = {"technology-name."..tech_name }
  ptyp.status_description = {"technology-description."..tech_name }
  ptyp.condition_func = _condition_func_tech
  _add_prototype(ptyp)
end

local function _next_cost_level_proportional(level)
  return level + 1
end

_add_prototype_from_tech {
  tier = 1,
  name = "apfsds-shell-enhancement-chance",
  next_cost_func = _next_cost_level_proportional,
  effect_per_level_func = function(level) return level end,
  effect_unit = "%p",
}

_add_prototype_from_tech{
  tier = 1,
  name = "apfsds-shell-damage",
  next_cost_func = _next_cost_level_proportional,
  effect_per_level_func = function(level) return level * 20 end,
  effect_unit = "%p",
}

_add_prototype_from_tech{
  tier = 1,
  name = "apfsds-shell-gun-speed",
  next_cost_func = _next_cost_level_proportional,
  effect_per_level_func = function(level) return level * 10 end,
  effect_unit = "%p",
}

_add_prototype_from_tech{
  tier = 1,
  name = "apfsds-shell-productivity",
  next_cost_func = _next_cost_level_proportional,
  effect_per_level_func = function(level) return level * 10 end,
  effect_unit = "%p",
}



_add_prototype_from_tech{
  tier = 2,
  name = "advanced-apfsds-shell-enhancement-chance",
  next_cost_func = _next_cost_level_proportional,
  effect_per_level_func = function(level) return level end,
  effect_unit = "%p",
}

_add_prototype_from_tech{
  tier = 2,
  name = "advanced-apfsds-shell-destruction-protection",
  next_cost_func = _next_cost_level_proportional,
  effect_per_level_func = function(level) return level * 5 end,
  effect_unit = "%p",
}

_add_prototype_from_tech {
  tier = 2,
  name = "advanced-apfsds-shell-damage",
  next_cost_func = _next_cost_level_proportional,
  effect_per_level_func = function(level) return level * 20 end,
  effect_unit = "%p",
}

_add_prototype_from_tech{
  tier = 2,
  name = "apfsds-machine-gun-enhancement-chance",
  next_cost_func = _next_cost_level_proportional,
  effect_per_level_func = function(level) return level end,
  effect_unit = "%p",
}

_add_prototype_from_tech{
  tier = 2,
  name = "apfsds-machine-gun-destruction-protection",
  next_cost_func = _next_cost_level_proportional,
  effect_per_level_func = function(level) return level * 5 end,
  effect_unit = "%p",
}