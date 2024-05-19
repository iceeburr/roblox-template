--!native
--!optimize 2
--!strict

--// Local Variables \\--
local ReplicatedFirst = game:GetService("ReplicatedFirst")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Screen = require(ReplicatedFirst.Screen)

--// Code \\--
-- Remove the default loading screen and then replace it
local PlayerGUI: PlayerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
Screen.Parent = PlayerGUI
ReplicatedFirst:RemoveDefaultLoadingScreen()
