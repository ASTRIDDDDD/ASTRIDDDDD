local TrailGenerator = {}

function TrailGenerator:GetCheckpoints(workspaceRef)
	local checkpoints = {}

	for _, instance in ipairs(workspaceRef:GetDescendants()) do
		if instance:IsA("BasePart") and instance.Name:match("^Checkpoint_%d+$") then
			table.insert(checkpoints, instance)
		end
	end

	table.sort(checkpoints, function(a, b)
		local aNum = tonumber(a.Name:match("%d+")) or 0
		local bNum = tonumber(b.Name:match("%d+")) or 0
		return aNum < bNum
	end)

	return checkpoints
end

function TrailGenerator:GetFinalZone(workspaceRef)
	return workspaceRef:FindFirstChild("LookoutGoal")
end

return TrailGenerator
