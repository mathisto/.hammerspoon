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

-- Now let's get down to the good stuff. 
require "config" -- It's all fennel from here...