local function _get()
  local status = DRV_STORAGE_get("DPS-STATUS", {
    level         = 1,
    exp           = 0,
    max_exp       = 16,
    level_point   = 5,
  })
  return status
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

__MODULE__.add_exp = function(exp)
  local _status = _get()
  _status.exp = _status.exp + exp

  while _status.exp >= _status.max_exp do
    _status.level = _status.level + 1
    _status.level_point = _status.level_point + 5
    _status.exp = _status.exp - _status.max_exp
    _status.max_exp = math.floor((3 * (_status.level ^ 2)) + (9 * _status.level) + 4)
  end
end

return __MODULE__