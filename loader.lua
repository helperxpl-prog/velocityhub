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

-- 🔥 YOUR MAIN SCRIPT HERE
local function run(loadstring(gamehttpGet:("https://raw.githubusercontent.com/helperxpl-prog/velocityhub/refs/heads/main/velocityhub")
    print("Key verified! Running script...")
    
    -- velocityhub
end

-- UI
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)

local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 300, 0, 200)
Frame.Position = UDim2.new(0.5, -150, 0.5, -100)

local TextBox = Instance.new("TextBox", Frame)
TextBox.Size = UDim2.new(1, -20, 0, 40)
TextBox.Position = UDim2.new(0, 10, 0, 20)
TextBox.PlaceholderText = "Enter Key..."

local Submit = Instance.new("TextButton", Frame)
Submit.Size = UDim2.new(1, -20, 0, 40)
Submit.Position = UDim2.new(0, 10, 0, 70)
Submit.Text = "Verify Key"

local GetKey = Instance.new("TextButton", Frame)
GetKey.Size = UDim2.new(1, -20, 0, 40)
GetKey.Position = UDim2.new(0, 10, 0, 120)
GetKey.Text = "Get Key"

-- Key check
local function isValidKey(inputKey)
    local success, response = pcall(function()
        return game:HttpGet(keyListURL)
    end)

    if not success then
        warn("Failed to fetch keys")
        return false
    end

    for key in string.gmatch(response, "[^\r\n]+") do
        if key == inputKey then
            return true
        end
    end

    return false
end

-- Verify button
Submit.MouseButton1Click:Connect(function()
    if isValidKey(TextBox.Text) then
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Success",
            Text = "Key is valid!",
            Duration = 5
        })

        run()

    else
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Error",
            Text = "Invalid key",
            Duration = 5
        })
    end
end)

-- Get Key button
GetKey.MouseButton1Click:Connect(function()
    local randomLink = links[math.random(1, #links)]

    if setclipboard then
        setclipboard(randomLink)
    end

    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Get Key",
        Text = "Link copied to clipboard!",
        Duration = 5
    })
end)
