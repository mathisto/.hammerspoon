(local app {:browser "Vivaldi"
            :chat "Discord"
            :calendar "Fantastical"
            :email "Mail"
            :editor "Visual Studio Code"
            :finder "QSpace Pro"
            :music "YouTube"
            :notes "Logseq"
            :terminal "iTerm"})

;; Application Invocations
(hyper:bind []     :a     #(launch! "Dyalog"))
(hyper:bind [:cmd] :a     #(launch! "Activity Monitor"))
(hyper:bind []     :b     #(launch! app.browser))
(hyper:bind [:cmd] :b     #(launch! :Bitwarden))
(hyper:bind []     :c     #(launch! app.calendar))
(hyper:bind [:cmd] :c     #(launch! app.chat))
(hyper:bind []     :d     #(launch! :Datagrip))
(hyper:bind []     :e     #(launch! app.editor))
(hyper:bind []     :f     #(launch! app.finder))
(hyper:bind []     :g     #(launch! "Google Meet"))
(hyper:bind [:cmd] :g     #(launch! :MacGPT))
(hyper:bind []     :i     #(launch! app.terminal))
(hyper:bind []     :j     #(launch! "IntelliJ IDEA"))
(hyper:bind []     :m     #(launch! app.email))
(hyper:bind [:cmd] :m     #(launch! :Messages))
(hyper:bind []     :n     #(launch! app.notes))
(hyper:bind []     :o     #(launch! "OBS"))
(hyper:bind []     :p     #(launch! :Preview))
(hyper:bind []     :r     #(launch! :Insomnia))
(hyper:bind [:cmd] :r     #(launch! :RubyMine))
(hyper:bind []     :s     #(launch! :Slack))
(hyper:bind []     :v     #(launch! "Visual Studio Code"))
(hyper:bind []     :y     #(launch! "Friendly Streaming"))
(hyper:bind []     :z     #(launch! :zoom.us))
(hyper:bind [:cmd] :space #(launch! :Raycast))
(hyper:bind [:alt] :space #(launch! :Raycast))
