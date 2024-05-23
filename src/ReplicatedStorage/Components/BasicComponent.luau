--!native
--!optimize 2
--!strict

--// Local Variables \\--
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage.Packages
local CustomPackages = Packages.Custom
local Fusion = require(CustomPackages.fusion)

local Peek = Fusion.peek
local Children = Fusion.Children
local Out = Fusion.Out
local OnEvent = Fusion.OnEvent
local OnChange = Fusion.OnChange
local Ref = Fusion.Ref
type UsedAs<T> = Fusion.UsedAs<T>

--// Code \\--
return function(
    OuterScope: Fusion.Scope<typeof(Fusion)>,
    Properties: {
        Version: any
    }): Fusion.Child
    local Scope = OuterScope:innerScope()

    local IsHovering = Scope:Value(false)

    return Scope:New "Frame" {
        Name = "Basic Component",
        Size = UDim2.fromScale(1, 1),
        BackgroundColor3 = Color3.fromRGB(80, 0, 0),

        [Children] = {
            Scope:New "TextLabel" {
                Name = "FusionVersion",
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.fromScale(1, 0.15),
                BackgroundColor3 = Color3.fromRGB(0, 0, 0),
                Text = Scope:Computed(function(Use, _) return `Fusion running on version {Properties.Version.minor}{Properties.Version.isRelease and "-prerelease" or ""}` end),
                TextScaled = true,
                TextColor3 = Color3.fromRGB(255, 255, 255)
            }
        }
    }
end