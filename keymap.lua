hyper = hs.hotkey.modal.new({}, nil)
hyper.pressed = function() hyper:enter() end
hyper.released = function() hyper:exit() end
hs.hotkey.bind({}, 'F19', hyper.pressed, hyper.released)

-- Application Aliases
browser = 'Google Chrome'
editor = 'MacVim'
rest_client = 'Insomnia'

-- Single Key Hyper Invocations
appBindings = {
   space = 'Alfred 4',
   a = 'Activity Monitor',
   b = browser,
   e = editor,
   i = 'iTerm',
   d = 'DataGrip',
   f = 'Finder',
   j = 'My JIRA',
   m = 'GMail Weedmaps',
   r = rest_client,
   p = 'Stream Present',
   s = 'Slack',
   t = 'Meet',
   c = 'Calendar - Weedmaps',
   w = 'Hammerspoon',
   y = 'YouTube',
   z = 'Zoom.us'
}
for key, app in pairs(appBindings) do
   hyper:bind({}, key, nil, function() hyperFunction(launch(app)) end)
end
hyper:bind({}, "h", nil, function() spoon.WinWin:moveAndResize("halfleft") end)
hyper:bind({}, "l", nil, function() spoon.WinWin:moveAndResize("halfright") end)

cmdHyperBindings = {
   w = function() hs.reload() end,
   a = function() directoryLaunch('~/Applications/') end,
   o = function() hs.window.focusedWindow():moveToScreen(hs.window.focusedWindow():screen():next()) end,
   j = function() hs.window.focusedWindow():maximize() end,
   k = function() hs.window.focusedWindow():maximize() end
}
for key, func in pairs(cmdHyperBindings) do
   hyper:bind({'cmd'}, key, nil, function() hyperFunction(func()) end)
end
