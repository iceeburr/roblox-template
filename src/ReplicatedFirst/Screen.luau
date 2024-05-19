--!native
--!optimize 2
--!strict

--// Code \\--
local BlackScreen = Instance.new("ScreenGui")
BlackScreen.IgnoreGuiInset = true
BlackScreen.ResetOnSpawn = false
BlackScreen.SafeAreaCompatibility = Enum.SafeAreaCompatibility.None
BlackScreen.ClipToDeviceSafeArea = false

local Frame = Instance.new("Frame")
Frame.Size = UDim2.fromScale(1, 1)
Frame.Parent = BlackScreen

return BlackScreen