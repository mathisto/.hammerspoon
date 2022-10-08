(global notify! hs.alert.show)
(let [reload_config (hs.loadSpoon :ReloadConfiguration)]
  (reload_config:start)	;; Enable hot reloading of Hammerspoon config
  (notify! "👁 DoomHammer looms menacingly...👁"))

(require :cljlib)   ;; Dat sweet sweet clojure
(require :keymaps)  ;; Spacemacs flavored menu driver 
