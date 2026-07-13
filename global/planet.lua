__PLANET__ = {
  magnetic_field = 99,
  solar_power = 60,
  solar_power_in_space = 180,
  pressure = 700,
  gravity = 14,
}

__PLANET_CONDITIONS__ =
{
  {
    property = "magnetic-field",
    min = __PLANET__.magnetic_field,
    max = __PLANET__.magnetic_field,
  },
  {
    property = "gravity",
    min = __PLANET__.gravity,
    max = __PLANET__.gravity
  },
  {
    property = "pressure",
    min = __PLANET__.pressure,
    max = __PLANET__.pressure
  }
}