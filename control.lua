require("global/_hdr")
__LIB__ = require("lib/_hdr")

require("scripts/drv/_hdr");
--require("scripts/svc/_svc");
require("scripts/app/_hdr");
--
--require("modules/compatibility/any-planet-start").control()
--
if script.active_mods["gvv"] then require("__gvv__/gvv")() end