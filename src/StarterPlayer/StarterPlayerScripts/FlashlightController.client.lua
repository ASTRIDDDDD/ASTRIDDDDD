local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Config = require(ReplicatedStorage:WaitForChild("Config"))

local player = Players.LocalPlayer
local battery = Config.StartingBattery
local enabled = false

local function toggleFlashlight()
	enabled = not enabled
	print("[Flashlight]", enabled and "ON" or "OFF")
end

UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then
		return
	end

	if input.KeyCode == Enum.KeyCode.F then
		toggleFlashlight()
	end
end)

RunService.RenderStepped:Connect(function(dt)
	if not enabled then
		return
	end

	battery = math.max(0, battery - (Config.BatteryDrainPerSecond * dt))
	if battery <= 0 then
		enabled = false
		warn("[Flashlight] Battery depleted")
	end
end)

player.CharacterAdded:Connect(function()
	battery = Config.StartingBattery
	enabled = false
end)
