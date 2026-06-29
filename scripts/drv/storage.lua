local util = require("util")

__DRV_STORAGE_GAME_START__ = false
__DRV_STORAGE_LIST__ = {}

local function __generate()
  if __DRV_STORAGE_LIST__ then 
    for _, v in pairs(__DRV_STORAGE_LIST__) do
      if v.value == nil then
        UTIL_ensure_object(storage, v.path)
      else
        local objs = util.split(v.path, ".")
        local val_name = objs[#objs]
        local path = string.sub(v.path, 1, -(string.len(val_name) + 2))

        local target = UTIL_ensure_object(storage, path)
        if not target[val_name] then
          target[val_name] = v.value
        end
      end
    end
  end 
  __DRV_STORAGE_LIST__ = {}
  __DRV_STORAGE_GAME_START__ = true
end

DRV_BOOTSTRAP_create_init_handler(__generate)
DRV_BOOTSTRAP_create_configuration_changed_handler(__generate)
DRV_BOOTSTRAP_create_load_handler(function()
  __DRV_STORAGE_GAME_START__ = true
end)

local function __create(path, default_value)
  table.insert(__DRV_STORAGE_LIST__, { path = path, value = default_value })
  if __DRV_STORAGE_GAME_START__ then
    __generate()
  end
end



__create("PLAYER", {})
__create("FORCE", {})
__create("GAME", {})

function DRV_STORAGE_set(key, value)
  local success = pcall(function()
    storage.GAME[key] = value
  end)

  if not success then
    __create("GAME."..key, {})
    storage.GAME[key]= value
  end
  return storage.GAME[key]
end

function DRV_STORAGE_get(key, default_value)
  local success, result = pcall(function()
    return storage.GAME[key]
  end)

  if not success or result == nil then
    result = DRV_STORAGE_set(key, default_value)
  end
  return result
end


function DRV_STORAGE_set_player(player, key, value)
  local success = pcall(function()
    storage.PLAYER[key][player.index] = value
  end)

  if not success then
    __create("PLAYER."..key, {})
    storage.PLAYER[key][player.index] = value
  end
  return storage.PLAYER[key][player.index]
end

function DRV_STORAGE_get_player(player, key, default_value)
  local success, result = pcall(function()
    return storage.PLAYER[key][player.index]
  end)

  if not success or result == nil then
    result = DRV_STORAGE_set_player(player, key, default_value)
  end
  return result
end


function DRV_STORAGE_set_force(force, key, value)
  local success = pcall(function()
    storage.FORCE[key][force.index] = value
  end)

  if not success then
    __create("FORCE."..key, {})
    storage.FORCE[key][force.index] = value
  end
  return storage.FORCE[key][force.index]
end

function DRV_STORAGE_get_force(force, key, default_value)
  local success, result = pcall(function()
    return storage.FORCE[key][force.index]
  end)

  if not success or result == nil then
    result = DRV_STORAGE_set_force(force, key, default_value)
  end
  return result
end