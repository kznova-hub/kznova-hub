getgenv().Settings = {
    ["Raid Settings"] = {
        Enabled = true,
        Difficulty = 5000,
        ["Boss Settings"] = {
            Enabled = true,
        },
        ["Egg Settings"] = {
            Enabled = true,
            MinimumEggMulti = 500,
            MinimumLuckyCoins = "1m",
        },
    }
}

if game.CoreGui:FindFirstChild("KZNOVA_HUB") then
    game.CoreGui.KZNOVA_HUB:Destroy()
end

local Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Rayfield/main/source"))()

local Window = Rayfield:CreateWindow({
   Name = "KZNOVA HUB",
   LoadingTitle = "Loading KZNOVA HUB",
   ConfigurationSaving = {
       Enabled = true,
       FolderName = "KZNOVA_HUB"
   }
})

local RaidTab = Window:CreateTab("Raid")

RaidTab:CreateToggle({
   Name = "Enable Raid",
   CurrentValue = true,
   Callback = function(value)
       getgenv().Settings["Raid Settings"].Enabled = value
   end
})

RaidTab:CreateSlider({
   Name = "Difficulty",
   Range = {0,10000},
   Increment = 100,
   CurrentValue = 5000,
   Callback = function(value)
       getgenv().Settings["Raid Settings"].Difficulty = value
   end
})

local BossTab = Window:CreateTab("Boss")

BossTab:CreateToggle({
   Name = "Enable Boss",
   CurrentValue = true,
   Callback = function(value)
       getgenv().Settings["Raid Settings"]["Boss Settings"].Enabled = value
   end
})

local EggTab = Window:CreateTab("Egg")

EggTab:CreateSlider({
   Name = "Min Egg Multi",
   Range = {0,1000},
   Increment = 10,
   CurrentValue = 500,
   Callback = function(value)
       getgenv().Settings["Raid Settings"]["Egg Settings"].MinimumEggMulti = value
   end
})

EggTab:CreateInput({
   Name = "Lucky Coins (1m)",
   PlaceholderText = "1m",
   RemoveTextAfterFocusLost = false,
   Callback = function(text)
       getgenv().Settings["Raid Settings"]["Egg Settings"].MinimumLuckyCoins = text
   end
})

local MainTab = Window:CreateTab("Main")

MainTab:CreateButton({
   Name = "START SCRIPT",
   Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/tianhainrk/ps99/refs/heads/main/ps99.lua"))()
   end
})
