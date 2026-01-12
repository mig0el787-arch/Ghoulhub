-- Ghoul Hub - Music Module ☠️

local Music = {}
local SoundService = game:GetService("SoundService")

function Music:Play()
	-- 🔴 TROCA O ID SE QUISER OUTRA MÚSICA
	local sound = Instance.new("Sound")
	sound.SoundId = "rbxassetid://1843528843" -- emo / clean (exemplo)
	sound.Volume = 1
	sound.Looped = false
	sound.Parent = SoundService

	sound:Play()

	-- toca só 5 segundos
	task.delay(5, function()
		if sound then
			sound:Stop()
			sound:Destroy()
		end
	end)
end

return Music
