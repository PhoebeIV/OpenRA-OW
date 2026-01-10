
DayLighting = function()
	DaylightRed = 1.0
	DaylightGreen = 1.0
	DaylightBlue = 1.0
	DaylightAmbient = 1.0
end

NightLighting = function()
	DaylightRed = 0.75
	DaylightGreen = 0.85
	DaylightBlue = 1.5
	DaylightAmbient = 0.55
end

StormLighting = function()
	DaylightRed = 0.6
	DaylightGreen = 0.6
	DaylightBlue = 1.25
	DaylightAmbient = 0.55
end

AdjustLighting = function()
	if (Lighting.Red < DaylightRed + TargetRed) then
		Lighting.Red = Lighting.Red + 0.0001
	elseif (Lighting.Red > DaylightRed + TargetRed) then
		Lighting.Red = Lighting.Red - 0.0001
	end

	if (Lighting.Green < DaylightGreen + TargetGreen) then
		Lighting.Green = Lighting.Green + 0.0001
	elseif (Lighting.Green > DaylightGreen + TargetGreen) then
		Lighting.Green = Lighting.Green - 0.0001
	end

	if (Lighting.Blue < DaylightBlue + TargetBlue) then
		Lighting.Blue = Lighting.Blue + 0.0001
	elseif (Lighting.Blue > DaylightBlue + TargetBlue) then
		Lighting.Blue = Lighting.Blue - 0.0001
	end

	if (Lighting.Ambient < DaylightAmbient + TargetAmbient) then
		Lighting.Ambient = Lighting.Ambient + 0.0001
	elseif (Lighting.Ambient > DaylightAmbient + TargetAmbient) then
		Lighting.Ambient = Lighting.Ambient - 0.0001
	end
end

ticks = 0

Tick = function()
	if (Creeps.HasPrerequisites({"environment.days"}) and not Neutral.HasPrerequisites({"environment.weather"})) then
		ticks = ticks + 1
		if (Time >= SunRise) then
			DayLighting()
			Time = 0
		elseif (Time == SunSet) then
			NightLighting()
		end

		Time = Time + 1

		AdjustLighting()
	elseif (Neutral.HasPrerequisites({"environment.weather"})) then
		--[[
		ticks = ticks + 1
		if (Time >= SunRise) then
			StormLighting()
			Time = 0
		elseif (Time == SunSet) then
			StormLighting()
		end

		Time = Time + 1

		AdjustLighting()
		--]]
		Lighting.Red = 1.25
		Lighting.Green = 0.9
		Lighting.Blue = 0.7
		Lighting.Ambient = 0.55

	end

	if (Neutral.HasPrerequisites({"environment.weather"})) then
			if (Utils.RandomInteger(1, 300) < 10) then
			local delay = Utils.RandomInteger(1, 10)
			if (Utils.RandomInteger(1, 5) == 1) then Lighting.Flash("LightningStrike", delay) end
			DoStrike()
			Trigger.AfterDelay(delay+5, function()
				Media.PlaySound("thunder" .. Utils.RandomInteger(1,6) .. ".aud")
			end)
		end
		if (Utils.RandomInteger(1, 200) == 10) then
			Media.PlaySound("thunder-ambient.aud")
		end
	end

	if (Neutral.HasPrerequisites({"environment.weather2"})) then
			if (Utils.RandomInteger(1, 300) < 5) then
			local delay = Utils.RandomInteger(1, 10)
			if (Utils.RandomInteger(1, 5) == 1) then Lighting.Flash("LightningStrike", delay) end
			DoStrike()
			Trigger.AfterDelay(delay+5, function()
				Media.PlaySound("thunder" .. Utils.RandomInteger(1,6) .. ".aud")
			end)
		end
	end

	if (ExtraCrates) then
		CrateTicks = CrateTicks+1
		if(CrateTicks > CrateTimer) then
			local i = 0
			local crateCount = Utils.RandomInteger(MinExtraCrates, MaxExtraCrates)
			while(i < crateCount) do
				local pickCrate = Utils.RandomInteger(1, 404)
				local chosenCrate;

				if(pickCrate < 212) then
					chosenCrate = Powerproxy1
				elseif(pickCrate > 212 and pickCrate < 351) then
					chosenCrate = Powerproxy2
				elseif(pickCrate > 351 and pickCrate < 400) then
					chosenCrate = Powerproxy3
				else
					chosenCrate = Powerproxy4 end

				local lz = Map.RandomCell()
				chosenCrate.TargetParatroopers(Map.CenterOfCell(lz))
				i=i+1
			end
			CrateTicks = 0
			print("Paradropping "..crateCount.." extra crates...")
		end
	end

	if (Creeps.HasPrerequisites({"crate.paradrops"})) then
		CrateParadropTicks = CrateParadropTicks+1
		if(CrateParadropTicks > CrateParadropTimer) then
			local i = 0
			local dropCount = 10
			while(i < dropCount) do
				local pickCrate = Utils.RandomInteger(0, 125)
				local chosenCrate;

				if(pickCrate < 20) then
					chosenCrate = ProxyCreepPara8
				elseif(pickCrate > 20 and pickCrate < 40) then
					chosenCrate = ProxyCreepPara2
				elseif(pickCrate > 40 and pickCrate < 60) then
					chosenCrate = ProxyCreepPara3
				elseif(pickCrate > 60 and pickCrate < 80) then
					chosenCrate = ProxyCreepPara4
				elseif(pickCrate > 80 and pickCrate < 85) then
					chosenCrate = ProxyCreepPara5
				elseif(pickCrate > 85 and pickCrate < 105) then
					chosenCrate = ProxyCreepPara6
				elseif(pickCrate > 105 and pickCrate < 125) then
					chosenCrate = ProxyCreepPara7
				else
					chosenCrate = ProxyCreepPara1 end

				local lz = Map.RandomCell()
				chosenCrate.TargetParatroopers(Map.CenterOfCell(lz))
				i=i+1
			end
			CrateParadropTicks = 0
		end
	end

	if (Neutral.HasPrerequisites({"debug.listactors"})) then
		DebugTicks = DebugTicks+1
		if(DebugTicks == 7500) then
			GetActorList()
			DebugTicks = 0
		end
	end
