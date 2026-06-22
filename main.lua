-- main.lua - THE ENGINE LOADER
-- Target Repo: mosaab090/wolf_hub

local BaseUrl = "https://raw.githubusercontent.com/mosaab090/wolf_hub/main/"

-- 1. Load Core Assets
getgenv().RedzDreamConfig = loadstring(game:HttpGet(BaseUrl .. "shared.lua"))()
getgenv().Utils = loadstring(game:HttpGet(BaseUrl .. "utils.lua"))()

-- 2. Load Modules
local Farm = loadstring(game:HttpGet(BaseUrl .. "farm.lua"))()
local Boss = loadstring(game:HttpGet(BaseUrl .. "boss.lua"))()
local ESP = loadstring(game:HttpGet(BaseUrl .. "esp.lua"))()
local Teleport = loadstring(game:HttpGet(BaseUrl .. "teleport.lua"))()
local Stats = loadstring(game:HttpGet(BaseUrl .. "stats.lua"))()
local Misc = loadstring(game:HttpGet(BaseUrl .. "misc.lua"))()
local UI = loadstring(game:HttpGet(BaseUrl .. "ui.lua"))()

-- 3. Bootstrap the Environment
print("--- Wolf Hub: Syncing Modules from GitHub ---")

-- Initialize Systems
Farm:Init()
Boss:Init()
ESP:Update()
Misc:AntiAfk()
UI:Create()

print("--- Wolf Hub: Production Build Live! ---")
