-- misc.lua
local Shared = getgenv().RedzDreamConfig
local Misc = {}

-- Stop the game from kicking you for idling
function Misc:AntiAfk()
    local VirtualUser = game:GetService("VirtualUser")
    game:GetService("Players").LocalPlayer.Idled:Connect(function()
        VirtualUser:CaptureController()
        VirtualUser:ClickButton1(Vector2.new(0,0))
    end)
    print("Anti-AFK Active!")
end

-- Noclip to unstick yourself
function Misc:ToggleNoclip(enabled)
    local Char = game:GetService("Players").LocalPlayer.Character
    if Char then
        for _, part in pairs(Char:GetChildren()) do
            if part:IsA("BasePart") then part.CanCollide = not enabled end
        end
    end
end

return Misc