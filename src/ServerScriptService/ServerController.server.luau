--!native
--!optimize 2
--!strict

--// Local Variables \\--
local Players = game:GetService("Players")

--// Code \\--
Players.PlayerAdded:Connect(function(Player: Player)
   print(`Player @{Player.Name} ({Player.UserId}) has joined the game.`)
end)
