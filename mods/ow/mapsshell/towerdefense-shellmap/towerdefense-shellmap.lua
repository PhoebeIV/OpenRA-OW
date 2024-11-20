AttackerTypes = {"medipaladin","berserker","berserker","footman","footman","footman", "tecn", "tmedic"}

BindActorTriggers = function(a)
	if a.HasProperty("Hunt") then
		Trigger.OnIdle(a, function(a)
			if a.IsInWorld then
					a.Hunt()
			end
		end)
	end

	if a.HasProperty("HasPassengers") then
		Trigger.OnDamaged(a, function()
			if a.HasPassengers then
				a.Stop()
				a.UnloadPassengers()
			end
		end)
	end
end

BindActorTriggersTarget = function(a,t)
	if a.HasProperty("Hunt") then
		Trigger.OnIdle(a, function(a)
			if a.IsInWorld then
				a.AttackMove(t.Location)
				a.Destroy()
			end
		end)
	end

	if a.HasProperty("HasPassengers") then
		Trigger.OnDamaged(a, function()
			if a.HasPassengers then
				a.Stop()
				a.UnloadPassengers()
			end
		end)
	end
end

SendSoldiers = function(entryCell, unitTypes, interval, target)
	local units = Reinforcements.Reinforce(attacker, unitTypes, { entryCell }, interval)
	Utils.Do(units, function(unit)
		BindActorTriggersTarget(unit, target)
	end)
	Trigger.AfterDelay(DateTime.Seconds(5), function() SendSoldiers(entryCell, unitTypes, interval, target) end)
end

SetupAttackerUnits = function()
	Utils.Do(Map.NamedActors, function(a)
		if a.Owner == attacker and a.HasProperty("AcceptsCondition") then
			a.Stance = "Defend"
		end
	end)
end

SetupDefenderUnits = function()
	Utils.Do(Map.NamedActors, function(a)
		if a.Owner == defender and a.HasProperty("AcceptsCondition") then
			a.Stance = "Defend"
		end
	end)
end

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
speed = 3

Tick = function()
	ticks = ticks + 1

	local t = (ticks + 45) % (360 * speed) * (math.pi / 180) / speed;
	Camera.Position = viewportOrigin + WVec.New(8000 * math.sin(t), 10000 * math.cos(t), 0)

	if (Time >= SunRise) then
		DayLighting()
		Time = 0
	elseif (Time == SunSet) then
		NightLighting()
	end

	Time = Time + 1

	AdjustLighting()
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

WorldLoaded = function()
	defender = Player.GetPlayer("Defender")
	attacker = Player.GetPlayer("Attacker")
	viewportOrigin = Camera.Position

	Time = Utils.RandomInteger(0, SunRise)
	if (Time >= SunSet) then
		Lighting.Red = 0.75
		Lighting.Green = 0.85
		Lighting.Blue = 1.5
		Lighting.Ambient = 0.75
	end
	
	SetupAttackerUnits()
	SetupDefenderUnits()
	
	SendSoldiers(NorthEntrance1.Location, AttackerTypes, 5, SouthExit1)
	SendSoldiers(NorthEntrance2.Location, AttackerTypes, 5, SouthExit2)
end