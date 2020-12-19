launch = function(appname)
  hs.application.launchOrFocus(appname)
  hyper.triggered = true
end

hyperFunction = function(func)
  if func == nil then return nil end
  func()
  hyper:exit()
end

directoryLaunch = function(dir)
  local shell_command = "open " .. dir
  hs.execute(shell_command)
end
