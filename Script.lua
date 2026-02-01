game.Players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(function(character)
		local humanoid = character:WaitForChild("Humanoid")

		-- Configuración de inmortalidad
		humanoid.MaxHealth = 1e9
		humanoid.Health = humanoid.MaxHealth

		-- Evita cualquier daño
		humanoid.HealthChanged:Connect(function()
			if humanoid.Health < humanoid.MaxHealth then
				humanoid.Health = humanoid.MaxHealth
			end
		end)

		-- Evita muerte forzada
		humanoid.Died:Connect(function()
			humanoid.Health = humanoid.MaxHealth
		end)
	end)
end)
