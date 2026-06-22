-- main.lua - DEBUGGER VERSION
local BaseUrl = "https://raw.githubusercontent.com/mosaab090/wolf_hub/main/"
local modules = {"shared", "utils", "farm", "boss", "esp", "teleport", "stats", "misc", "ui"}

print("--- Wolf Hub: Starting Sync ---")

local function safeLoad(name)
    local url = BaseUrl .. name .. ".lua"
    local success, result = pcall(function()
        return loadstring(game:HttpGet(url))()
    end)
    
    if not success then
        warn("FAILED TO LOAD: " .. name .. ".lua")
        warn("Error: " .. tostring(result))
        return nil
    else
        print("Successfully loaded: " .. name)
        return result
    end
end

-- Load everything
getgenv().RedzDreamConfig = safeLoad("shared")
getgenv().Utils = safeLoad("utils")

local Farm = safeLoad("farm")
local Boss = safeLoad("boss")
local ESP = safeLoad("esp")
local Teleport = safeLoad("teleport")
local Stats = safeLoad("stats")
local Misc = safeLoad("misc")
local UI = safeLoad("ui")

print("--- Wolf Hub: Load Sequence Complete ---")
