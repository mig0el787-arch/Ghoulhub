-- Ghoul Hub Loader ☠️

if not game:IsLoaded() then
	game.Loaded:Wait()
end

local Players = game:GetService("Players")
local Player = Players.LocalPlayer

-- Proteção simples (não carregar duas vezes)
local gui = Player:WaitForChild("PlayerGui")
if gui:FindFirstChild("GhoulHub") then
	return
end

-- URL BASE (SEU REPOSITÓRIO)
local BASE_URL = "https://raw.githubusercontent.com/mig0el787-arch/Ghoulhub/main/"

-- Função de load
local function load(file)
	return loadstring(game:HttpGet(BASE_URL .. file))()
end

-- INTRO (opcional)
pcall(function()
	local Intro = load("Intro.lua")
	if Intro and Intro.Play then
		Intro:Play()
	end
end)

-- MÚSICA (5 segundos – controlado no Music.lua)
pcall(function()
	local Music = load("Music.lua")
	if Music and Music.Play then
		Music:Play()
	end
end)

-- UI (sempre por último)
pcall(function()
	load("UI.lua")
end)
