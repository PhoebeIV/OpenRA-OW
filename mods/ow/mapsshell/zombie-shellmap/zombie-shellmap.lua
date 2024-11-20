AlliedInfantryTypes = {"e1","e1","e1","e1","e1"}
AlliedVehicleTypes = {"jeep","apc"}
GDIInfantryTypes = {"e1.d","e1.d","e1.d","e1.d"}
GDIVehicleTypes = {"jeepd","apc.g"}
ZombieTypes = {"zombie","zombie","zombie","zombie"}

ProxyType = "powerproxy.paratroopers"

ProducedUnitTypes =
{
	{ factory = AlliedBarracks, types = { "e1", "e3" } },
	{ factory = GDIBarracks, types = { "e1", "e2" } },
	{ factory = AlliedWarFactory, types = { "jeep", "apc" } },
	{ factory = GDIWarFactory, types = { "jeepd", "apc.g" } }
}

ShipUnitTypes = { "e1", "e1", "e1", "e1", "e1", "e1" }
HelicopterUnitTypes = { "e1.d", "e1.d", "e1.d", "e2" };

ParadropWaypoints = { ParadropPoint1, ParadropPoint2, ParadropPoint3, ParadropPoint4, ParadropPoint5, ParadropPoint6, ParadropPoint7, ParadropPoint8, ParadropPoint9, ParadropPoint10, ParadropPoint11, ParadropPoint12, ParadropPoint13 }

WestWaterWaypoints = { SouthWestWater1, SouthWestWater2, SouthWestWater3 }
EastWaterWaypoints = { SouthEastWater1, SouthEastWater2, SouthEastWater3 }
WestBeachWaypoints = { WestBeachLanding1, WestBeachLanding2, WestBeachLanding3 }
EastBeachWaypoints = { EastBeachLanding1, EastBeachLanding2, EastBeachLanding3 }

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

SendAlliedUnits = function(entryCell, unitTypes, interval)
	local units = Reinforcements.Reinforce(allies, unitTypes, { entryCell }, interval)
	Utils.Do(units, function(unit)
		BindActorTriggers(unit)
	end)
	Trigger.OnAllKilled(units, function() SendAlliedUnits(entryCell, unitTypes, interval) end)
end

SendAlliedUnitsTarget = function(entryCell, unitTypes, interval, target)
	local units = Reinforcements.Reinforce(allies, unitTypes, { entryCell }, interval)
	Utils.Do(units, function(unit)
		BindActorTriggersTarget(unit, target)
	end)
	Trigger.OnAllKilled(units, function() SendAlliedUnitsTarget(entryCell, unitTypes, interval, target) end)
end

SendGDIUnits = function(entryCell, unitTypes, interval)
	local units = Reinforcements.Reinforce(gdi, unitTypes, { entryCell }, interval)
	Utils.Do(units, function(unit)
		BindActorTriggers(unit)
	end)
	Trigger.OnAllKilled(units, function() SendGDIUnits(entryCell, unitTypes, interval, target) end)
end

SendGDIUnitsTarget = function(entryCell, unitTypes, interval, target)
	local units = Reinforcements.Reinforce(gdi, unitTypes, { entryCell }, interval)
	Utils.Do(units, function(unit)
		BindActorTriggersTarget(unit, target)
	end)
	Trigger.OnAllKilled(units, function() SendGDIUnitsTarget(entryCell, unitTypes, interval, target) end)
end

SendZombies = function(entryCell, unitTypes, interval)
	local units = Reinforcements.Reinforce(zombies, unitTypes, { entryCell }, interval)
	Utils.Do(units, function(unit)
		BindActorTriggers(unit)
	end)
	Trigger.OnAllKilled(units, function() SendZombies(entryCell, unitTypes, interval) end)
end

SendZombiesTarget = function(entryCell, unitTypes, interval, target)
	local units = Reinforcements.Reinforce(zombies, unitTypes, { entryCell }, interval)
	Utils.Do(units, function(unit)
		BindActorTriggersTarget(unit, target)
	end)
	Trigger.OnAllKilled(units, function() SendZombiesTarget(entryCell, unitTypes, interval, target) end)
end

