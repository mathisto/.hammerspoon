hs.application.enableSpotlightForNameSearches(true)
hs.window.animationDuration = 0

hs.loadSpoon("SpoonInstall")
Install=spoon.SpoonInstall
hs.loadSpoon("WinWin")
hs.loadSpoon("ReloadConfiguration")
spoon.ReloadConfiguration:start()
-- hs.notify.new({title="Hammerspoon", informativeText="Config loaded"}):send()

Helpers = require('helpers')
Layouts = require('layouts')
Keymap = require('keymap')
-- SpaceCadet = require('space_cadet')
