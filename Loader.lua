if not game:IsLoaded() then
	game.Loaded:Wait()
end

local BASE = "https://raw.githubusercontent.com/migoel787-arch/Ghoulhub/main/"

local function load(file)
	return loadstring(game:HttpGet(BASE .. file))()
end

-- Intro (opcional)
pcall(function()
	load("Intro.lua")
end)

-- Música (5s)
pcall(function()
	local Music = load("Music.lua")
	if Music and Music.Play then
		Music:Play()
	end
end)

-- UI (OBRIGATÓRIO)
pcall(function()
	load("Ui.lua")
end)
