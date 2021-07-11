Launch = function(appname)
  hs.application.launchOrFocus(appname)
  Hyper.triggered = true
end

HyperFunction = function(func)
  if func == nil then return nil end
  func()
  Hyper:exit()
end

DirectoryLaunch = function(dir)
  local shell_command = "open " .. dir
  hs.execute(shell_command)
end

OpenWithApp = function(file, app)
    local appleScript = 'tell application "' .. app .. '" to open "' .. file .. '"'
    hs.osascript.applescript(appleScript)
    hs.application.launchOrFocus(app)
end

TypePass = function()
local secret_pass = hs.settings.get("secrets")["p"]
local appleScript = [[
  tell application "System Events"
    delay 0.3
    keystroke "$SecretPass"
  end tell
]]
appleScript = appleScript:gsub('$SecretPass', secret_pass)
hs.osascript.applescript(appleScript)
end

JumpToTab = function(url)
  hs.osascript.javascript([[
    (function() {
      var vivaldi = Application('Vivaldi');
      vivaldi.activate();
      for (win of vivaldi.windows()) {
        var tabIndex =
          win.tabs().findIndex(tab => tab.url().match(/]] .. url .. [[/));
        if (tabIndex != -1) {
          win.activeTabIndex = (tabIndex + 1);
          win.index = 1;
        }
      }
    })();
    ]])
end

-- Prints contents of table
Tprint = function(tbl, indent)
  if not indent then indent = 0 end
  local toprint = string.rep(" ", indent) .. "{\r\n"
  indent = indent + 2
  for k, v in pairs(tbl) do
    toprint = toprint .. string.rep(" ", indent)
    if (type(k) == "number") then
      toprint = toprint .. "[" .. k .. "] = "
    elseif (type(k) == "string") then
      toprint = toprint  .. k ..  "= "
    end
    if (type(v) == "number") then
      toprint = toprint .. v .. ",\r\n"
    elseif (type(v) == "string") then
      toprint = toprint .. "\"" .. v .. "\",\r\n"
    elseif (type(v) == "table") then
      toprint = toprint .. tprint(v, indent + 2) .. ",\r\n"
    else
      toprint = toprint .. "\"" .. tostring(v) .. "\",\r\n"
    end
  end
  toprint = toprint .. string.rep(" ", indent-2) .. "}"
  return toprint
end
