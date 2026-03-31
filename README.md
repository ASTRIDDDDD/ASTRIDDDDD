# Roblox Horror Hiking Game Template

This is a lightweight template for a **Roblox horror game about hiking**. It gives you a gameplay loop, creepy ambience hooks, and script scaffolding you can expand in Roblox Studio.

## Core Loop

1. Spawn at trailhead cabin.
2. Hike through foggy trail checkpoints.
3. Keep your flashlight battery alive.
4. Survive random fear events (sounds, flickers, distant movement).
5. Reach fire lookout before dawn.

## Suggested Roblox Studio Hierarchy

- `ReplicatedStorage`
  - `Config` *(ModuleScript)*
  - `Modules/TrailGenerator` *(ModuleScript)*
- `ServerScriptService`
  - `GameManager` *(Script)*
- `StarterPlayer/StarterPlayerScripts`
  - `FlashlightController` *(LocalScript)*

## Building Steps

1. Create a map with:
   - **Trailhead Spawn**
   - **5–10 checkpoints** named `Checkpoint_1`, `Checkpoint_2`, etc.
   - **Safe cabin / lookout** as final zone
2. Add one `Part` named `FearZone` near the middle of the trail.
3. Paste the scripts from `src/` into matching Roblox Studio locations.
4. Play test with 1–4 players.

## Expand Ideas

- Add stamina and slipping on steep terrain.
- Replace placeholder scare effects with NPC creature sightings.
- Add multiple endings depending on optional clues found on the trail.
