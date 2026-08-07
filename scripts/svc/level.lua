local __DEFAULT_VALUE__ = {
  level         = 1,
  exp           = 0,
  max_exp       = 16,
  level_point   = 5,
}

local function _get()
  return DRV_STORAGE_get("DPS-LEVEL", table.deepcopy(__DEFAULT_VALUE__))
end


local __MODULE__ = {}

__MODULE__.get_level = function()
  return _get().level
end

__MODULE__.get_exp = function()
  return _get().exp
end

__MODULE__.get_max_exp = function()
  return _get().max_exp
end

__MODULE__.get_level_point = function()
  return _get().level_point
end

__MODULE__.sub_level_point = function(point)
  local _status = _get()
  if point > 0 and _status.level_point >= point then
    _status.level_point = _status.level_point - point
    script.raise_event("dps-custom-event_on-update-level", {})
    return true
  end
  return false
end

__MODULE__.add_exp = function(exp)
  if exp > 0 then
    local _status = _get()
    _status.exp = _status.exp + exp

    while _status.exp >= _status.max_exp do
      _status.level = _status.level + 1
      _status.level_point = _status.level_point + 5
      _status.exp = _status.exp - _status.max_exp
      _status.max_exp = math.floor((3 * (_status.level ^ 2)) + (9 * _status.level) + 4)
    end
    
    script.raise_event("dps-custom-event_on-update-level", {})
    return true
  end
  return false
end

__MODULE__.reset = function()
  DRV_STORAGE_set("DPS-LEVEL", table.deepcopy(__DEFAULT_VALUE__))
end

return __MODULE__