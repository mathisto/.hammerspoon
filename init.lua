HammerLog = hs.logger.new("HammerLog", "debug")

hs.application.enableSpotlightForNameSearches(true)
hs.window.animationDuration = 0

hs.loadSpoon("SpoonInstall")
Install=spoon.SpoonInstall
hs.loadSpoon("WinWin")
hs.loadSpoon("ReloadConfiguration")
hs.loadSpoon("MicMute")


spoon.ReloadConfiguration:start()
-- hs.notify.new({title="Hammerspoon", informativeText="Config loaded"}):send()

Helpers = require("helpers")
Layouts = require("layouts")
Secrets = require("secrets")

-- Initialize Hyper key modality
Hyper = hs.hotkey.modal.new({}, nil)
Hyper.pressed = function() Hyper:enter() end
Hyper.released = function() Hyper:exit() end
hs.hotkey.bind({}, 'F19', Hyper.pressed, Hyper.released)

-- Load keymaps specific for a certain machine (based on hostname)
local hostname = hs.host.names()[1]
if(hostname == "matthews-macbook-pro.local") then
  Keymap = require("mattbook-keymap")
else
  Keymap = require("weedbook-keymap")
end

for key, app in pairs(HyperBindings) do
  Hyper:bind({}, key, nil, function() HyperFunction(Launch(app)) end)
end

for key, func in pairs(CmdHyperBindings) do
  Hyper:bind({'cmd'}, key, nil, function() HyperFunction(func()) end)
end
