# DoomHammer
A bespoke Hammerspoon config; hand tailored for demon slaying. 

### Inspiration:
- Doom Emacs - Henrik is an inspiration to us all. 
- MenuHammer - for the look and feel akin to Doom menu 
- Spacehammer's `package.path` boostrapping `init.lua`
- Spacemacs - for lending us your philosophy

### Thanks
- [evantravers](https://github.com/evantravers) for his amazing [Hyper modal key tutorial](https://evantravers.com/articles/2020/06/08/hammerspoon-a-better-better-hyper-key/).
- [Nethum Lamahewage](https://nethumlamahewage.medium.com/setting-up-a-global-leader-key-for-macos-using-hammerspoon-f0330f8a7a4a) for his tutorial on the "Recursive Binder" spoon.
- rtauziac for his [Yabai IPC code](https://github.com/rtauziac/Hammerspoon-Yabai/)
- Clojure afforfances by [cljlib](https://gitlab.com/andreyorst/fennel-cljlib)

### TODO
- [ ] Create macro for 
  `hs.hotkey.bind(super, hs.keycodes.map["h"], function() yabai({"-m", "space", "--rotate", "270"}, function() toast("🔲🔁") end) end)  --["."]`

- [ ] 