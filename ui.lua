-- ui.lua
local Shared = getgenv().RedzDreamConfig
local UI = {}

function UI:Create()
    local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
    local MainFrame = Instance.new("Frame", ScreenGui)
    
    -- Basic Frame Setup
    MainFrame.Size = UDim2.new(0, 200, 0, 150)
    MainFrame.Position = UDim2.new(0.5, -100, 0.5, -75)
    MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    MainFrame.Draggable = true
    MainFrame.Active = true

    -- Toggle Example: AutoFarm
    local FarmBtn = Instance.new("TextButton", MainFrame)
    FarmBtn.Size = UDim2.new(0, 180, 0, 40)
    FarmBtn.Position = UDim2.new(0, 10, 0, 10)
    FarmBtn.Text = "Toggle AutoFarm"
    FarmBtn.MouseButton1Click:Connect(function()
        Shared.Farm.AutoFarm = not Shared.Farm.AutoFarm
        FarmBtn.BackgroundColor3 = Shared.Farm.AutoFarm and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(200, 0, 0)
    end)

    -- Toggle Example: FastAttack
    local AttackBtn = Instance.new("TextButton", MainFrame)
    AttackBtn.Size = UDim2.new(0, 180, 0, 40)
    AttackBtn.Position = UDim2.new(0, 10, 0, 60)
    AttackBtn.Text = "Toggle FastAttack"
    AttackBtn.MouseButton1Click:Connect(function()
        Shared.Farm.FastAttack = not Shared.Farm.FastAttack
        AttackBtn.BackgroundColor3 = Shared.Farm.FastAttack and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(200, 0, 0)
    end)
    
    return ScreenGui
end

return UI