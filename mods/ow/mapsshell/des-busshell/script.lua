GLATypes = {"medipaladin","berserker","berserker","footman","footman","footman", "tecn", "tmedic"}
	ProducedUnitTypes =
{
	{ factory = WarFactory1, types = { "usacrusader", "usahumvee" } },
	{ factory = WarFactory2, types = { "usacrusader", "usahumvee" } },
}

BindActorTriggers = function(a)
	if a.HasProperty("Hunt") then
		Trigger.OnIdle(a, function(a)
			if a.IsInWorld then
				a.Move(BusWaypoint.Location)
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

SetupFactories = function()
	Utils.Do(ProducedUnitTypes, function(production)
		Trigger.OnProduction(production.factory, function(_, a) BindActorTriggers(a) end)
	end)
end

SendSoldiers = function(entryCell, unitTypes, interval, target)
	local units = Reinforcements.Reinforce(GLA, unitTypes, { entryCell }, interval)
	Utils.Do(units, function(unit)
		BindActorTriggersTarget(unit, target)
	end)
	Trigger.AfterDelay(DateTime.Seconds(5), function() SendSoldiers(entryCell, unitTypes, interval, target) end)
end

SetupGLAUnits = function()
	Utils.Do(Map.NamedActors, function(a)
		if a.Owner == GLA and a.HasProperty("AcceptsCondition") then
			a.GrantCondition("unkillable")
			a.Stance = "Defend"
		end
	end)
	Utils.Do(Map.NamedActors, function(a)
		if a.Owner == GLA and a.Type == "BGGYD.G" or a.Type == "BBUS.BOT" then
			Trigger.OnDamaged(a, function()
				if a.Owner == GLA then
					SetupGLAMove()
				end
			end)
		end
	end)
end

SetupGLAMove = function()
	TheBus.Move(BusWaypoint.Location)
	TheBuggy1.Move(BusWaypoint.Location)
	TheBuggy2.Move(BusWaypoint.Location)
end

SetupUSAUnits = function()
	Utils.Do(Map.NamedActors, function(a)
		if a.Owner == USA and a.HasProperty("AcceptsCondition") then
			a.Stance = "Defend"
		end
	end)
	Airfield.RallyPoint = AirfieldWaypoint.Location
end

ProduceUnits = function(t)
	local factory = t.factory
	if not factory.IsDead then
		local unitType = t.types[Utils.RandomInteger(1, #t.types + 1)]
		factory.Wait(50)
		factory.Produce(unitType)
	end
end

DoAttackOnGLA = function()
	local plane = Reinforcements.Reinforce(USA, {"usaraptor"} , { AttackVillageSpawn.Location })
	Utils.Do(plane, function(s)
		s.Attack(VillageTarget, true)
	end)

	Trigger.OnKilled(VillageTarget, function(a)
		Utils.Do(plane, function(s)
			s.Attack(VillageTarget, true)
		end)

		Trigger.OnEnteredProximityTrigger(AttackVillageSpawn.CenterPosition, WDist.New(1024 * 3), function(a, id)
			if a == plane then
				Trigger.RemoveProximityTrigger(id)
				a.Destroy()
			end
		end)
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

	Camera.Position = TheBus.CenterPosition;

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
	USA = Player.GetPlayer("USA")
	GLA = Player.GetPlayer("GLA")
	viewportOrigin = Camera.Position

	Time = Utils.RandomInteger(0, SunRise)
	if (Time >= SunSet) then
		Lighting.Red = 0.75
		Lighting.Green = 0.85
		Lighting.Blue = 1.5
		Lighting.Ambient = 0.75
	end
	
	SetupGLAUnits()
	SetupGLAMove()
	SetupUSAUnits()
	SetupFactories()
	
	-- SendSoldiers(NorthEntrance1.Location, GLATypes, 5, SouthExit1)
	-- SendSoldiers(NorthEntrance2.Location, GLATypes, 5, SouthExit2)

	Trigger.OnEnteredProximityTrigger(BusWaypoint.CenterPosition, WDist.New(1024 * 3), function(a, id)
		if a.Owner == GLA then
			TheBus.Teleport(BusWaypointStart.Location)
			TheBuggy1.Teleport(BuggySpot1.Location)
			TheBuggy2.Teleport(BuggySpot2.Location)
			SetupGLAMove()
		elseif a.Owner == USA then
			a.Teleport(BusWaypointStart.Location)
			a.AttackMove(BusWaypoint.Location)
		end
	end)

	Trigger.OnEnteredProximityTrigger(ProdPoint1.CenterPosition, WDist.New(1024 * 3), function(a, id)
		if a.Owner == GLA then
			Utils.Do(ProducedUnitTypes, ProduceUnits)
		end
	end)

	Trigger.OnEnteredProximityTrigger(ProdPoint2.CenterPosition, WDist.New(1024 * 3), function(a, id)
		if a.Owner == GLA then
			Utils.Do(ProducedUnitTypes, ProduceUnits)
		end
	end)

	Trigger.OnEnteredProximityTrigger(ProdPoint1.CenterPosition, WDist.New(1024 * 3), function(a, id)
		if a.Type == "BBUS.BOT" then
			Trigger.RemoveProximityTrigger(id)
			DoAttackOnGLA()
		end
	end)

end