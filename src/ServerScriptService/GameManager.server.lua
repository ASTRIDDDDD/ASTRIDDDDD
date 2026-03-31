local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

local Config = require(ReplicatedStorage:WaitForChild("Config"))
local TrailGenerator = require(ReplicatedStorage.Modules:WaitForChild("TrailGenerator"))

local state = {
	RoundActive = false,
	RoundStartTime = 0,
	Checkpoints = {},
}

local function setNightAtmosphere()
	Lighting.ClockTime = Config.NightStartClockTime
	Lighting.FogEnd = 100
	Lighting.FogStart = 10
	Lighting.Brightness = 1
	Lighting.Ambient = Color3.fromRGB(15, 20, 30)
end

local function startRound()
	state.RoundActive = true
	state.RoundStartTime = os.clock()
	state.Checkpoints = TrailGenerator:GetCheckpoints(workspace)

	setNightAtmosphere()
	print("[GameManager] Round started on", Config.TrailName)
end

local function endRound(reason)
	state.RoundActive = false
	print("[GameManager] Round ended:", reason)
end

local function triggerFearEvent(player)
	-- Template scare: replace with jumpscare UI, distant NPC, or audio cues.
	print("[FearEvent] Something moved in the trees near", player.Name)
end

local fearTimer = 0

RunService.Heartbeat:Connect(function(dt)
	if not state.RoundActive then
		return
	end

	fearTimer -= dt
	if fearTimer <= 0 then
		local allPlayers = Players:GetPlayers()
		if #allPlayers > 0 then
			local target = allPlayers[math.random(1, #allPlayers)]
			triggerFearEvent(target)
		end
		fearTimer = math.random(Config.FearEventMinDelay, Config.FearEventMaxDelay)
	end

	local elapsed = os.clock() - state.RoundStartTime
	if elapsed >= Config.RoundDuration then
		endRound("Dawn arrived")
	end
end)

Players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(function()
		if not state.RoundActive then
			startRound()
			fearTimer = math.random(Config.FearEventMinDelay, Config.FearEventMaxDelay)
		end
	end)
end)
