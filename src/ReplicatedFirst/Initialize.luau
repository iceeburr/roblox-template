--!native
--!optimize 2
--!strict

--// Local Variables \\--
local ReplicatedFirst = game:GetService("ReplicatedFirst")
local Screen = require(ReplicatedFirst.Screen)

--// Code \\--
-- Remove the default loading screen and then replace it
local PlayerGUI: PlayerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
Screen.Parent = PlayerGUI
ReplicatedFirst:RemoveDefaultLoadingScreen()