
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
	if (Creeps.HasPrerequisites({"environment.days"})) then
		ticks = ticks + 1
		if (Time >= SunRise) then
			DayLighting()
			Time = 0
		elseif (Time == SunSet) then
			NightLighting()
		end

		Time = Time + 1

		AdjustLighting()
	end

	if (Creeps.HasPrerequisites({"environment.weather"})) then
			if (Utils.RandomInteger(1, 200) == 10) then
			local delay = Utils.RandomInteger(1, 10)
			Lighting.Flash("LightningStrike", delay)
			DoStrike()
			Trigger.AfterDelay(delay, function()
				Media.PlaySound("thunder" .. Utils.RandomInteger(1,6) .. ".aud")
			end)
		end
		if (Utils.RandomInteger(1, 200) == 10) then
			Media.PlaySound("thunder-ambient.aud")
		end
	end

	if (Creeps.HasPrerequisites({"environment.morecrates"})) then
		CrateTicks = CrateTicks+1
		if(CrateTicks > CrateTimer) then
			local i = 0
			local crateCount = Utils.RandomInteger(2, 5)
			while(i < crateCount) do
				local pickCrate = Utils.RandomInteger(1, 400)
				local chosenCrate;

				if(pickCrate < 212) then
					chosenCrate = Powerproxy1 end
				if(pickCrate > 212 and pickCrate < 351) then
					chosenCrate = Powerproxy2 end
				if(pickCrate > 351 and pickCrate < 399) then
					chosenCrate = Powerproxy3 end
				if(pickCrate == 400) then
					chosenCrate = Powerproxy4 end

				local lz = Map.RandomCell()
				chosenCrate.TargetParatroopers(Map.CenterOfCell(lz))
				i=i+1
			end
			CrateTicks = 0
			print("Paradropping "..crateCount.." extra crates...")
		end
	end
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

DoStrike = function()
	Reinforcements.Reinforce(Creeps, {"1tnk.lightning"}, {Map.RandomCell()}, 1)
end

SpawnWaterDerricks = function(amount)
	local i = 0;
	local attempts = 0;
	while (i < amount and attempts < 100) do
		NewCell = Map.RandomCell()
		if(Map.TerrainType(NewCell) == "Water") then
			Reinforcements.Reinforce(Neutral, {"japanoilderrick.cr"}, {NewCell}, 1)
			i = i+1;
		end
		attempts = attempts+1;
	end
	print("Placed "..i.." oil derricks after "..attempts.." attempts")
end

WorldLoaded = function()
	Neutral = Player.GetPlayer("Neutral")
	Creeps = Player.GetPlayer("Creeps")

	Powerproxy1 = Actor.Create("powerproxy.cratedrop1", false, { Owner = Neutral })
	Powerproxy2 = Actor.Create("powerproxy.cratedrop2", false, { Owner = Neutral })
	Powerproxy3 = Actor.Create("powerproxy.cratedrop3", false, { Owner = Neutral })
	Powerproxy4 = Actor.Create("powerproxy.cratedrop4", false, { Owner = Neutral })

	if (Creeps.HasPrerequisites({"environment.days"})) then
		Time = Utils.RandomInteger(0, SunRise)
		if (Time >= SunSet) then
			Lighting.Red = 0.75
			Lighting.Green = 0.85
			Lighting.Blue = 1.5
			Lighting.Ambient = 0.75
		end
	end
	if (not Creeps.HasPrerequisites({"techlevel.noboats"})) then
		SpawnWaterDerricks(12)
	end
end