local sf = game.get_surface("dps-planet_dps")
local lib = require("lib/_hdr")

local str = DRV_STORAGE_get("DORAX_PLACEMENT", {})

if sf then
  local lorax = sf.find_entities_filtered{ name = "dps-special_dorax" }
  if #lorax > 0 then
    local container = sf.find_entities_filtered{ name = "dps-building_dps-subcore-container" }
    if #container == 0 then
      local c = lib.entity.ensure(sf, { name = "dps-special_dorax-container",
                                          position = lorax[1].position, hidden = true})
      if not c then return end

      lorax[1].proxy_target_entity = c
      lorax[1].proxy_target_inventory = defines.inventory.chest
    end

    game.forces["player"].script_trigger_research("dps-tech_discovery-of-dorax")
  elseif str.landed then
    DRV_STORAGE_set("DORAX_PLACEMENT", {})
  end
end