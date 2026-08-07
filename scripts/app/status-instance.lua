local __MODULE__ = {}
local _STOR_NAME = "dps-status-instance"

local _DEFAULT_INSTANCE = {
  name = "",
  level = 0,
  cost = 0,
}

__MODULE__.update = function(name)
  if __SVC_STATUS_PROTOTYPE__[name] then
    local pt = __SVC_STATUS_PROTOTYPE__[name]

    local stor = DRV_STORAGE_get(_STOR_NAME, {})
    if stor[name] == nil then
      stor[name] = table.deepcopy(_DEFAULT_INSTANCE)
    end
    stor[name].name = name
    stor[name].cost = pt.next_cost_func(stor[name].level)
  end
end


__MODULE__.update_all = function()
  for _, v in pairs(__SVC_STATUS_PROTOTYPE__) do
    __MODULE__.update(v.name)
  end
end

__MODULE__.get = function(name)
  local stor = DRV_STORAGE_get(_STOR_NAME, {})
  return stor[name]
end

__MODULE__.get_all = function()
  return DRV_STORAGE_get(_STOR_NAME, {})
end

__MODULE__.set_level = function(name, level)
  local item = __MODULE__.get(name)
  if item then
    local pt = __SVC_STATUS_PROTOTYPE__[name]
    if pt.max_level >= level then
      item.level = level
      __MODULE__.update(name)
      return true
    end
  end
  return false
end

__MODULE__.add_level = function(name)
  local item = __MODULE__.get(name)
  if item then
    return __MODULE__.set_level(name, item.level + 1)
  end
  return false
end

return __MODULE__