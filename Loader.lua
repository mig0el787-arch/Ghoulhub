-- Ghoul Hub Loader ☠️

if not game:IsLoaded() then
	game.Loaded:Wait()
end

local Players = game:GetService("Players")
local Player = Players.LocalPlayer

-- Anti duplicação
if Player:WaitForChild("PlayerGui"):FindFirstChild("GhoulHub") then
	return
end

-- 🔥 URL CERTA (SEU REPO)
local BASE_URL = "https://raw.githubusercontent.com/mig0el787-arch/Ghoulhub/main/"

local function load(file)
	return loadstring(game:HttpGet(BASE_URL .. file))()
end

-- Intro
pcall(function()
	local Intro = load("Intro.lua")
	if Intro and Intro.Play then
		Intro.Play()
	end
end)

-- Música
pcall(function()
	local Music = load("Music.lua")
	if Music and Music.Play then
		Music.Play()
	end
end)

-- UI (AQUI MUDA O VISUAL)
pcall(function()
	load("Ui.lua")
end)
