--!native
--!optimize 2
--!strict

--// Code \\--
local BlackScreen = Instance.new("ScreenGui")
BlackScreen.Name = "StaticLoadingScreen"
BlackScreen.IgnoreGuiInset = true
BlackScreen.ResetOnSpawn = false
BlackScreen.SafeAreaCompatibility = Enum.SafeAreaCompatibility.None
BlackScreen.ClipToDeviceSafeArea = false

local Frame = Instance.new("Frame")
Frame.Size = UDim2.fromScale(1, 1)
Frame.BackgroundColor3 = Color3.fromRGB(80, 80, 80)

local TextLabel = Instance.new("TextLabel")
TextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
TextLabel.Position = UDim2.fromScale(0.5, 0.5)
TextLabel.Size = UDim2.fromScale(1, 0.15)
TextLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.Text = "Loading..."
TextLabel.TextScaled = true
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.Parent = Frame

Frame.Parent = BlackScreen
return BlackScreen