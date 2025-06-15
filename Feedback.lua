local confirm = game.ReplicatedStorage.Remotes.CombatHitConfirm
local guiTemplate = game.ReplicatedStorage:WaitForChild("HitEffectGui")

confirm.OnClientEvent:Connect(function(pos)
    local guiClone = guiTemplate:Clone()
    
    local part = Instance.new("Part")
    part.Anchored = true
    part.CanCollide = false
    part.Transparency = 1
    part.Position = pos + Vector3.new(math.random(-1,1), 3, math.random(-1,1))
    part.Size = Vector3.new(1,1,1)
    part.Parent = workspace

    guiClone.Parent = part

    game:GetService("Debris"):AddItem(part, 1.5)
end)
