(hs.loadSpoon :RecursiveBinder)
(local rb spoon.RecursiveBinder)
(set rb.escapeKey [{} :escape])
(local key rb.singleKey)
(local keymap
       {(key :b :browser) #(hs.application.launchOrFocus :Vivaldi)
        (key :d :Domain+) {
          (key :g :github) #(hs.urlevent.openURL :github.com) 
          (key :y :youtube) #(hs.urlevent.openURL :youtube.com)}
        (key :t :terminal) #(hs.application.launchOrFocus :iTerm)})
(hs.hotkey.bind [:cmd] :space (spoon.RecursiveBinder.recursiveBind keymap))	