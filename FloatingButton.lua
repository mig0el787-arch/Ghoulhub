-- Ghoul Hub - Floating Button ☠️

local Button = {}

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local Player = Players.LocalPlayer

function Button.Create(toggleCallback)
	local gui = Instance.new("ScreenGui")
	gui.Name = "GhoulFloating"
	gui.Parent = Player:WaitForChild("PlayerGui")
	gui.ResetOnSpawn = false

	local btn = Instance.new("ImageButton", gui)
	btn.Size = UDim2.new(0, 60, 0, 60)
	btn.Position = UDim2.new(0, 40, 0.5, -30)
	btn.Image = "rbxassetid://74356605425526" -- FOTO DO GHOUL
	btn.BackgroundColor3 = Color3.fromRGB(120, 40, 180)
	btn.BorderSizePixel = 0
	btn.AutoButtonColor = false
	Instance.new("UICorner", btn).CornerRadius = UDim.new(1,0)

	-- Drag
	local dragging, dragStart, startPos

	btn.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = true
			dragStart = input.Position
			startPos = btn.Position
		end
	end)

	UIS.InputChanged:Connect(function(input)
		if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
			local delta = input.Position - dragStart
			btn.Position = UDim2.new(
				startPos.X.Scale,
				startPos.X.Offset + delta.X,
				startPos.Y.Scale,
				startPos.Y.Offset + delta.Y
			)
		end
	end)

	UIS.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = false
		end
	end)

	btn.MouseButton1Click:Connect(function()
		if toggleCallback then
			toggleCallback()
		end
	end)
end

return Button
