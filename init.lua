hs.application.enableSpotlightForNameSearches(true)
hs.window.animationDuration = 0

hs.loadSpoon("WinWin")
hs.loadSpoon("ReloadConfiguration")
spoon.ReloadConfiguration:start()
hs.notify.new({title="Hammerspoon", informativeText="Config loaded"}):send()

local Helpers = require('helpers')
local Layouts = require('layouts')
local LeaderKey = require('space_cadet')
local Keymap = require('keymap')
