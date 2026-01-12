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

-- Pasta do Hub
local BASE_URL = "https://raw.githubusercontent.com/mig0el787-arch/GhoulHub/main/"

-- Carrega módulos
local function load(file)
	return loadstring(game:HttpGet(BASE_URL .. file))()
end

-- Música (5 segundos)
pcall(function()
	load("Modules/Music.lua").Play()
end)

-- Interface
pcall(function()
	load("Modules/UI.lua")
end)
