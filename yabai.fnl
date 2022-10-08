(global yabai (fn [args completion]
  (var yabai-output "")
  (var yabai-error "")
  (local yabai-task
    (hs.task.new :/usr/local/bin/yabai nil (fn [task stdout stderr]
      (print (.. "stdout:" stdout) (.. "stderr:" stderr))
      (when (not= stdout nil) (set yabai-output (.. yabai-output stdout)))
      (when (not= stderr nil) (set yabai-error (.. yabai-error stderr)))
      true) args))
  (when (= (type completion) :function)
    (yabai-task:setCallback (fn [] (completion yabai-output yabai-error))))
  (yabai-task:start)))	