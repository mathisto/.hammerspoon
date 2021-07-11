--- === MicMute ===
local obj={}
obj.__index = obj
-- Metadata
obj.name = "MicMute"
function obj:updateMicMute(muted)
	if muted == -1 then
		muted = hs.audiodevice.defaultInputDevice():muted()
	end
	if muted then
		obj.mute_menu:setTitle("📵 Muted")
	else
		obj.mute_menu:setTitle("🎙 On")
	end
end

function obj:toggleMicMute()
	local mic = hs.audiodevice.defaultInputDevice()
	if mic:muted() then
		mic:setMuted(false)
	else
		mic:setMuted(true)
	end
	obj:updateMicMute(-1)
end

function obj:bindHotkeys(mapping, latch_timeout)
	if (self.hotkey) then
		self.hotkey:delete()
	end
	local mods = mapping["toggle"][1]
	local key = mapping["toggle"][2]
	if latch_timeout then
		self.hotkey = hs.hotkey.bind(mods, key, function()
			self:toggleMicMute()
			self.time_since_mute = hs.timer.secondsSinceEpoch()
		end, function()
			if hs.timer.secondsSinceEpoch() > self.time_since_mute + latch_timeout then
				self:toggleMicMute()
			end
		end)
	else
		self.hotkey = hs.hotkey.bind(mods, key, function()
			self:toggleMicMute()
		end)
	end
	return self
end
function obj:init()
	obj.time_since_mute = 0
	obj.mute_menu = hs.menubar.new()
	obj.mute_menu:setClickCallback(function()
		obj:toggleMicMute()
	end)
	obj:updateMicMute(-1)
	hs.audiodevice.watcher.setCallback(function(arg)
		if string.find(arg, "dIn ") then
			obj:updateMicMute(-1)
		end
	end)
	hs.audiodevice.watcher.start()
end

return obj