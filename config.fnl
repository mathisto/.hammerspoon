(local SpoonInstall (hs.loadSpoon :SpoonInstall))
(SpoonInstall:andUse :Hyper) ;; Yo dawg! I head you like PTT layers...
(SpoonInstall:andUse :RecursiveBinder) ;; Simple nested menu system, ala Spacemacs
(SpoonInstall:andUse :ReloadConfiguration {:start true}) ;; Enable hot reloading of Hammerspoon config
;; These are effectively alieases. Makes the rest of our config read a lot nicer
(global App hs.application)
(global hyper spoon.Hyper)
(global notify! hs.alert.show)
(global bind! hs.hotkey.bind)
(global launch! App.launchOrFocus)

(spoon.Hyper:bindHotKeys {:hyperKey [{} :F20]})

(require :colors)               ;; Every pixel, a painting
(require :hammerspoon)          ;; Meta config of hamerspoon interface, itself
(require :keymaps)              ;; Spacemacs flavored menu driver 

(notify! "👁 DoomHammer looms menacingly... 👁")
