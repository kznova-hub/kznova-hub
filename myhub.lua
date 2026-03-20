repeat wait() until game:IsLoaded()

local success, err = pcall(function()

getgenv().Settings = {
    ["Raid Settings"] = {
        Enabled = true,
        Difficulty = 5000
    }
}

local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

local Window = Rayfield:CreateWindow({
   Name = "KZNOVA HUB",
   LoadingTitle = "KZNOVA HUB",
   LoadingSubtitle = "Loading...",
   ConfigurationSaving = {
      Enabled = false
   }
})

local Tab = Window:CreateTab("Main")

Tab:CreateButton({
   Name = "Start Script",
   Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/tianhainrk/ps99/refs/heads/main/ps99.lua"))()
   end,
})

end)

if not success then
    warn(err)
end
