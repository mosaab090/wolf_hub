-- boss.lua
local Shared = getgenv().RedzDreamConfig
local Utils = getgenv().Utils
local Boss = {}

function Boss:Init()
    task.spawn(function()
        while task.wait(0.5) do -- Bosses don't move fast, 0.5s is plenty
            if Shared.Boss.AutoKill then
                local targetName = Shared.Boss.Selected or "Dough King"
                local boss = nil
                
                -- Target the boss specifically
                for _, obj in pairs(workspace.Enemies:GetChildren()) do
                    if obj.Name == targetName and obj:FindFirstChild("Humanoid") and obj.Humanoid.Health > 0 then
                        boss = obj
                        break
                    end
                end
                
                if boss and boss:FindFirstChild("HumanoidRootPart") then
                    local bossRoot = boss.HumanoidRootPart
                    Utils:SafeTween(bossRoot.CFrame * CFrame.new(0, 10, 0))
                    
                    -- Simple auto-attack lock
                    if Shared.Farm.FastAttack then
                        Utils:ExecuteFastAttack()
                    end
                end
            end
        end
    end)
end

return Boss