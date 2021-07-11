-- Application Aliases
BROWSER = 'Vivaldi'
VIM = 'nvim'
EDITOR = 'Visual Studio Code'
NOTES = 'Bear'
REST_CLIENT = 'PostmanCanary'

-- Single Key Hyper Invocations
HyperBindings = {
   space = 'Alfred 4',
   a = 'Activity Monitor',
   b = BROWSER,
   e = EDITOR,
   f = 'Finder',
   m = 'Mudlet',
   i = 'iTerm',
   n = NOTES,
   r = REST_CLIENT,
   s = 'Slack',
   t = 'Things',
   v = VIM,
   w = 'World of Warcraft',
   y = 'Terminal',
}

Hyper:bind({}, "h", nil, function() spoon.WinWin:moveAndResize("halfleft") end)
Hyper:bind({}, "l", nil, function() spoon.WinWin:moveAndResize("halfright") end)

CmdHyperBindings = {
   a = function() DirectoryLaunch('~/Applications/') end,
   c = function() HyperFunction(Launch('Visual Studio Code')) end,
   d = function() HyperFunction(Launch('Discord')) end,
   h = function() HyperFunction(OpenWithApp('/Users/mathisto/ownCloud/dotfiles/common/.hammerspoon/', 'Visual Studio Code')) end,
   j = function() spoon.WinWin:moveAndResize("minimize") end,
   k = function() spoon.WinWin:moveAndResize("maximize") end,
   m = function() HyperFunction(Launch('Messages')) end,
   o = function() hs.window.focusedWindow():moveToScreen(hs.window.focusedWindow():screen():next()) end,
   p = function() TypePass() end,
}
