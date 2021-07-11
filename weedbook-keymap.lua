-- Application Aliases
BROWSER = 'Vivaldi'
EDITOR = 'Visual Studio Code'
REST_CLIENT = 'Insomnia'
NOTES = 'Obsidian'

-- Simple, single key Hyper Invocations
HyperBindings = {
   space = 'Alfred 4',
   a = 'Activity Monitor',
   b = BROWSER,
   d = 'DataGrip',
   e = EDITOR,
   f = 'Finder',
   i = 'iTerm',
   n = 'NoMachine',
   o = NOTES,
   r = REST_CLIENT,
   s = 'Slack',
   w = 'Hammerspoon',
}

Hyper:bind({}, "c", nil, function() JumpToTab("calendar.google.com") end)
Hyper:bind({}, "h", nil, function() spoon.WinWin:moveAndResize("halfleft") end)
Hyper:bind({}, "l", nil, function() spoon.WinWin:moveAndResize("halfright") end)
Hyper:bind({}, "m", nil, function() JumpToTab("mail.google.com") end)
Hyper:bind({}, "t", nil, function() hs.application.launchOrFocusByBundleID("com.culturedcode.ThingsMac") end)
Hyper:bind({}, "y", nil, function() JumpToTab("www.youtube.com") end)
Hyper:bind({}, "z", nil, function() JumpToTab("meet.google.com") end)

CmdHyperBindings = {
   a = function() DirectoryLaunch('~/Applications/') end,
   b = function() HyperFunction(Launch('Bitwarden')) end,
   d = function() HyperFunction(Launch('Discord')) end,
   h = function() HyperFunction(OpenWithApp('/Users/mkelly/ownCloud/dotfiles/common/.hammerspoon/', 'Visual Studio Code')) end,
   j = function() spoon.WinWin:moveAndResize("minimize") end,
   k = function() spoon.WinWin:moveAndResize("maximize") end,
   o = function() hs.window.focusedWindow():moveToScreen(hs.window.focusedWindow():screen():next()) end,
   p = function() TypePass() end,
   z = function() HyperFunction(Launch('Zoom.us')) end
}
