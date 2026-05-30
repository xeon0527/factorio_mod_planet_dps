local map_gen = {
  aux_climate_control = false,
  moisture_climate_control = false,

  property_expression_names =
  {
    moisture = "moisture_basic",
    aux = "aux_basic",
    cliffiness = "cliffiness_basic",
    cliff_elevation = "cliff_elevation_from_elevation",
  },
  cliff_settings =
  {
    name = "cliff",
    cliff_smoothing = 1,
    cliff_elevation_interval = 10,
    cliff_elevation_0 = 0,
    richness = 6,
  },
  autoplace_controls ={},
  autoplace_settings =
  {
    ["tile"] =
    {
      settings =
      {
        ["dry-dirt"] = {},
        ["dirt-1"] = {},
        ["dirt-2"] = {},
        ["dirt-3"] = {},
        ["dirt-4"] = {},
        ["dirt-5"] = {},
        ["dirt-6"] = {},
        ["dirt-7"] = {},
        ["sand-1"] = {},
        ["sand-2"] = {},
        ["sand-3"] = {},
        ["red-desert-0"] = {},
        ["red-desert-1"] = {},
        ["red-desert-2"] = {},
        ["red-desert-3"] = {},
        ["water"] = {},
        ["deepwater"] = {},
      }
    },
    ["entity"] =
    {
      settings =
      {
        --["crude-oil"] = {},
        --["uranium-ore"] = {},

        ["dps-deco_big-sand-rock"] = {},
        ["dps-deco_huge-rock"] = {},
        ["dps-deco_big-rock"] = {},
        ["dps-building_promethium-subcore"] = {}
      }
    }
  }
}


if not mods["alien-biomes"] then
  map_gen.autoplace_settings["decorative"] = {
    settings =
    {
      ["brown-hairy-grass"] = {},
      ["brown-carpet-grass"] = {},
      ["brown-asterisk-mini"] = {},
      ["green-asterisk-mini"] = {},
      ["brown-asterisk"] = {},
      ["red-asterisk"] = {},
      ["dark-mud-decal"] = {},
      ["light-mud-decal"] = {},
      ["cracked-mud-decal"] = {},
      ["red-desert-decal"] = {},
      ["sand-decal"] = {},
      ["sand-dune-decal"] = {},
      ["red-pita"] = {},
      ["red-croton"] = {},
      ["brown-fluff"] = {},
      ["brown-fluff-dry"] = {},
      ["red-desert-bush"] = {},
      ["white-desert-bush"] = {},
      ["garballo-mini-dry"] = {},
      ["garballo"] = {},
      ["medium-rock"] = {},
      ["small-rock"] = {},
      ["tiny-rock"] = {},
      ["medium-sand-rock"] = {},
      ["small-sand-rock"] = {},
    }
  }
end

return map_gen