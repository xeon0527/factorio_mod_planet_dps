local resource_autoplace = require("__core__/lualib/resource-autoplace")

local _tint_color = { 1.0, 1.0, 0.0 }

resource_autoplace.initialize_patch_set("dps-resource_dps-scrap", true)

local _autoplace = {
  type = "autoplace-control",
  name = "dps-autoplace_dps-scrap",
  localised_name = {"", "[entity=dps-resource_dps-scrap] ", {"entity-name.dps-resource_dps-scrap"}},
  richness = true,
  --order = "d-a",
  category = "resource"
}

local _resource = table.deepcopy(data.raw.resource["iron-ore"])
_resource.name = "dps-resource_dps-scrap"
_resource.icon = nil
_resource.icons = {
  {
    icon = "__space-age__/graphics/icons/scrap.png",
    tint = _tint_color,
  }
}
_resource.minable.result = "dps-item_dps-scrap"
_resource.map_color = { 1.0, 1.0, 0}
_resource.stages.sheet.filename = "__space-age__/graphics/entity/scrap/scrap.png"
_resource.stages.sheet.tint = _tint_color
_resource.autoplace = resource_autoplace.resource_autoplace_settings {
  name = "dps-autoplace_dps-scrap",
  --order = "c", -- Other resources are "b"; oil won't get placed if something else is already there.
  base_density = 0.7,
  has_starting_area_placement = true,
  regular_rq_factor_multiplier = 1.5,
  starting_rq_factor_multiplier = 2,
  candidate_spot_count = 22,

}

data:extend { _autoplace, _resource }