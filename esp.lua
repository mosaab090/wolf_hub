-- esp.lua
local Shared = getgenv().RedzDreamConfig
local ESP = {}

-- Local cache to avoid object creation spam
local Cache = { Players = {}, Chests = {} }

function ESP:Toggle(enabled, parent, labelText, color)
    if not enabled then
        if parent:FindFirstChild("RedzESP") then parent.RedzESP:Destroy() end
        return
    end

    if not parent:FindFirstChild("RedzESP") then
        local billboard = Instance.new("BillboardGui", parent)
        billboard.Name = "RedzESP"
        billboard.Size = UDim2.new(0, 100, 0, 50)
        billboard.AlwaysOnTop = true
        
        local label = Instance.new("TextLabel", billboard)
        label.Size = UDim2.new(1, 0, 1, 0)
        label.BackgroundTransparency = 1
        label.Text = labelText
        label.TextColor3 = color
        label.Font = Enum.Font.GothamBold
        label.TextSize = 12
        label.TextStrokeTransparency = 0
    end
end

function ESP:Update()
    task.spawn(function()
        while task.wait(0.5) do -- Only update 2x per second to save CPU
            -- Player ESP
            for _, player in pairs(game.Players:GetPlayers()) do
                if player ~= game.Players.LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                    self:Toggle(Shared.ESP.Player, player.Character.HumanoidRootPart, player.Name, Color3.fromRGB(255, 0, 0))
                end
            end
            
            -- Chest ESP
            for _, obj in pairs(workspace:GetChildren()) do
                if Shared.ESP.Chest and obj:IsA("Model") and obj.Name:find("Chest") then
                    self:Toggle(true, obj:FindFirstChild("HumanoidRootPart") or obj:FindFirstChildWhichIsA("BasePart"), "Chest", Color3.fromRGB(255, 255, 0))
                end
            end
        end
    end)
end

return ESP