ShipAlliedUnitsWest = function()
	local entry = Utils.Random(WestWaterWaypoints)
	local lz = Utils.Random(WestBeachWaypoints)
	local units = Reinforcements.ReinforceWithTransport(allies, "lst",
		ShipUnitTypes, { entry.Location, lz.Location }, { entry.Location })[2]

	Utils.Do(units, function(unit)
		BindActorTriggers(unit)
	end)

	Trigger.AfterDelay(DateTime.Seconds(60), ShipAlliedUnitsWest)
end

ShipAlliedUnitsEast = function()
	local entry = Utils.Random(EastWaterWaypoints)
	local lz = Utils.Random(EastBeachWaypoints)
	local units = Reinforcements.ReinforceWithTransport(allies, "lst",
		ShipUnitTypes, { entry.Location, lz.Location }, { entry.Location })[2]

	Utils.Do(units, function(unit)
		BindActorTriggers(unit)
	end)

	Trigger.AfterDelay(DateTime.Seconds(60), ShipAlliedUnitsEast)
end

InsertGDIChinookReinforcements = function(entry, hpad)
	local units = Reinforcements.ReinforceWithTransport(gdi, "tran",
		HelicopterUnitTypes, { entry.Location, hpad.Location + CVec.New(1, 2) }, { entry.Location })[2]

	Utils.Do(units, function(unit)
		BindActorTriggers(unit)
	end)

	Trigger.AfterDelay(DateTime.Seconds(60), function() InsertGDIChinookReinforcements(entry, hpad) end)
end

ParadropGDIUnits = function()
	local lz = Utils.Random(ParadropWaypoints)
	local aircraft = powerproxy.TargetParatroopers(lz.CenterPosition)

	Utils.Do(aircraft, function(a)
		Trigger.OnPassengerExited(a, function(t, p)
			BindActorTriggers(p)
		end)
	end)
	Trigger.AfterDelay(DateTime.Seconds(10), ParadropGDIUnits)
end

