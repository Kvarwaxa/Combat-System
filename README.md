# 🥊 Roblox Fist Fighting Combat System

A modular fist-fighting system for Roblox (R6/R15). Includes punch combos, server-side hit detection, and hit feedback.

## Features
- Punch combos cycling through 3 animations  
- Server raycast for hit detection & damage (default 10)  
- GUI popup ("HIT!") appears above hit location  
- Clean, beginner-friendly, customizable

## Setup
1. In `StarterPack`, add `FistTool` (Tool) with:
   - Handle (Part)
   - LocalScript
   - Animations folder with Punch1, Punch2, Punch3 (Animation objects)

2. In `ReplicatedStorage`, create `Remotes` folder with two RemoteEvents:
   - `CombatHit`
   - `CombatHitConfirm`

3. (Optional) Add `HitEffectGui` BillboardGui with TextLabel ("HIT!") inside `ReplicatedStorage`.

4. Add server script `CombatServer` in `ServerScriptService` with combat logic.

## How It Works
- Player activates punches cycling animations locally  
- Fires `CombatHit` event to server with combo index  
- Server raycasts 3 studs forward, applies damage if hit  
- Server fires `CombatHitConfirm` with hit position  
- Client shows popup GUI at hit position

## Customize
- Change damage by editing `TakeDamage` in server script  
- Replace animations in `Animations` folder  
- Adjust hit range in raycast length  
- Add sound or particles in GUI feedback

## Credits
Made by [YourName]. Open to improvements and contributions!
