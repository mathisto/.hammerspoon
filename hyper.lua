-- Hyper
--
-- Hyper is a Hyper shortcut modal.
--
-- Feel free to modify... I use karabiner-elements.app on my laptop and QMK on
-- my mech keyboards to bind a single key to `F19`, which fires all this
-- Hammerspoon-powered OSX automation.
--
-- I chiefly use it to launch applications quickly from a single press,
-- although I also use it to create "universal" local bindings inspired by
-- Shawn Blanc's OopsieThings.
-- https://thesweetsetup.com/oopsiethings-applescript-for-things-on-mac/

local Hyper = hs.hotkey.modal.new({}, nil)

Hyper.pressed = function()
  Hyper:enter()
end

Hyper.released = function()
  Hyper:exit()
end

-- Set the key you want to be Hyper to F19 in karabiner or keyboard
-- Bind the Hyper key to the hammerspoon modal
hs.hotkey.bind({}, 'F19', Hyper.pressed, Hyper.released)


Hyper.Launch = function(app)
  hs.application.launchOrFocusByBundleID(app.bundleID)
end

-- Expects a configuration table with an applications key that has the
-- following form:
-- config_table.applications = {
--   ['com.culturedcode.ThingsMac'] = {
--     bundleID = 'com.culturedcode.ThingsMac',
--     hyper_key = 't',
--     tags = {'#planning', '#review'},
--     local_bindings = {',', '.'}
--   },
-- }
Hyper.start = function(config_table)
  -- Use the Hyper key with the application config to use the `hyper_key`
  for _, app in pairs(config_table.applications) do
    -- Apps that I want to jump to
    if app.hyper_key then
      Hyper:bind({}, app.hyper_key, function() Hyper.Launch(app); end)
    end

    -- I use Hyper to power some shortcuts in different apps If the app is closed
    -- and I press the shortcut, open the app and send the shortcut, otherwise
    -- just send the shortcut.
    if app.local_bindings then
      for _, key in pairs(app.local_bindings) do
        Hyper:bind({}, key, nil, function()
          if hs.application.find(app.bundleID) then
            hs.eventtap.keyStroke({'cmd','alt','shift','ctrl'}, key)
          else
            Hyper.Launch(app)
            hs.timer.waitWhile(
              function() return hs.application.find(app.bundleID) == nil end,
              function()
                hs.eventtap.keyStroke({'cmd','alt','shift','ctrl'}, key)
              end)
          end
        end)
      end
    end
  end
end

return Hyper
