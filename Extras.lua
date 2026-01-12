-- Ghoul Hub - Extras ☠️

local Extras = {}

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local Player = Players.LocalPlayer

local infJumpConn

function Extras.SetSpeed(value)
	local char = Player.Character
	if char and char:FindFirstChild("Humanoid") then
		char.Humanoid.WalkSpeed = value
	end
end

function Extras.SetJump(value)
	local char = Player.Character
	if char and char:FindFirstChild("Humanoid") then
		char.Humanoid.JumpPower = value
	end
end

function Extras.ToggleInfiniteJump()
	if infJumpConn then
		infJumpConn:Disconnect()
		infJumpConn = nil
		return
	end

	infJumpConn = UIS.JumpRequest:Connect(function()
		local char = Player.Character
		if char and char:FindFirstChild("Humanoid") then
			char.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
		end
	end)
end

return Extras
