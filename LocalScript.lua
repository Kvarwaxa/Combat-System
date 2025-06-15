local Players = game:GetService("Players")
local player = Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hum = char:WaitForChild("Humanoid")
local animator = hum:WaitForChild("Animator")
local tool = script.Parent
local remHit = game.ReplicatedStorage.Remotes.CombatHit

local punches = {}
for _, anim in ipairs(script.Parent.Animations:GetChildren()) do
    table.insert(punches, animator:LoadAnimation(anim))
end

local combo = 0
local debounce = false

tool.Activated:Connect(function()
    if debounce then return end
    debounce = true
    combo = combo % #punches + 1
    local animTrack = punches[combo]
    animTrack:Play()
    remHit:FireServer(combo)
    animTrack.Stopped:Connect(function() debounce = false end)
end)
