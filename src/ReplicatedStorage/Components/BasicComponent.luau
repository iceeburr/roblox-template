--!native
--!optimize 2
--!strict

--// Local Variables \\--
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage.Packages
local Fusion = require(Packages.fusion)

local Peek = Fusion.peek
local Children = Fusion.Children
local Out = Fusion.Out
local OnEvent = Fusion.OnEvent
local OnChange = Fusion.OnChange
local Ref = Fusion.Ref

--// Code \\--
return function(
    OuterScope: Fusion.Scope<typeof(Fusion)>,
    Properties: {

    }): Fusion.Child
    local Scope = OuterScope:innerScope()

    return Scope:New "Frame" {

    }
end