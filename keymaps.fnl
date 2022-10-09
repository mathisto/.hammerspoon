(local app {
  :editor "Visual Studio Code"
  :browser "Vivaldi"
  :terminal "iTerm"
  :music "Museeks"
})

(local yabai_path "/opt/homebrew/bin/yabai ")
(fn yabai [message] 
  "Sends a message to yabai window manager" 
  (hs.execute (.. yabai_path message)))

;; Manually reload hammerspoon
(hyper:bind [] :r #(hs.reload))	
(hyper:bind [:cmd] :r #(hs.execute "launchctl kickstart -k \"gui/${UID}/homebrew.mxcl.yabai\""))	

;; Application Invocations
(hyper:bind {} :a #(launch! "Alfred 5"))	
(hyper:bind {} :b #(launch! app.browser))	
(hyper:bind {} :e #(launch! app.editor))	
(hyper:bind {} :i #(launch! app.terminal))	
(hyper:bind {} :n #(launch! :Logseq))	
(hyper:bind {} :w #(launch! :Hammerspoon))	

;; Focus window in cardinal direction
(hyper:bind {} :h #(yabai "-m window --focus west"))
; (hyper:bind {} :j #(yabai "-m window --focus south"))
; (hyper:bind {} :k #(yabai "-m window --focus north"))
(hyper:bind {} :l #(yabai "-m window --focus east"))
