local HttpService = game:GetService("HttpService")

local keyListURL = "https://pastebin.com/raw/dvdee62M"

-- Your monetized links
local links = {
    "https://lootdest.org/s?T1PaoWys",
    "https://loot-link.com/s?q7MKjQAE",
    "https://lootdest.org/s?bS9FOP1g",
    "https://loot-link.com/s?mQwLoiHc",
    "https://lootdest.org/s?MFAPzMYD"
}

-- 🔥 FIXED RUN FUNCTION
local function run()
    print("Key verified! Running script...")
    -- We use loadstring and game:HttpGet separately
    local success, err = pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/helperxpl-prog/velocityhub/refs/heads/main/velocityhub"))()
    end)
    
    if not success then
        warn("Failed to load the main script: " .. tostring(err))
    end
end

-- UI Setup (CoreGui is fine for client-side executors)
local ScreenGui = Instance.new("ScreenGui")
-- Check if we can protect the UI
if gethui then
    ScreenGui.Parent = gethui()
elseif syn and syn.protect_gui then
    syn.protect_gui(ScreenGui)
    ScreenGui.Parent = game.CoreGui
else
    ScreenGui.Parent = game.CoreGui
end

local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 300, 0, 200)
Frame.Position = UDim2.new(0.5, -150, 0.5, -100)
Frame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)

local TextBox = Instance.new("TextBox", Frame)
TextBox.Size = UDim2.new(1, -20, 0, 40)
TextBox.Position = UDim2.new(0, 10, 0, 20)
TextBox.PlaceholderText = "Enter Key..."
TextBox.Text = ""

local Submit = Instance.new("TextButton", Frame)
Submit.Size = UDim2.new(1, -20, 0, 40)
Submit.Position = UDim2.new(0, 10, 0, 70)
Submit.Text = "Verify Key"

local GetKey = Instance.new("TextButton", Frame)
GetKey.Size = UDim2.new(1, -20, 0, 40)
GetKey.Position = UDim2.new(0, 10, 0, 120)
GetKey.Text = "Get Key"

-- Key check logic
local function isValidKey(inputKey)
    local success, response = pcall(function()
        return game:HttpGet(keyListURL)
    end)

    if not success then
        warn("Failed to fetch keys")
        return false
    end

    for key in string.gmatch(response, "[^\r\n]+") do
        if key:gsub("%s+", "") == inputKey:gsub("%s+", "") then -- Removes accidental spaces
            return true
        end
    end

    return false
end

-- Button Connections
Submit.MouseButton1Click:Connect(function()
    if isValidKey(TextBox.Text) then
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Success",
            Text = "Key is valid!",
            Duration = 5
        })
        ScreenGui:Destroy() -- Removes the key system UI once verified
        run()
    else
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Error",
            Text = "Invalid key",
            Duration = 5
        })
    end
end)

GetKey.MouseButton1Click:Connect(function()
    local randomLink = links[math.random(1, #links)]
    if setclipboard then
        setclipboard(randomLink)
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Get Key",
            Text = "Link copied to clipboard!",
            Duration = 5
        })
    else
        TextBox.Text = randomLink -- Fallback if executor doesn't have setclipboard
    end
end)
