-- farm.lua
local Shared = getgenv().RedzDreamConfig
local Utils = getgenv().Utils
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local Farm = {}

function Farm:Init()
    task.spawn(function()
        print("Farm Module Initialized!") -- Keeping it clean for debugging
        
        while task.wait(0.1) do
            -- Only run if the user toggled it in the UI
            if Shared.Farm.AutoFarm then
                local character = LocalPlayer.Character
                if not character then continue end
                
                local targetMob = Utils:FindNearestMob()
                
                if targetMob then
                    local mobRoot = targetMob.HumanoidRootPart
                    
                    -- Haki check (don't waste server requests)
                    if not character:FindFirstChild("HasBuso") then 
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso") 
                    end
                    
                    -- Movement & Combat
                    local attackPos = mobRoot.CFrame * CFrame.new(0, Shared.Farm.Distance, -Shared.Farm.Distance)
                    Utils:SafeTween(attackPos)
                    
                    if Shared.Farm.FastAttack then
                        Utils:ExecuteFastAttack()
                    end
                end
            end
        end
    end)
end

return Farm