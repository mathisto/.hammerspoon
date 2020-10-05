-- Monitors
local left_acer = hs.screen.find(478251797)
local center_dell = hs.screen.find(722497435)
local right_dell = hs.screen.find(722476764)

-- 3 Monitor Battlestation Layout
threeMonitorLayout = function()
  local windowLayout = {
      {browser,   nil,   left_acer,   hs.layout.maximized,   nil, nil},
      {'iTerm2',  nil,   center_dell, hs.layout.right50,     nil, nil},
      {'Code',    nil,   center_dell, hs.layout.left50,      nil, nil},
      {database,  nil,   right_dell,  hs.layout.maximized,   nil, nil},
      {slack,     nil,   right_dell,  hs.layout.left50,      nil, nil},
      {chat,      nil,   right_dell,  hs.layout.right50,     nil, nil},
      {music,     nil,   right_dell,  hs.layout.right50,     nil, nil},
  }
  hs.layout.apply(windowLayout)
  hs.application.launchOrFocus(browser)
  hs.application.launchOrFocus(editor)
  hs.application.launchOrFocus(terminal)
  hs.application.launchOrFocus(slack)
  hs.application.launchOrFocus(music)
end
