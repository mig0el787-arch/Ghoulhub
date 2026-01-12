-- Ghoul Hub UI ☠️
-- Floating Button
local Floating = loadstring(game:HttpGet(
	"https://raw.githubusercontent.com/mig0el787-arch/GhoulHub/main/Modules/FloatingButton.lua"
))()
local Players = game:GetService("Players")
local Player = Players.LocalPlayer

-- GUI
local gui = Instance.new("ScreenGui")
gui.Name = "GhoulHub"
gui.Parent = Player:WaitForChild("PlayerGui")
gui.ResetOnSpawn = false

-- MAIN
local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 520, 0, 330)
main.Position = UDim2.new(0.5, -260, 0.5, -165)
main.BackgroundColor3 = Color3.fromRGB(10,10,10)
main.BorderSizePixel = 0
Instance.new("UICorner", main).CornerRadius = UDim.new(0,14)

-- TITLE
local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1, -140, 0, 50)
title.Position = UDim2.new(0, 140, 0, 0)
title.BackgroundTransparency = 1
title.Text = "Ghoul hub ☠️"
title.Font = Enum.Font.GothamBlack
title.TextSize = 22
title.TextColor3 = Color3.fromRGB(170, 80, 255)
title.TextXAlignment = Left

-- SIDEBAR (BRANCA)
local side = Instance.new("Frame", main)
side.Size = UDim2.new(0, 120, 1, 0)
side.BackgroundColor3 = Color3.fromRGB(245,245,245)
side.BorderSizePixel = 0
Instance.new("UICorner", side).CornerRadius = UDim.new(0,14)

-- CONTENT
local content = Instance.new("Frame", main)
content.Position = UDim2.new(0, 140, 0, 50)
content.Size = UDim2.new(1, -160, 1, -70)
content.BackgroundTransparency = 1

-- Tabs
local tabs = {}

local function createTab(name, order)
	-- Button
	local btn = Instance.new("TextButton", side)
	btn.Size = UDim2.new(1, -20, 0, 42)
	btn.Position = UDim2.new(0, 10, 0, 10 + (order-1)*50)
	btn.BackgroundColor3 = Color3.fromRGB(255,255,255)
	btn.Text = name
	btn.Font = Enum.Font.GothamBold
	btn.TextSize = 14
	btn.TextColor3 = Color3.fromRGB(140, 60, 220)
	btn.BorderSizePixel = 0
	Instance.new("UICorner", btn).CornerRadius = UDim.new(0,10)

	-- Frame
	local frame = Instance.new("Frame", content)
	frame.Size = UDim2.new(1,0,1,0)
	frame.Visible = false
	frame.BackgroundTransparency = 1

	btn.MouseButton1Click:Connect(function()
		for _,v in pairs(tabs) do
			v.Visible = false
		end
		frame.Visible = true
	end)

	table.insert(tabs, frame)
	return frame
end

-- ABAS
local tab1 = createTab("Player", 1)
local tab2 = createTab("Movement", 2)
local tab3 = createTab("World", 3)
local tab4 = createTab("Fun", 4)
local tab5 = createTab("Avatar", 5)
local tab6 = createTab("Settings", 6)

tabs[1].Visible = true

-- Botão padrão
local function createButton(parent, text, y, callback)
	local b = Instance.new("TextButton", parent)
	b.Size = UDim2.new(0, 220, 0, 42)
	b.Position = UDim2.new(0, 10, 0, y)
	b.BackgroundColor3 = Color3.fromRGB(60, 0, 90)
	b.Text = text
	b.Font = Enum.Font.GothamBold
	b.TextSize = 14
	b.TextColor3 = Color3.new(1,1,1)
	b.BorderSizePixel = 0
	Instance.new("UICorner", b).CornerRadius = UDim.new(0,10)
	b.MouseButton1Click:Connect(callback)
end

-- EXEMPLOS DE BOTÕES
createButton(tab1, "Reset Character", 20, function()
	Player.Character:BreakJoints()
end)

createButton(tab6, "Close Hub", 20, function()
	gui:Destroy()
end)
-- Movement module
local Movement = loadstring(game:HttpGet(
	"https://raw.githubusercontent.com/mig0el787-arch/GhoulHub/main/Modules/Movement.lua"
))()
-- Toggle via botão flutuante
main.Visible = true

Floating.Create(function()
	main.Visible = not main.Visible
end)
