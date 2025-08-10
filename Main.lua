-- DaggerSpawner.lua
-- A Roblox Lua script to spawn dagger-themed objects with a UI

-- Get the local player
local player = game.Players.LocalPlayer
local workspace = game.Workspace

-- Create a ScreenGui for the UI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "DaggerSpawnerGui"
screenGui.Parent = player.PlayerGui

-- Create a Frame for the UI
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 200)
frame.Position = UDim2.new(0.3, 0, 0.3, 0)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30) -- Dark theme
frame.BorderSizePixel = 0
frame.Parent = screenGui

-- Create a Title
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 30)
title.Position = UDim2.new(0, 0, 0, 0)
title.Text = "Dagger Spawner"
title.TextColor3 = Color3.fromRGB(200, 200, 200) -- Silver text for dagger theme
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextSize = 20
title.Parent = frame

-- Create a TextBox for dagger name input
local itemLabel = Instance.new("TextLabel")
itemLabel.Position = UDim2.new(0, 10, 0, 50)
itemLabel.Size = UDim2.new(0, 80, 0, 25)
itemLabel.Text = "Dagger Name:"
itemLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
itemLabel.BackgroundTransparency = 1
itemLabel.Font = Enum.Font.Gotham
itemLabel.TextSize = 14
itemLabel.TextXAlignment = Enum.TextXAlignment.Left
itemLabel.Parent = frame

local itemInput = Instance.new("TextBox")
itemInput.Position = UDim2.new(0, 100, 0, 50)
itemInput.Size = UDim2.new(0, 180, 0, 25)
itemInput.PlaceholderText = "Enter Dagger Name (e.g., ShadowBlade)"
itemInput.Text = ""
itemInput.Font = Enum.Font.Gotham
itemInput.TextSize = 14
itemInput.TextColor3 = Color3.fromRGB(200, 200, 200)
itemInput.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
itemInput.BorderSizePixel = 0
itemInput.Parent = frame

-- Create a Spawn Button
local spawnButton = Instance.new("TextButton")
spawnButton.Position = UDim2.new(0.3, 0, 0.7, 0)
spawnButton.Size = UDim2.new(0.4, 0, 0, 30)
spawnButton.Text = "Spawn Dagger"
spawnButton.Font = Enum.Font.GothamBold
spawnButton.TextSize = 16
spawnButton.TextColor3 = Color3.fromRGB(255, 255, 255)
spawnButton.BackgroundColor3 = Color3.fromRGB(100, 100, 150) -- Metallic blue
spawnButton.Parent = frame

-- Function to spawn a dagger-themed object
spawnButton.MouseButton1Click:Connect(function()
    local daggerName = itemInput.Text
    if daggerName == "" then
        warn("Please enter a dagger name!")
        return
    end

    -- Create a dagger-shaped part
    local dagger = Instance.new("Part")
    dagger.Name = daggerName
    dagger.Size = Vector3.new(0.2, 1.5, 0.4) -- Slim, blade-like shape
    dagger.Position = player.Character.HumanoidRootPart.Position + Vector3.new(0, 5, 0)
    dagger.BrickColor = BrickColor.new("Dark stone grey") -- Metallic dagger look
    dagger.Material = Enum.Material.Metal
    dagger.Anchored = false
    dagger.Parent = workspace

    -- Add a glowing effect to make it look special
    local pointLight = Instance.new("PointLight")
    pointLight.Color = Color3.fromRGB(100, 100, 255) -- Blue glow for dagger theme
    pointLight.Range = 8
    pointLight.Brightness = 1
    pointLight.Parent = dagger

    print("Spawned dagger: " .. daggerName)
end)

-- Create a Close Button
local closeButton = Instance.new("TextButton")
closeButton.Position = UDim2.new(0.3, 0, 0.85, 0)
closeButton.Size = UDim2.new(0.4, 0, 0, 30)
closeButton.Text = "Close"
closeButton.Font = Enum.Font.GothamBold
closeButton.TextSize = 16
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.BackgroundColor3 = Color3.fromRGB(150, 50, 50)
closeButton.Parent = frame

-- Close the UI when the button is clicked
closeButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)
