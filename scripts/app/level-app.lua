local level = require(__SVC__.."level")

DRV_EVENT_register_handler("dps-custom-event_on-update-dps", function(e)
  level.add_exp(e.dps)
end)


DRV_EVENT_register_handler("dps-custom-event_on-cleaner", function(e)
  level.reset()
end)