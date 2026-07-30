local function _get_status()
  local status = DRV_STORAGE_get("DPS-STATUS", {
    level         = 1,
    exp           = 0,
    current_dps   = 0,
    stat_point    = 0,
  })
  return status
end


local __MODULE__ = {}

__MODULE__.get_level = function()
  return _get_status().level
end

__MODULE__.get_exp = function()
  return _get_status().exp
end

__MODULE__.get_current_dps = function()
  return _get_status().current_dps
end

__MODULE__.set_current_dps = function(current_dps)
  _get_status().current_dps = current_dps
end


return __MODULE__