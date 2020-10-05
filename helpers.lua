launch = function(appname)
  hs.application.launchOrFocus(appname)
  hyper.triggered = true
end

directoryLaunch = function(dir)
  local shell_command = "open " .. dir
  hs.execute(shell_command)
end
