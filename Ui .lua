-- Ghoul Hub UI

local Players = game:GetService("Players")
local Player = Players.LocalPlayer

-- Remove UI antiga se existir
pcall(function()
	Player.PlayerGui.GhoulHub:Destroy()
end)

-- ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "GhoulHub"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = Player:WaitForChild("PlayerGui")

-- Frame principal
local Main = Instance.new("Frame")
Main.Size = UDim2.new(0, 300, 0, 200)
Main.Position = UDim2.new(0.5, -150, 0.5, -100)
Main.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Main.BorderSizePixel = 0
Main.Parent = ScreenGui

-- Título
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundTransparency = 1
Title.Text = "Ghoul Hub ☠️"
Title.TextColor3 = Color3.new(1,1,1)
Title.TextScaled = true
Title.Font = Enum.Font.GothamBold
Title.Parent = Main

-- Botão teste
local Button = Instance.new("TextButton")
Button.Size = UDim2.new(0.8, 0, 0, 40)
Button.Position = UDim2.new(0.1, 0, 0.5, 0)
Button.Text = "TESTE"
Button.TextColor3 = Color3.new(1,1,1)
Button.BackgroundColor3 = Color3.fromRGB(40,40,40)
Button.Font = Enum.Font.Gotham
Button.TextScaled = true
Button.Parent = Main

Button.MouseButton1Click:Connect(function()
	print("Ghoul Hub funcionando")
end)