end

GetActorList = function()
	local buildings = Utils.Where(Map.ActorsInWorld, function(b) return b.HasProperty("AcceptsCondition") and b.AcceptsCondition("DevActorList") end)

	Utils.Do(buildings, function(a)
		print(tostring(a))
	end)

	print(DateTime.GameTime / 25 .. " seconds elapsed")
end

Newnodes = 0;

ReplaceResourceNodes = function()
	local nodes = Utils.Where(Map.ActorsInWorld, function(b) return b.Type == "mine" or b.Type == "mine.cr" or b.Type == "gmine" or b.Type == "gmine.cr" or b.Type == "split3" or b.Type == "split4" or b.Type == "tmonolith" or b.Type == "tmonolith.blue" end)
	local i = 0

	Utils.Do(nodes, function(a)
		Newnodes = Newnodes + 1 + Utils.RandomInteger(0,2)
		i = i+1
		a.Destroy()
	end)

	print("Removed "..i.." resource nodes...")
	SpawnNewNodes()
end

SpawnNewNodes = function()
	local i = 0;

	while (i < Newnodes) do
		NewCell = Map.RandomCell()
		if(Map.TerrainType(NewCell) == "Clear" or Map.TerrainType(NewCell) == "Road") then
			Reinforcements.Reinforce(Neutral, {"1tnk.randommine"}, {NewCell}, 1)
			i = i+1;
		end
	end

	print("... and added "..i.." new nodes!")
end

DoStrike = function()
	Reinforcements.Reinforce(Creeps, {"1tnk.lightning"}, {Map.RandomCell()}, 1)
end

SpawnWaterDerricks = function(amount)
	local i = 0;
	local attempts = 0;

	while (i < amount) do
		NewCell = Map.RandomCell()
		if(Map.TerrainType(NewCell) == "Water") then
			Reinforcements.Reinforce(Neutral, {"japanoilderrick.cr"}, {NewCell}, 1)
			i = i+1;
		end
		attempts = attempts+1;
		if (attempts > 500) then
			i = amount;
		end
	end
	print("Placed "..i.." oil derricks after "..attempts.." attempts")
