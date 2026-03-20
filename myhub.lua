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

if game.CoreGui:FindFirstChild("Rayfield") then
    game.CoreGui.Rayfield:Destroy()
end

local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

local Window = Rayfield:CreateWindow({
   Name = "KZNOVA HUB",
   LoadingTitle = "KZNOVA HUB",
   LoadingSubtitle = "by you",
   ConfigurationSaving = {
      Enabled = false
   }
})

local Tab = Window:CreateTab("Main", 4483362458)

Tab:CreateToggle({
   Name = "Enable Raid",
   CurrentValue = true,
   Callback = function(Value)
       getgenv().Settings["Raid Settings"].Enabled = Value
   end,
})

Tab:CreateSlider({
   Name = "Difficulty",
   Range = {0, 10000},
   Increment = 100,
   CurrentValue = 5000,
   Callback = function(Value)
       getgenv().Settings["Raid Settings"].Difficulty = Value
   end,
})

Tab:CreateButton({
   Name = "Start Script",
   Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/tianhainrk/ps99/refs/heads/main/ps99.lua"))()
   end,
})
