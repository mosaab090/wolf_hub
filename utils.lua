-- utils.lua
local Utils = {}
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RootPart = Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")

-- Basic Tween movement so we don't get stuck
function Utils:SafeTween(targetCFrame)
    if not RootPart then return end
    local dist = (RootPart.Position - targetCFrame.Position).Magnitude
    local tween = TweenService:Create(RootPart, TweenInfo.new(dist / 280, Enum.EasingStyle.Linear), {CFrame = targetCFrame})
    tween:Play()
    tween.Completed:Wait()
end

-- Nearest mob scanner
function Utils:FindNearestMob()
    local nearest = nil
    local dist = math.huge
    for _, mob in pairs(workspace.Enemies:GetChildren()) do
        if mob:FindFirstChild("HumanoidRootPart") and mob:FindFirstChild("Humanoid") and mob.Humanoid.Health > 0 then
            local mag = (RootPart.Position - mob.HumanoidRootPart.Position).Magnitude
            if mag < dist then
                dist = mag
                nearest = mob
            end
        end
    end
    return nearest
end

-- Combat automation
function Utils:ExecuteFastAttack()
    local VirtualUser = game:GetService("VirtualUser")
    VirtualUser:CaptureController()
    VirtualUser:ClickButton1(Vector2.new(850, 450))
end

return Utils