end

Time = 0

TargetRed = 0.0
TargetGreen = 0.0
TargetBlue = 0.0
TargetAmbient = 0.0

DaylightRed = 1.0
DaylightGreen = 1.0
DaylightBlue = 1.0
DaylightAmbient = 1.0

SunRise = 30000
SunSet = 15000

CrateTicks = 0
CrateTimer = 3000

DebugTicks = 7400

CrateParadropTicks = 0
CrateParadropTimer = 249


WorldLoaded = function()
	Neutral = Player.GetPlayer("Neutral")
	Creeps = Player.GetPlayer("Creeps")

	Powerproxy1 = Actor.Create("powerproxy.cratedrop1", false, { Owner = Neutral })
	Powerproxy2 = Actor.Create("powerproxy.cratedrop2", false, { Owner = Neutral })
	Powerproxy3 = Actor.Create("powerproxy.cratedrop3", false, { Owner = Neutral })
	Powerproxy4 = Actor.Create("powerproxy.cratedrop4", false, { Owner = Neutral })
	ProxyCreepPara1 = Actor.Create("powerproxy.creepdrop1", false, { Owner = Creeps })
	ProxyCreepPara2 = Actor.Create("powerproxy.creepdrop2", false, { Owner = Creeps })
	ProxyCreepPara3 = Actor.Create("powerproxy.creepdrop3", false, { Owner = Creeps })
	ProxyCreepPara4 = Actor.Create("powerproxy.creepdrop4", false, { Owner = Creeps })
	ProxyCreepPara5 = Actor.Create("powerproxy.creepdrop5", false, { Owner = Creeps })
	ProxyCreepPara6 = Actor.Create("powerproxy.creepdrop6", false, { Owner = Creeps })
	ProxyCreepPara7 = Actor.Create("powerproxy.creepdrop7", false, { Owner = Creeps })
	ProxyCreepPara8 = Actor.Create("powerproxy.creepdrop8", false, { Owner = Creeps })

	if (Creeps.HasPrerequisites({"environment.morecrates"})) then
		MinExtraCrates = 2
		MaxExtraCrates = 5
		ExtraCrates = true
	elseif (Creeps.HasPrerequisites({"environment.morecrates2"})) then
		MinExtraCrates = 6
		MaxExtraCrates = 10
		ExtraCrates = true
	elseif (Creeps.HasPrerequisites({"environment.morecrates3"})) then
		MinExtraCrates = 11
		MaxExtraCrates = 20
		ExtraCrates = true
	elseif (Creeps.HasPrerequisites({"environment.morecrates4"})) then
		MinExtraCrates = 20
		MaxExtraCrates = 30
		ExtraCrates = true
	end

	if (Creeps.HasPrerequisites({"environment.days"})) then
		Time = Utils.RandomInteger(0, SunRise)
		if (Time >= SunSet) then
			Lighting.Red = 0.75
			Lighting.Green = 0.85
			Lighting.Blue = 1.5
			Lighting.Ambient = 0.75
		end
	end

	local attempts = 200;
	local i = 0;
	local watercount = 0;

	if (not Creeps.HasPrerequisites({"techlevel.noboats"}) and not Neutral.HasPrerequisites({"japanoilderrick.cr"})) then
		while (i < attempts) do
			NewCell = Map.RandomCell()
			if(Map.TerrainType(NewCell) == "Water") then
				watercount = watercount + 1;
			end
			i = i + 1;
		end
		SpawnWaterDerricks(watercount / 5)
	elseif Neutral.HasPrerequisites({"japanoilderrick.cr"}) then print("Map already has oil derricks!")
	elseif Creeps.HasPrerequisites({"techlevel.noboats"}) then print("Boats are disabled!") end

	if Creeps.HasPrerequisites({"environment.newmines"}) then ReplaceResourceNodes() end
end