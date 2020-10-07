hyper = hs.hotkey.modal.new({}, nil)
hyper.pressed = function() hyper:enter() end
hyper.released = function() hyper:exit() end
hs.hotkey.bind({}, 'F19', hyper.pressed, hyper.released)

-- Application Aliases
browser = 'Google Chrome'
editor = 'Visual Studio Code'
terminal = 'iTerm'
database = 'DataGrip'
rest_client = 'PostmanCanary'
music = 'Spotify'
slack = 'Slack'
chat = 'Discord'

-- Single Key Hyper Invocations
lowerHotkeys = {
   space = 'Alfred 4',
   a = 'Activity Monitor',
   b = browser,
   e = editor,
   i = terminal,
   d = database,
   f = 'Finder',
   m = 'Messages',
   r = rest_client,
   p = music,
   s = slack,
   c = chat,
   w = 'Hammerspoon',
   z = 'Zoom.us'
}
for key, app in pairs(lowerHotkeys) do
   hyper:bind({}, key, nil, function() launch(app); hyper:exit(); end)
end
hyper:bind({}, "h", nil, function() spoon.WinWin:moveAndResize("halfleft") end)
hyper:bind({}, "j", nil, function() hs.window.focusedWindow():moveToScreen(hs.window.focusedWindow():screen():next()) end)
hyper:bind({}, "k", nil, function() hs.window.focusedWindow():maximize() end)
hyper:bind({}, "l", nil, function() spoon.WinWin:moveAndResize("halfright") end)
hyper:bind({}, ";", nil, function() threeMonitorLayout() end)

upperHotkeys = {
   w = function() hs.reload() end
}
for key, app in pairs(upperHotkeys) do
   if type(app) == 'function' then
      hyper:bind({'cmd'}, key, nil, app)
   else
      hyper:bind({'cmd'}, key, nil, function() launch(app); hyper:exit(); end)
   end
end
----------------------- SPACE CADET ----------------------
-- https://github.com/Hammerspoon/hammerspoon/issues/1732
-- https://gist.github.com/casouri/06e02230dbfd6ab68fd1798ddb025148
-- Every key is of format {{modifers}, key, (optional) description}
-- The first two element is what you usually pass into a hs.hotkey.bind() function.
-- Each value of key can be in two form:
-- 1. A function. Then pressing the key invokes the function
-- 2. A table. Then pressing the key bring to another layer of keybindings.
--    And the table have the same format of top table: keys to keys, value to table or function
local spaceCadetMapWithName = {
   [singleKey('`', 'run command')] = runCommand,
   [singleKey('f', 'find+')] = {
      [singleKey('D', 'Desktop')] = function() directoryLaunch('~/Desktop') end,
      [singleKey('d', 'Download')] = function() directoryLaunch('~/Downloads') end,
      [singleKey('a', 'Application')] = function() directoryLaunch('~/Applications') end,
      [singleKey('h', 'home')] = function() directoryLaunch('~') end
   },
   [singleKey('s', 'Spotify')] = {
      [singleKey('s', 'Show Current Track')] = function() hs.spotify.displayCurrentTrack() end,
      [singleKey('n', 'Next Track')] = function() hs.spotify.next() end,
      [singleKey('N', 'Previous Track')] = function() hs.spotify.previous() end,
      [singleKey('p', 'Play')] = function() hs.spotify.play() end,
      [singleKey('P', 'Pause')] = function() hs.spotify.pause() end,
      [singleKey('v', 'Pause')] = function() hs.spotify.volumeUp() end,
      [singleKey('V', 'Pause')] = function() hs.spotify.volumeDown() end,
   },
   [singleKey('t', 'toggle+')] = {
      [singleKey('v', 'file visible')] = function() hs.eventtap.keyStroke({'cmd', 'shift'}, '.') end
   },
   [singleKey('h', '←')] = function() moveAndResize('left') moveWindowMode() end,
   [singleKey('j', '↓')] = function() moveAndResize('down') moveWindowMode() end,
   [singleKey('k', '↑')] = function() moveAndResize('up') moveWindowMode() end,
   [singleKey('l', '→')] = function() moveAndResize('right') moveWindowMode() end
}
hs.hotkey.bind({'shift'}, 'space', nil, recursiveBind(spaceCadetMapWithName))
