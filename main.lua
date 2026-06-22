-- main.lua
local Shared = loadstring(readfile("shared.lua"))()
local Utils = loadstring(readfile("utils.lua"))()

-- Now we can require other stuff
local Farm = loadstring(readfile("farm.lua"))()
-- etc...