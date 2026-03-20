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

-- GUI
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)

local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 250, 0, 150)
Frame.Position = UDim2.new(0.5,-125,0.5,-75)
Frame.BackgroundColor3 = Color3.fromRGB(30,30,30)

local Button = Instance.new("TextButton", Frame)
Button.Size = UDim2.new(1,0,0,40)
Button.Text = "START"

Button.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/tianhainrk/ps99/refs/heads/main/ps99.lua"))()
end)
