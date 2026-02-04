require("global/_hdr")
require("scripts/util/_hdr");

require("scripts/drv/_hdr");

--
--require("scripts/util");
--require("scripts/drv/_drv");
--require("scripts/svc/_svc");
--require("scripts/app/_app");
--
--require("modules/compatibility/any-planet-start").control()
--
if script.active_mods["gvv"] then require("__gvv__/gvv")() end