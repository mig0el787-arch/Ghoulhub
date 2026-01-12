--// Ghoul Hub ☠️ | UI Module | Black & Purple

local Players = game:GetService("Players")
local Player = Players.LocalPlayer

-- Proteção
if Player.PlayerGui:FindFirstChild("GhoulHub") then
	return
end

-- Load Modules
local BASE_URL = "https://raw.githubusercontent.com/SEU_USUARIO/GhoulHub/main/Modules/"

local Movement = loadstring(game:HttpGet(BASE_URL .. "Movement.lua"))()
local Floating = loadstring(game:HttpGet(BASE_URL .. "Floating.lua"))()

-- GUI
local gui = Instance.new("ScreenGui", Player.PlayerGui)
gui.Name = "GhoulHub"
gui.ResetOnSpawn = false

-- Main Frame
local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 520, 0, 330)
main.Position = UDim2.new(0.5, -260, 0.5, -165)
main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
main.Visible = true

Instance.new("UICorner", main).CornerRadius = UDim.new(0, 14)

-- Title Bar
local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1, 0, 0, 50)
title.BackgroundColor3 = Color3.fromRGB(60, 0, 90)
title.Text = "Ghoul Hub ☠️"
title.Font = Enum.Font.GothamBold
title.TextSize = 20
title.TextColor3 = Color3.new(1,1,1)

Instance.new("UICorner", title).CornerRadius = UDim.new(0, 14)

-- Sidebar
local sidebar = Instance.new("Frame", main)
sidebar.Size = UDim2.new(0, 140, 1, -50)
sidebar.Position = UDim2.new(0, 0, 0, 50)
sidebar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)

-- Content
local content = Instance.new("Frame", main)
content.Size = UDim2.new(1, -140, 1, -50)
content.Position = UDim2.new(0, 140, 0, 50)
content.BackgroundTransparency = 1

-- Utility: Tabs
local tabs = {}

local function createTab(name)
	local tab = Instance.new("Frame", content)
	tab.Size = UDim2.new(1, 0, 1, 0)
	tab.Visible = false
	tab.BackgroundTransparency = 1
	tabs[name] = tab
	return tab
end

-- Utility: Buttons
local function createButton(parent, text, y, callback)
	local b = Instance.new("TextButton", parent)
	b.Size = UDim2.new(0, 260, 0, 42)
	b.Position = UDim2.new(0, 20, 0, y)
	b.BackgroundColor3 = Color3.fromRGB(90, 0, 140)
	b.Text = text
	b.Font = Enum.Font.GothamBold
	b.TextSize = 14
	b.TextColor3 = Color3.new(1,1,1)
	b.BorderSizePixel = 0

	Instance.new("UICorner", b).CornerRadius = UDim.new(0, 10)

	b.MouseButton1Click:Connect(callback)
end

-- Tabs
local tabMovement = createTab("Movement")
tabMovement.Visible = true

-- Sidebar Buttons
local function sidebarButton(text, y, tab)
	local b = Instance.new("TextButton", sidebar)
	b.Size = UDim2.new(1, -20, 0, 40)
	b.Position = UDim2.new(0, 10, 0, y)
	b.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	b.Text = text
	b.Font = Enum.Font.GothamBold
	b.TextSize = 13
	b.TextColor3 = Color3.new(1,1,1)
	b.BorderSizePixel = 0

	Instance.new("UICorner", b).CornerRadius = UDim.new(0, 8)

	b.MouseButton1Click:Connect(function()
		for _, t in pairs(tabs) do
			t.Visible = false
		end
		tab.Visible = true
	end)
end

sidebarButton("Movement", 20, tabMovement)

-- Movement Buttons
createButton(tabMovement, "Speed x2", 20, function()
	Movement.SetSpeed(32)
end)

createButton(tabMovement, "Jump High", 70, function()
	Movement.SetJump(100)
end)

createButton(tabMovement, "Gravity Low", 120, function()
	Movement.SetGravity(80)
end)

createButton(tabMovement, "Reset Stats", 170, function()
	Movement.Reset()
end)

createButton(tabMovement, "Close Hub", 230, function()
	gui:Destroy()
end)

-- Floating Button
Floating.Create(function()
	main.Visible = not main.Visible
end)

return true
