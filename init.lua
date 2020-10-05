hs.application.enableSpotlightForNameSearches(true)
hs.window.animationDuration = 0

hs.loadSpoon("WinWin")
hs.loadSpoon("ReloadConfiguration")
spoon.ReloadConfiguration:start()

local Aliases = require('aliases')
local Helpers = require('helpers')
local Layouts = require('layouts')
local LeaderKey = require('leader_key')
local Keymap = require('keymap')

hs.notify.new({title="Hammerspoon", informativeText="Config loaded"}):send()
