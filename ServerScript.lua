local remHit = game.ReplicatedStorage.Remotes.CombatHit
local confirm = game.ReplicatedStorage.Remotes.CombatHitConfirm

remHit.OnServerEvent:Connect(function(player, comboIndex)
    local char = player.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    local ray = Ray.new(hrp.CFrame.p, hrp.CFrame.LookVector * 3)
    local hit, pos = workspace:FindPartOnRay(ray, char)
    if hit and hit.Parent then
        local targetHum = hit.Parent:FindFirstChild("Humanoid")
        if targetHum and targetHum.Health > 0 then
            targetHum:TakeDamage(10)
            confirm:FireClient(player, pos)
        end
    end
end)
