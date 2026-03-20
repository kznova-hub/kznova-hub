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

-- RAYFIELD (встроенный)
local Rayfield = {}
do
    local Players = game:GetService("Players")
    local UIS = game:GetService("UserInputService")

    function Rayfield:CreateWindow(config)
        local gui = Instance.new("ScreenGui", game.CoreGui)
        gui.Name = "Rayfield"

        local main = Instance.new("Frame", gui)
        main.Size = UDim2.new(0,450,0,320)
        main.Position = UDim2.new(0.5,-225,0.5,-160)
        main.BackgroundColor3 = Color3.fromRGB(25,25,25)
        main.Active = true
        main.Draggable = true

        local title = Instance.new("TextLabel", main)
        title.Size = UDim2.new(1,0,0,40)
        title.Text = config.Name or "Window"
        title.BackgroundColor3 = Color3.fromRGB(40,40,40)
        title.TextColor3 = Color3.new(1,1,1)

        local tabs = {}
        local current

        function config:CreateTab(name)
            local btn = Instance.new("TextButton", main)
            btn.Size = UDim2.new(0,120,0,30)
            btn.Position = UDim2.new(0,#tabs*120,0,40)
            btn.Text = name
            btn.BackgroundColor3 = Color3.fromRGB(60,60,60)

            local content = Instance.new("Frame", main)
            content.Size = UDim2.new(1,0,1,-70)
            content.Position = UDim2.new(0,0,0,70)
            content.Visible = false

            btn.MouseButton1Click:Connect(function()
                for _,t in pairs(tabs) do
                    t.content.Visible = false
                end
                content.Visible = true
            end)

            table.insert(tabs,{button=btn,content=content})

            if not current then
                content.Visible = true
                current = content
            end

            local tab = {}

            function tab:CreateToggle(opt)
                local b = Instance.new("TextButton", content)
                b.Size = UDim2.new(1,-20,0,30)
                b.Position = UDim2.new(0,10,0,#content:GetChildren()*35)
                local state = opt.CurrentValue

                b.Text = opt.Name..": "..(state and "ON" or "OFF")
                b.BackgroundColor3 = Color3.fromRGB(70,70,70)
                b.TextColor3 = Color3.new(1,1,1)

                b.MouseButton1Click:Connect(function()
                    state = not state
                    b.Text = opt.Name..": "..(state and "ON" or "OFF")
                    opt.Callback(state)
                end)
            end

            function tab:CreateSlider(opt)
                local label = Instance.new("TextLabel", content)
                label.Size = UDim2.new(1,-20,0,20)
                label.Position = UDim2.new(0,10,0,#content:GetChildren()*35)
                label.TextColor3 = Color3.new(1,1,1)
                label.BackgroundTransparency = 1

                local bar = Instance.new("Frame", content)
                bar.Size = UDim2.new(1,-20,0,10)
                bar.Position = UDim2.new(0,10,0,label.Position.Y.Offset+20)
                bar.BackgroundColor3 = Color3.fromRGB(60,60,60)

                local fill = Instance.new("Frame", bar)
                fill.Size = UDim2.new(0.2,0,1,0)
                fill.BackgroundColor3 = Color3.fromRGB(0,170,255)

                local dragging = false

                local function update(x)
                    local pos = (x - bar.AbsolutePosition.X)/bar.AbsoluteSize.X
                    pos = math.clamp(pos,0,1)
                    fill.Size = UDim2.new(pos,0,1,0)
                    local val = math.floor(pos*(opt.Range[2]))
                    label.Text = opt.Name..": "..val
                    opt.Callback(val)
                end

                bar.InputBegan:Connect(function(i)
                    if i.UserInputType==Enum.UserInputType.MouseButton1 then
                        dragging = true
                        update(i.Position.X)
                    end
                end)

                bar.InputEnded:Connect(function(i)
                    if i.UserInputType==Enum.UserInputType.MouseButton1 then
                        dragging = false
                    end
                end)

                UIS.InputChanged:Connect(function(i)
                    if dragging and i.UserInputType==Enum.UserInputType.MouseMovement then
                        update(i.Position.X)
                    end
                end)
            end

            return tab
        end

        return config
    end
end

-- UI
local Window = Rayfield:CreateWindow({
    Name = "KZNOVA HUB"
})

local RaidTab = Window:CreateTab("Raid")

RaidTab:CreateToggle({
    Name = "Enable Raid",
    CurrentValue = false,
    Callback = function(v)
        getgenv().Settings["Raid Settings"].Enabled = v
    end
})

RaidTab:CreateSlider({
    Name = "Difficulty",
    Range = {0,25000},
    Callback = function(v)
        getgenv().Settings["Raid Settings"].Difficulty = v
    end
})

RaidTab:CreateToggle({
    Name = "Open Chest",
    CurrentValue = false,
    Callback = function(v)
        getgenv().Settings["Raid Settings"].OpenLeprechaunChest = v
    end
})

local BossTab = Window:CreateTab("Boss")

BossTab:CreateToggle({
    Name = "Enable Boss",
    CurrentValue = false,
    Callback = function(v)
        getgenv().Settings["Raid Settings"]["Boss Settings"].Enabled = v
    end
})

local EggTab = Window:CreateTab("Egg")

EggTab:CreateToggle({
    Name = "Enable Egg",
    CurrentValue = false,
    Callback = function(v)
        getgenv().Settings["Raid Settings"]["Egg Settings"].Enabled = v
    end
})

task.wait(1)
loadstring(game:HttpGet("https://raw.githubusercontent.com/tianhainrk/ps99/refs/heads/main/ps99.lua"))()
