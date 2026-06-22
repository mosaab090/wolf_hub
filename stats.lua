-- stats.lua
local Shared = getgenv().RedzDreamConfig
local Stats = {}

function Stats:Spend(statName)
    local Remote = game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_")
    local Player = game:GetService("Players").LocalPlayer
    local Points = Player.Data.Points.Value
    
    if Points > 0 then
        Remote:InvokeServer("AddPoint", statName, Points)
    end
end

return Stats