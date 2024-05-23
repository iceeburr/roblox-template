--!native
--!optimize 2
--!strict

--// Services \\--
local ReplicatedStorage = game:GetService("ReplicatedStorage")

--// Types \\--
local RobloxTypes = require(ReplicatedStorage.Utils.RobloxTypes)

--// Local Variables \\--
local HumanoidStates = require(ReplicatedStorage.Settings.HumanoidStates)
local Character: RobloxTypes.Character = script.Parent
local Humanoid = Character.Humanoid

--// Code \\--
-- Humanoid Optimizations
for State, Value in pairs(HumanoidStates) do
    Character.Humanoid:SetStateEnabled(State, Value)
end
