-- Ghoul Hub UI (CoreGui fallback)
warn("UI CARREGOU")

local Players = game:GetService("Players")
local player = Players.LocalPlayer

local gui = Instance.new("ScreenGui")
gui.Name = "GhoulHub"
gui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 300, 0, 200)
frame.Position = UDim2.new(0.5, -150, 0.5, -100)
frame.BackgroundColor3 = Color3.fromRGB(20, 0, 30)

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 40)
title.BackgroundTransparency = 1
title.Text = "Ghoul Hub ☠️"
title.TextColor3 = Color3.fromRGB(180, 0, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 18
local CoreGui = game:GetService("CoreGui")

-- Remove UI antiga se existir
pcall(function()
    CoreGui:FindFirstChild("GhoulHub"):Destroy()
end)

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "GhoulHub"
ScreenGui.Parent = CoreGui

local Frame = Instance.new("Frame")
Frame.Parent = ScreenGui
Frame.Size = UDim2.new(0, 300, 0, 180)
Frame.Position = UDim2.new(0.5, -150, 0.5, -90)
Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Frame.BorderSizePixel = 0

local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 12)
Corner.Parent = Frame

local Text = Instance.new("TextLabel")
Text.Parent = Frame
Text.Size = UDim2.new(1, 0, 1, 0)
Text.BackgroundTransparency = 1
Text.Text = "GHoul Hub\nUI FUNCIONANDO"
Text.TextColor3 = Color3.fromRGB(180, 100, 255)
Text.Font = Enum.Font.GothamBold
Text.TextScaled = true
