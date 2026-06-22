-- shared.lua
getgenv().RedzDreamConfig = {
    Farm = { 
        AutoFarm = false, 
        SelectedWeapon = "Melee", 
        Distance = 8, 
        FastAttack = false, 
        BringMob = false, 
        TweenSpeed = 280 
    },
    Boss = { AutoKill = false },
    ESP = { Player = false, Fruit = false, Chest = false },
    Stats = { AutoSpend = false },
    Misc = { AntiAfk = false, Noclip = false }
}

return getgenv().RedzDreamConfig