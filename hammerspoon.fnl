;; Hammerspoon related fluff and stuff
(hs.console.darkMode true)
(when (hs.console.darkMode)
  (hs.console.outputBackgroundColor {:white 0})
  (hs.console.consoleCommandColor {:white 1}))	
(hs.console:clearConsole)