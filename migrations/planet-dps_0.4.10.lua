if storage.GAME then
  storage.GAME["DPS-STATUS"] = nil
end

for _, p in pairs(game.players) do
  if p.gui.top["dps-gui_status-indicator-frame"] then
    p.gui.top["dps-gui_status-indicator-frame"].destroy();
  end
end