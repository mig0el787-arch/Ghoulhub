-- Ghoul Hub - Intro ☠️

local Intro = {}

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local Player = Players.LocalPlayer

function Intro.Play()
	local gui = Instance.new("ScreenGui")
	gui.Name = "GhoulIntro"
	gui.IgnoreGuiInset = true
	gui.ResetOnSpawn = false
	gui.Parent = Player:WaitForChild("PlayerGui")

	-- BACKGROUND
	local bg = Instance.new("Frame", gui)
	bg.Size = UDim2.new(1,0,1,0)
	bg.BackgroundColor3 = Color3.fromRGB(0,0,0)

	-- IMAGE
	local img = Instance.new("ImageLabel", bg)
	img.Size = UDim2.new(1,0,1,0)
	img.Image = "rbxassetid://74356605425526" -- FOTO DO GHOUL
	img.BackgroundTransparency = 1
	img.ScaleType = Enum.ScaleType.Crop

	-- OVERLAY
	local overlay = Instance.new("Frame", bg)
	overlay.Size = UDim2.new(1,0,1,0)
	overlay.BackgroundColor3 = Color3.fromRGB(0,0,0)
	overlay.BackgroundTransparency = 0.35

	-- BAR BG
	local barBG = Instance.new("Frame", bg)
	barBG.Size = UDim2.new(0.4,0,0,16)
	barBG.Position = UDim2.new(0.3,0,0.85,0)
	barBG.BackgroundColor3 = Color3.fromRGB(30,30,30)
	barBG.BorderSizePixel = 0
	Instance.new("UICorner", barBG).CornerRadius = UDim.new(1,0)

	-- BAR
	local bar = Instance.new("Frame", barBG)
	bar.Size = UDim2.new(0,0,1,0)
	bar.BackgroundColor3 = Color3.fromRGB(160, 70, 255)
	bar.BorderSizePixel = 0
	Instance.new("UICorner", bar).CornerRadius = UDim.new(1,0)

	-- TEXT
	local txt = Instance.new("TextLabel", bg)
	txt.Size = UDim2.new(1,0,0,30)
	txt.Position = UDim2.new(0,0,0.8,0)
	txt.BackgroundTransparency = 1
	txt.Text = "Carregando 0%"
	txt.Font = Enum.Font.GothamBold
	txt.TextSize = 18
	txt.TextColor3 = Color3.new(1,1,1)

	-- MUSIC (5s)
	local sound = Instance.new("Sound")
	sound.SoundId = "rbxassetid://1843528843" -- emo
	sound.Volume = 1
	sound.Looped = false
	sound.Parent = bg
	sound:Play()

	task.delay(5, function()
		if sound then
			sound:Stop()
			sound:Destroy()
		end
	end)

	-- LOADING
	local duration = 5
	local start = tick()

	while tick() - start < duration do
		local p = math.clamp((tick() - start)/duration, 0, 1)
		bar.Size = UDim2.new(p,0,1,0)
		txt.Text = "Carregando "..math.floor(p*100).."%"
		task.wait()
	end

	bar.Size = UDim2.new(1,0,1,0)
	txt.Text = "Carregando 100%"

	TweenService:Create(bg, TweenInfo.new(0.6), {
		BackgroundTransparency = 1
	}):Play()

	task.wait(0.6)
	gui:Destroy()
end

return Intro
