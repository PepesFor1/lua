local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "LoadingGui"
screenGui.ResetOnSpawn = false
screenGui.IgnoreGuiInset = true
screenGui.Parent = CoreGui

local label = Instance.new("TextLabel")
label.Size = UDim2.new(1, 0, 0, 50)
label.Position = UDim2.new(0, 0, 0, 20)
label.BackgroundTransparency = 1
label.Text = "Loading Script."
label.TextColor3 = Color3.fromRGB(255, 255, 255)
label.TextSize = 28
label.Font = Enum.Font.GothamBold
label.TextXAlignment = Enum.TextXAlignment.Center
label.Parent = screenGui

local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(0, 0, 0)
stroke.Thickness = 2
stroke.Parent = label

local dots = {".", "..", "..."}
local index = 1
local elapsed = 0

local connection
connection = RunService.Heartbeat:Connect(function(dt)
    elapsed += dt
    if elapsed >= 0.4 then
        elapsed = 0
        label.Text = "Loading Script" .. dots[index]
        index = index % #dots + 1
    end
end)

task.spawn(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/PepesFor1/lua/refs/heads/main/source.lua"))()
    connection:Disconnect()
    screenGui:Destroy()
end)
