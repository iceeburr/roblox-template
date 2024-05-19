--!native
--!optimize 2
--!strict

--// Local Variables \\--
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage.Packages

local Fusion = require(Packages.fusion)
local Components = ReplicatedStorage.Components
local Scope = Fusion.scoped(Fusion, {
    BasicComponent = require(Components.BasicComponent),
})

--// Code \\--
Scope:BasicComponent {}