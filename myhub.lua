repeat wait() until game:IsLoaded()

getgenv().Settings = {
    ["Raid Settings"] = {
        Enabled = false,
        Difficulty = 5000,
        OpenLeprechaunChest = false,
        ["Boss Settings"] = { Enabled = false },
        ["Egg Settings"] = { Enabled = false }
    }
}

-- Iron UI
local IronUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/Iron-UI-Library/main/Iron-UI.lua"))()

local Window = IronUI:CreateWindow({
    Title = "KZNOVA HUB",
    Size = UDim2.new(0, 400, 0, 300)
})

-- RAID TAB
local RaidTab = Window:AddTab("Raid")

RaidTab:AddToggle("Enable Raid", false, function(v)
    getgenv().Settings["Raid Settings"].Enabled = v
end)

RaidTab:AddSlider("Difficulty", 0, 25000, 5000, function(v)
    getgenv().Settings["Raid Settings"].Difficulty = v
end)

RaidTab:AddToggle("Open Chest", false, function(v)
    getgenv().Settings["Raid Settings"].OpenLeprechaunChest = v
end)

-- BOSS TAB
local BossTab = Window:AddTab("Boss")

BossTab:AddToggle("Enable Boss", false, function(v)
    getgenv().Settings["Raid Settings"]["Boss Settings"].Enabled = v
end)

-- EGG TAB
local EggTab = Window:AddTab("Egg")

EggTab:AddToggle("Enable Egg", false, function(v)
    getgenv().Settings["Raid Settings"]["Egg Settings"].Enabled = v
end)

-- запуск основного скрипта
task.wait(1)
loadstring(game:HttpGet("https://raw.githubusercontent.com/tianhainrk/ps99/refs/heads/main/ps99.lua"))()
