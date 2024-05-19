--!native
--!optimize 2
--!strict

--// Local Variables \\--
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage.Packages
local CustomPackages = Packages.Custom

local Fusion = require(CustomPackages.fusion)
local Components = ReplicatedStorage.Components
local Scope = Fusion.scoped(Fusion, {
    BasicComponent = require(Components.BasicComponent),
})

--// Code \\--
Scope:BasicComponent {}