(local RecBin spoon.RecursiveBinder)
(local open_url! hs.urlevent.openURL)
(local launch! App.launchOrFocus)

(set RecBin.escapeKey [{} :escape])
(local key RecBin.singleKey)
(local keymap 
  {(key :b :browser) #(launch! :Vivaldi)
   (key :e :editor) #(launch! :Code)
   (key :h :editor) #(launch! :Hammerspoon)
   (key :t :terminal) #(launch! :iTerm)})

(bind! [:command] :space (RecBin.recursiveBind keymap))	