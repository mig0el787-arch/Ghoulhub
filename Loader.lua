-- Ghoul Hub Loader ☠️

if not game:IsLoaded() then
	game.Loaded:Wait()
end

local Players = game:GetService("Players")
local Player = Players.LocalPlayer

-- Proteção simples
if Player:WaitForChild("PlayerGui"):FindFirstChild("GhoulHub") then
	return
end

-- 🔴 TROCA PELO TEU USUÁRIO
local BASE_URL = "https://raw.githubusercontent.com/mig0el787-arch/Ghoulhub/main/"

local function load(file)
	return loadstring(game:HttpGet(BASE_URL .. file))()
end

-- ▶️ INTRO (PRIMEIRO)
pcall(function()
	load("Modules/Intro.lua").Play()
end)

-- ▶️ MÚSICA (OPCIONAL)
pcall(function()
	local Music = load("Modules/Music.lua")
	if Music and Music.Play then
		Music:Play()
	end
end)

-- ▶️ UI (POR ÚLTIMO)
pcall(function()
	load("Modules/UI.lua")
end)
