--!native
--!optimize 2
--!strict

--// Services \\--
local ReplicatedFirst = game:GetService("ReplicatedFirst")
local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")

--// Local Variables \\--
local LocalPlayer = Players.LocalPlayer
local Screen = require(ReplicatedFirst.Screen)
local LightingEffects = ReplicatedFirst.LightingEffects

--// Code \\--
-- Remove the default loading screen and then replace it
local PlayerGUI: PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
Screen.Parent = PlayerGUI
ReplicatedFirst:RemoveDefaultLoadingScreen()

-- Add the default lighting effects
for _, Object in pairs(LightingEffects:GetDescendants()) do
   Object.Parent = Lighting
end
LightingEffects:Destroy()
