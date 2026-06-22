-- teleport.lua
local Shared = getgenv().RedzDreamConfig
local Utils = getgenv().Utils
local Teleport = {}

-- Basic coordinate map (You can add more islands as you discover them)
local Islands = {
    ["Starter Island"] = CFrame.new(1063, 16, 1547),
    ["Jungle"] = CFrame.new(-1600, 36, 150),
    ["Desert"] = CFrame.new(895, 6, 4390),
    ["Snow Island"] = CFrame.new(1347, 105, -6738),
    ["Magma Village"] = CFrame.new(-5313, 11, 8515)
}

function Teleport:ToIsland(islandName)
    local targetCFrame = Islands[islandName]
    if targetCFrame then
        print("Teleporting to: " .. islandName)
        Utils:SafeTween(targetCFrame)
    else
        warn("Island not found: " .. islandName)
    end
end

return Teleport