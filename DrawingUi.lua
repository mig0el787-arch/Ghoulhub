local function txt(text, pos)
    local t = Drawing.new("Text")
    t.Text = text
    t.Size = 22
    t.Color = Color3.fromRGB(180,100,255)
    t.Position = pos
    t.Visible = true
    return t
end

local title = txt("☠ GHOUL HUB ☠", Vector2.new(200,150))
local btn1  = txt("[1] SPEED", Vector2.new(200,190))
local btn2  = txt("[2] JUMP", Vector2.new(200,220))
local btn3  = txt("[3] FECHAR", Vector2.new(200,250))

local UIS = game:GetService("UserInputService")
local plr = game.Players.LocalPlayer

UIS.InputBegan:Connect(function(i,gp)
    if gp then return end

    if i.KeyCode == Enum.KeyCode.One then
        plr.Character.Humanoid.WalkSpeed = 50
        print("Speed ON")
    elseif i.KeyCode == Enum.KeyCode.Two then
        plr.Character.Humanoid.JumpPower = 100
        print("Jump ON")
    elseif i.KeyCode == Enum.KeyCode.Three then
        title:Remove()
        btn1:Remove()
        btn2:Remove()
        btn3:Remove()
        print("Hub fechado")
    end
end)
