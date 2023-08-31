-- We use Inter Process Communication (IPC) protocols
-- to send real time messagees to yabai, sketchybar, and mpv
-- I want this up no matter what. I place it here in honor of
-- its import to me. Without it, my machine crumbls to dust,
-- yabai cries, and angel loses a wing.
require "hs.ipc"
hs.ipc.cliInstall("/Users/mathisto/.local")

-- We need to shunt fennel into Hammerspoon's package searchers
-- Let's make sure out local Lua and rocks are on the path
-- and then make some magic happen
package.path = package.path .. ";" ..
  os.getenv("HOME") .. "/.luarocks/share/lua/5.4/?.lua;" ..
  os.getenv("HOME") .. "/.luarocks/share/lua/5.4/?/init.lua"
package.cpath = package.cpath .. ";" ..
  os.getenv("HOME") .. "/.luarocks/lib/lua/5.4/?.so"

Fennel = require("fennel")
table.insert(package.searchers, Fennel.searcher)

-- I also like to alias a lot of tables for easier invocation
-- Yes, im polluting the global namespace of a trivally sized config
Spoons = hs.spoons

-- Now let's get down to the good stuff.
require "config" -- It's all fennel from here...
