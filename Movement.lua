-- Ghoul Hub - Movement ☠️

local Movement = {}

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Player = Players.LocalPlayer

local flying = false
local flyConn
local noclip = false
local noclipConn

function Movement.ToggleFly()
	local char = Player.Character
	if not char then return end
	local hrp = char:FindFirstChild("HumanoidRootPart")
	if not hrp then return end

	flying = not flying

	if flying then
		local bv = Instance.new("BodyVelocity")
		bv.Name = "GhoulFly"
		bv.MaxForce = Vector3.new(1,1,1) * 1e5
		bv.Parent = hrp

		flyConn = RunService.RenderStepped:Connect(function()
			if not flying then return end
			bv.Velocity = workspace.CurrentCamera.CFrame.LookVector * 60
		end)
	else
		if flyConn then flyConn:Disconnect() end
		if hrp:FindFirstChild("GhoulFly") then
			hrp.GhoulFly:Destroy()
		end
	end
end

function Movement.ToggleNoclip()
	local char = Player.Character
	if not char then return end

	noclip = not noclip

	if noclip then
		noclipConn = RunService.Stepped:Connect(function()
			for _,v in pairs(char:GetDescendants()) do
				if v:IsA("BasePart") then
					v.CanCollide = false
				end
			end
		end)
	else
		if noclipConn then noclipConn:Disconnect() end
	end
end

return Movement