ProduceUnits = function(t)
	local factory = t.factory
	if not factory.IsDead then
		local unitType = t.types[Utils.RandomInteger(1, #t.types + 1)]
		factory.Wait(Actor.BuildTime(unitType))
		factory.Produce(unitType)
		factory.CallFunc(function() ProduceUnits(t) end)
	end
end

SetupAlliedUnits = function()
	Utils.Do(Map.NamedActors, function(a)
		if a.Owner == allies and a.HasProperty("AcceptsCondition") then
			a.Stance = "Defend"
		end
	end)
end

SetupGDIUnits = function()
	Utils.Do(Map.NamedActors, function(a)
		if a.Owner == gdi and a.HasProperty("AcceptsCondition") then
			a.Stance = "Defend"
		end
	end)
end

SetupCivilianUnits = function()
	Utils.Do(Map.NamedActors, function(a)
		if a.Owner == civilians then
			a.Move(CivilianExit.Location)
			a.Destroy()
		end
	end)
end

SetupFactories = function()
	Utils.Do(ProducedUnitTypes, function(production)
		Trigger.OnProduction(production.factory, function(_, a) BindActorTriggers(a) end)
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
speed = 7

Tick = function()
	ticks = ticks + 1

	local t = (ticks + 45) % (360 * speed) * (math.pi / 180) / speed;
	Camera.Position = viewportOrigin + WVec.New(39200 * math.sin(t), 50480 * math.cos(t), 0)

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
	zombies = Player.GetPlayer("Zombies")
	allies = Player.GetPlayer("Allies")
	gdi = Player.GetPlayer("GDI")
	civilians = Player.GetPlayer("Civilians")
	viewportOrigin = Camera.Position

	Time = Utils.RandomInteger(0, SunRise)
	if (Time >= SunSet) then
		Lighting.Red = 0.75
		Lighting.Green = 0.85
		Lighting.Blue = 1.5
		Lighting.Ambient = 0.75
	end

	SetupAlliedUnits()
	SetupGDIUnits()
	SetupCivilianUnits()
	SetupFactories()
	ShipAlliedUnitsWest()
	ShipAlliedUnitsEast()
	InsertGDIChinookReinforcements(HeliEntry1, CityCenter)
	InsertGDIChinookReinforcements(HeliEntry2, NorthBase)
	InsertGDIChinookReinforcements(HeliEntry3, TechBase)
	powerproxy = Actor.Create(ProxyType, false, { Owner = gdi })
	ParadropGDIUnits()
	Utils.Do(ProducedUnitTypes, ProduceUnits)

	SendAlliedUnits(SouthEntrance1.Location, AlliedVehicleTypes, 90)
	SendAlliedUnits(SouthEntrance2.Location, AlliedInfantryTypes, 30)

	SendGDIUnits(EastEntrance3.Location, GDIVehicleTypes, 90)
	SendGDIUnits(EastEntrance4.Location, GDIInfantryTypes, 30)

	SendZombies(NorthEntrance1.Location, ZombieTypes, 5)
	SendZombies(NorthEntrance2.Location, ZombieTypes, 5)
	SendZombies(NorthEntrance3.Location, ZombieTypes, 5)
	SendZombies(EastEntrance1.Location, ZombieTypes, 5)
	SendZombies(EastEntrance2.Location, ZombieTypes, 5)
	--SendZombies(EastEntrance3.Location, ZombieTypes, 5)
	SendZombies(WestEntrance1.Location, ZombieTypes, 5)
	SendZombies(WestEntrance2.Location, ZombieTypes, 5)
	SendZombies(WestEntrance3.Location, ZombieTypes, 5)
	SendZombies(WestEntrance4.Location, ZombieTypes, 5)

	Trigger.AfterDelay(DateTime.Seconds(5), function() SendZombies(NorthEntrance1.Location, ZombieTypes, 5) end)
	Trigger.AfterDelay(DateTime.Seconds(5), function() SendZombies(NorthEntrance2.Location, ZombieTypes, 5) end)
	Trigger.AfterDelay(DateTime.Seconds(5), function() SendZombies(NorthEntrance3.Location, ZombieTypes, 5) end)
	Trigger.AfterDelay(DateTime.Seconds(5), function() SendZombies(EastEntrance1.Location, ZombieTypes, 5) end)
	Trigger.AfterDelay(DateTime.Seconds(5), function() SendZombies(EastEntrance2.Location, ZombieTypes, 5) end)
	--Trigger.AfterDelay(DateTime.Seconds(5), function() SendZombies(EastEntrance3.Location, ZombieTypes, 5) end)
	Trigger.AfterDelay(DateTime.Seconds(5), function() SendZombies(WestEntrance1.Location, ZombieTypes, 5) end)
	Trigger.AfterDelay(DateTime.Seconds(5), function() SendZombies(WestEntrance2.Location, ZombieTypes, 5) end)
	Trigger.AfterDelay(DateTime.Seconds(5), function() SendZombies(WestEntrance3.Location, ZombieTypes, 5) end)
	Trigger.AfterDelay(DateTime.Seconds(5), function() SendZombies(WestEntrance4.Location, ZombieTypes, 5) end)

	Trigger.AfterDelay(DateTime.Seconds(10), function() SendZombies(NorthEntrance1.Location, ZombieTypes, 5) end)
	Trigger.AfterDelay(DateTime.Seconds(10), function() SendZombies(NorthEntrance2.Location, ZombieTypes, 5) end)
	Trigger.AfterDelay(DateTime.Seconds(10), function() SendZombies(NorthEntrance3.Location, ZombieTypes, 5) end)
	Trigger.AfterDelay(DateTime.Seconds(10), function() SendZombies(EastEntrance1.Location, ZombieTypes, 5) end)
	Trigger.AfterDelay(DateTime.Seconds(10), function() SendZombies(EastEntrance2.Location, ZombieTypes, 5) end)
	--Trigger.AfterDelay(DateTime.Seconds(10), function() SendZombies(EastEntrance3.Location, ZombieTypes, 5) end)
	Trigger.AfterDelay(DateTime.Seconds(10), function() SendZombies(WestEntrance1.Location, ZombieTypes, 5) end)
	Trigger.AfterDelay(DateTime.Seconds(10), function() SendZombies(WestEntrance2.Location, ZombieTypes, 5) end)
	Trigger.AfterDelay(DateTime.Seconds(10), function() SendZombies(WestEntrance3.Location, ZombieTypes, 5) end)
	Trigger.AfterDelay(DateTime.Seconds(10), function() SendZombies(WestEntrance4.Location, ZombieTypes, 5) end)

	Trigger.AfterDelay(DateTime.Seconds(15), function() SendZombies(NorthEntrance1.Location, ZombieTypes, 5) end)
	Trigger.AfterDelay(DateTime.Seconds(15), function() SendZombies(NorthEntrance2.Location, ZombieTypes, 5) end)
	Trigger.AfterDelay(DateTime.Seconds(15), function() SendZombies(NorthEntrance3.Location, ZombieTypes, 5) end)
	Trigger.AfterDelay(DateTime.Seconds(15), function() SendZombies(EastEntrance1.Location, ZombieTypes, 5) end)
	Trigger.AfterDelay(DateTime.Seconds(15), function() SendZombies(EastEntrance2.Location, ZombieTypes, 5) end)
	--Trigger.AfterDelay(DateTime.Seconds(15), function() SendZombies(EastEntrance3.Location, ZombieTypes, 5) end)
	Trigger.AfterDelay(DateTime.Seconds(15), function() SendZombies(WestEntrance1.Location, ZombieTypes, 5) end)
	Trigger.AfterDelay(DateTime.Seconds(15), function() SendZombies(WestEntrance2.Location, ZombieTypes, 5) end)
	Trigger.AfterDelay(DateTime.Seconds(15), function() SendZombies(WestEntrance3.Location, ZombieTypes, 5) end)
	Trigger.AfterDelay(DateTime.Seconds(15), function() SendZombies(WestEntrance4.Location, ZombieTypes, 5) end)

	Trigger.AfterDelay(DateTime.Seconds(20), function() SendZombies(NorthEntrance1.Location, ZombieTypes, 5) end)
	Trigger.AfterDelay(DateTime.Seconds(20), function() SendZombies(NorthEntrance2.Location, ZombieTypes, 5) end)
	Trigger.AfterDelay(DateTime.Seconds(20), function() SendZombies(NorthEntrance3.Location, ZombieTypes, 5) end)
	Trigger.AfterDelay(DateTime.Seconds(20), function() SendZombies(EastEntrance1.Location, ZombieTypes, 5) end)
	Trigger.AfterDelay(DateTime.Seconds(20), function() SendZombies(EastEntrance2.Location, ZombieTypes, 5) end)
	--Trigger.AfterDelay(DateTime.Seconds(20), function() SendZombies(EastEntrance3.Location, ZombieTypes, 5) end)
	Trigger.AfterDelay(DateTime.Seconds(20), function() SendZombies(WestEntrance1.Location, ZombieTypes, 5) end)
	Trigger.AfterDelay(DateTime.Seconds(20), function() SendZombies(WestEntrance2.Location, ZombieTypes, 5) end)
	Trigger.AfterDelay(DateTime.Seconds(20), function() SendZombies(WestEntrance3.Location, ZombieTypes, 5) end)
	Trigger.AfterDelay(DateTime.Seconds(20), function() SendZombies(WestEntrance4.Location, ZombieTypes, 5) end)

	Trigger.AfterDelay(DateTime.Seconds(25), function() SendZombies(NorthEntrance1.Location, ZombieTypes, 5) end)
	Trigger.AfterDelay(DateTime.Seconds(25), function() SendZombies(NorthEntrance2.Location, ZombieTypes, 5) end)
	Trigger.AfterDelay(DateTime.Seconds(25), function() SendZombies(NorthEntrance3.Location, ZombieTypes, 5) end)
	Trigger.AfterDelay(DateTime.Seconds(25), function() SendZombies(EastEntrance1.Location, ZombieTypes, 5) end)
	Trigger.AfterDelay(DateTime.Seconds(25), function() SendZombies(EastEntrance2.Location, ZombieTypes, 5) end)
	--Trigger.AfterDelay(DateTime.Seconds(25), function() SendZombies(EastEntrance3.Location, ZombieTypes, 5) end)
	Trigger.AfterDelay(DateTime.Seconds(25), function() SendZombies(WestEntrance1.Location, ZombieTypes, 5) end)
	Trigger.AfterDelay(DateTime.Seconds(25), function() SendZombies(WestEntrance2.Location, ZombieTypes, 5) end)
	Trigger.AfterDelay(DateTime.Seconds(25), function() SendZombies(WestEntrance3.Location, ZombieTypes, 5) end)
	Trigger.AfterDelay(DateTime.Seconds(25), function() SendZombies(WestEntrance4.Location, ZombieTypes, 5) end)
--[[
	Trigger.AfterDelay(DateTime.Seconds(5), function() SendZombiesTarget(NorthEntrance1.Location, ZombieTypes, 5, CityCenter) end)
	Trigger.AfterDelay(DateTime.Seconds(5), function() SendZombiesTarget(NorthEntrance2.Location, ZombieTypes, 5, CityCenter) end)
	Trigger.AfterDelay(DateTime.Seconds(5), function() SendZombiesTarget(NorthEntrance3.Location, ZombieTypes, 5, CityCenter) end)
	Trigger.AfterDelay(DateTime.Seconds(5), function() SendZombiesTarget(EastEntrance1.Location, ZombieTypes, 5, CityCenter) end)
	Trigger.AfterDelay(DateTime.Seconds(5), function() SendZombiesTarget(EastEntrance2.Location, ZombieTypes, 5, CityCenter) end)
	Trigger.AfterDelay(DateTime.Seconds(5), function() SendZombiesTarget(EastEntrance3.Location, ZombieTypes, 5, CityCenter) end)
	Trigger.AfterDelay(DateTime.Seconds(5), function() SendZombiesTarget(WestEntrance1.Location, ZombieTypes, 5, CityCenter) end)
	Trigger.AfterDelay(DateTime.Seconds(5), function() SendZombiesTarget(WestEntrance2.Location, ZombieTypes, 5, CityCenter) end)
	Trigger.AfterDelay(DateTime.Seconds(5), function() SendZombiesTarget(WestEntrance3.Location, ZombieTypes, 5, CityCenter) end)
	Trigger.AfterDelay(DateTime.Seconds(5), function() SendZombiesTarget(WestEntrance4.Location, ZombieTypes, 5, CityCenter) end)

	Trigger.AfterDelay(DateTime.Seconds(10), function() SendZombiesTarget(NorthEntrance1.Location, ZombieTypes, 5, CityCenter) end)
	Trigger.AfterDelay(DateTime.Seconds(10), function() SendZombiesTarget(NorthEntrance2.Location, ZombieTypes, 5, CityCenter) end)
	Trigger.AfterDelay(DateTime.Seconds(10), function() SendZombiesTarget(NorthEntrance3.Location, ZombieTypes, 5, CityCenter) end)
	Trigger.AfterDelay(DateTime.Seconds(10), function() SendZombiesTarget(EastEntrance1.Location, ZombieTypes, 5, CityCenter) end)
	Trigger.AfterDelay(DateTime.Seconds(10), function() SendZombiesTarget(EastEntrance2.Location, ZombieTypes, 5, CityCenter) end)
	Trigger.AfterDelay(DateTime.Seconds(10), function() SendZombiesTarget(EastEntrance3.Location, ZombieTypes, 5, CityCenter) end)
	Trigger.AfterDelay(DateTime.Seconds(10), function() SendZombiesTarget(WestEntrance1.Location, ZombieTypes, 5, CityCenter) end)
	Trigger.AfterDelay(DateTime.Seconds(10), function() SendZombiesTarget(WestEntrance2.Location, ZombieTypes, 5, CityCenter) end)
	Trigger.AfterDelay(DateTime.Seconds(10), function() SendZombiesTarget(WestEntrance3.Location, ZombieTypes, 5, CityCenter) end)
	Trigger.AfterDelay(DateTime.Seconds(10), function() SendZombiesTarget(WestEntrance4.Location, ZombieTypes, 5, CityCenter) end)

	Trigger.AfterDelay(DateTime.Seconds(15), function() SendZombiesTarget(NorthEntrance1.Location, ZombieTypes, 5, CityCenter) end)
	Trigger.AfterDelay(DateTime.Seconds(15), function() SendZombiesTarget(NorthEntrance2.Location, ZombieTypes, 5, CityCenter) end)
	Trigger.AfterDelay(DateTime.Seconds(15), function() SendZombiesTarget(NorthEntrance3.Location, ZombieTypes, 5, CityCenter) end)
	Trigger.AfterDelay(DateTime.Seconds(15), function() SendZombiesTarget(EastEntrance1.Location, ZombieTypes, 5, CityCenter) end)
	Trigger.AfterDelay(DateTime.Seconds(15), function() SendZombiesTarget(EastEntrance2.Location, ZombieTypes, 5, CityCenter) end)
	Trigger.AfterDelay(DateTime.Seconds(15), function() SendZombiesTarget(EastEntrance3.Location, ZombieTypes, 5, CityCenter) end)
	Trigger.AfterDelay(DateTime.Seconds(15), function() SendZombiesTarget(WestEntrance1.Location, ZombieTypes, 5, CityCenter) end)
	Trigger.AfterDelay(DateTime.Seconds(15), function() SendZombiesTarget(WestEntrance2.Location, ZombieTypes, 5, CityCenter) end)
	Trigger.AfterDelay(DateTime.Seconds(15), function() SendZombiesTarget(WestEntrance3.Location, ZombieTypes, 5, CityCenter) end)
	Trigger.AfterDelay(DateTime.Seconds(15), function() SendZombiesTarget(WestEntrance4.Location, ZombieTypes, 5, CityCenter) end)

	Trigger.AfterDelay(DateTime.Seconds(20), function() SendZombiesTarget(NorthEntrance1.Location, ZombieTypes, 5, CityCenter) end)
	Trigger.AfterDelay(DateTime.Seconds(20), function() SendZombiesTarget(NorthEntrance2.Location, ZombieTypes, 5, CityCenter) end)
	Trigger.AfterDelay(DateTime.Seconds(20), function() SendZombiesTarget(NorthEntrance3.Location, ZombieTypes, 5, CityCenter) end)
	Trigger.AfterDelay(DateTime.Seconds(20), function() SendZombiesTarget(EastEntrance1.Location, ZombieTypes, 5, CityCenter) end)
	Trigger.AfterDelay(DateTime.Seconds(20), function() SendZombiesTarget(EastEntrance2.Location, ZombieTypes, 5, CityCenter) end)
	Trigger.AfterDelay(DateTime.Seconds(20), function() SendZombiesTarget(EastEntrance3.Location, ZombieTypes, 5, CityCenter) end)
	Trigger.AfterDelay(DateTime.Seconds(20), function() SendZombiesTarget(WestEntrance1.Location, ZombieTypes, 5, CityCenter) end)
	Trigger.AfterDelay(DateTime.Seconds(20), function() SendZombiesTarget(WestEntrance2.Location, ZombieTypes, 5, CityCenter) end)
	Trigger.AfterDelay(DateTime.Seconds(20), function() SendZombiesTarget(WestEntrance3.Location, ZombieTypes, 5, CityCenter) end)
	Trigger.AfterDelay(DateTime.Seconds(20), function() SendZombiesTarget(WestEntrance4.Location, ZombieTypes, 5, CityCenter) end)

	Trigger.AfterDelay(DateTime.Seconds(25), function() SendZombiesTarget(NorthEntrance1.Location, ZombieTypes, 5, CityCenter) end)
	Trigger.AfterDelay(DateTime.Seconds(25), function() SendZombiesTarget(NorthEntrance2.Location, ZombieTypes, 5, CityCenter) end)
	Trigger.AfterDelay(DateTime.Seconds(25), function() SendZombiesTarget(NorthEntrance3.Location, ZombieTypes, 5, CityCenter) end)
	Trigger.AfterDelay(DateTime.Seconds(25), function() SendZombiesTarget(EastEntrance1.Location, ZombieTypes, 5, CityCenter) end)
	Trigger.AfterDelay(DateTime.Seconds(25), function() SendZombiesTarget(EastEntrance2.Location, ZombieTypes, 5, CityCenter) end)
	Trigger.AfterDelay(DateTime.Seconds(25), function() SendZombiesTarget(EastEntrance3.Location, ZombieTypes, 5, CityCenter) end)
	Trigger.AfterDelay(DateTime.Seconds(25), function() SendZombiesTarget(WestEntrance1.Location, ZombieTypes, 5, CityCenter) end)
	Trigger.AfterDelay(DateTime.Seconds(25), function() SendZombiesTarget(WestEntrance2.Location, ZombieTypes, 5, CityCenter) end)
	Trigger.AfterDelay(DateTime.Seconds(25), function() SendZombiesTarget(WestEntrance3.Location, ZombieTypes, 5, CityCenter) end)
	Trigger.AfterDelay(DateTime.Seconds(25), function() SendZombiesTarget(WestEntrance4.Location, ZombieTypes, 5, CityCenter) end)
]]
end
