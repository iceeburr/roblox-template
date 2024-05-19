--!native
--!optimize 2
--!strict

--// Local Variables \\--
local Humanoid: Humanoid = script.Parent.Humanoid
local Settings = {
    FallingDown       = false,
    Ragdoll           = false,
    GettingUp         = false,
    Jumping           = true,
    Swimming          = false,
    Freefall          = true,
    Flying            = false,
    Landed            = true,
    Running           = true,
    RunningNoPhysics  = false,
    StrafingNoPhysics = false,
    Climbing          = false,
    Seated            = false,
    PlatformStanding  = false,
    Dead              = false,
    Physics           = false
}

--// Code \\--
for State, Value in pairs(Settings) do
    Humanoid:SetStateEnabled(State, Value)
end
