--!native
--!optimize 2
--!strict

--// Local Variables \\--
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage.Packages
local CustomPackages = Packages.Custom
local Fusion = require(CustomPackages.fusion)
local FusionVersion = Fusion.version

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer.PlayerGui

local Peek = Fusion.peek
local Children = Fusion.Children
local Out = Fusion.Out
local OnEvent = Fusion.OnEvent
local OnChange = Fusion.OnChange
local Ref = Fusion.Ref
type UsedAs<T> = Fusion.UsedAs<T>

local Components = ReplicatedStorage.Components
local Scope = Fusion.scoped(Fusion, {
   BasicComponent = require(Components.BasicComponent),
})

--// Code \\--
task.wait(2)
local NewLoadingScreen = Scope:New("ScreenGui") {
   Parent = PlayerGui,
   IgnoreGuiInset = true,
   [Children] = {
      Scope:BasicComponent {
         Version = FusionVersion,
      },
   },
}
-- Take over the static loading screen
local OldLoadingScreen = PlayerGui:FindFirstChild("StaticLoadingScreen")
if OldLoadingScreen then
   OldLoadingScreen:Destroy()
end
task.wait(2)
Scope:doCleanup()
