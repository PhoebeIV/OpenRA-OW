GDIInfantryTypes = {"e1","e1","e1","e1","e1","e3","e1of","smech","smech"}
GDIVehicleTypes = {"2tnk.g","2tnk.g","2tnk.g","mmch","4tnk.g","jeepd","jeepd"}
GDIWaterTypes = {"2tnk.g","mmch","msam"}
GDISuperInfantry = {"tsghost","rmbo"}
GDISuperVehicle = {"direwolf","triton","triton"}
GDIHeliTypes = {"e1","e1","e1","e1","e1","e3","e1of"}

SovietInfantryTypes = {"e1","e1","e1","e1","e2","e1","e1","e1","e1","e2","e3","e3","e1of"}
SovietParadropTypes = {"e1","e1","e1","e1","e2","e1","e1","e1","e1","e3"}
SovietVehicleTypes = {"v2rl","v2rl","ftrk","ftrk","3tnk","3tnk","3tnk","ttnk","3tnk","ttnk"}
SovietSuperInfantry = {"e4","e4","e4","e4","shok","shok","shok","shok"}
SovietSuperVehicle = {"ztnk","4tnk","4tnk","4tnk","4tnk"}

ParadropEntryPoints = {ParaEntry1,ParaEntry2}
ParadropWaypoints = {Paradrop1,Paradrop2,Paradrop3,Paradrop4}

ProducedUnitTypes =
{
	{ CityHall, {"cstructw"} },
	{ ShippingCenter, {"policecar"} },
	{ PoliceStation, {"police","police","police","police","dog.c"} },
	{ Hospital, {"pmedi"} }
}

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

BindActorTriggers2 = function(a)
	if a.HasProperty("Hunt") then
		Trigger.OnIdle(a, function(a)
			if a.IsInWorld then
				a.AttackMove(CityCenter.Location)
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

SendGDIUnits = function(entryCell, unitTypes, interval)
	local units = Reinforcements.Reinforce(gdi, unitTypes, { entryCell }, interval)
	Utils.Do(units, function(unit)
		BindActorTriggers(unit)
	end)
	Trigger.OnAllKilled(units, function() SendGDIUnits(entryCell, unitTypes, interval) end)
end

SendSovietUnits = function(entryCell, unitTypes, interval)
	local units = Reinforcements.Reinforce(soviet, unitTypes, { entryCell }, interval)
	Utils.Do(units, function(unit)
		BindActorTriggers2(unit)
	end)
	Trigger.OnAllKilled(units, function() SendSovietUnits(entryCell, unitTypes, interval) end)
end

ShipGDIUnits = function(entryCell, exitCell, unitTypes)
	local units = Reinforcements.ReinforceWithTransport(gdi, "lst",
		unitTypes, { entryCell.Location, exitCell.Location }, { entryCell.Location })[2]

	Utils.Do(units, function(unit)
		BindActorTriggers(unit)
	end)

	Trigger.OnAllKilled(units, function() ShipGDIUnits(entryCell, exitCell, unitTypes) end)
end

HeliGDIUnits = function(entryCell, exitCell, unitTypes)
	local units = Reinforcements.ReinforceWithTransport(gdi, "tran",
		unitTypes, { entryCell.Location, exitCell.Location }, { entryCell.Location })[2]

	Utils.Do(units, function(unit)
		BindActorTriggers(unit)
	end)

	Trigger.OnAllKilled(units, function() HeliGDIUnits(entryCell, exitCell, unitTypes) end)
end

--ParadropSovietUnits = function()
--	local lz = Utils.Random(ParadropWaypoints).Location
--	local start = Map.CenterOfCell(Utils.Random(ParadropEntryPoints)) + WVec.New(0, 0, Actor.CruiseAltitude("badr"))
--	local transport = Actor.Create("badr", true, { CenterPosition = start, Owner = soviet, Facing = (Map.CenterOfCell(lz) - start).Facing })
	
--	Utils.Do(SovietParadropTypes, function(type)
--        local a = Actor.Create(type, false, { Owner = soviet })
--        BindActorTriggers2(a)
--        transport.LoadPassenger(a)
--    end)
	
--	transport.Paradrop(lz)
--	Trigger.AfterDelay(DateTime.Seconds(20), ParadropSovietUnits)
--end

ParadropSovietUnits = function()
	local lz = Utils.Random(ParadropWaypoints).Location
	local start = Map.CenterOfCell(Map.RandomEdgeCell()) + WVec.New(0, 0, Actor.CruiseAltitude("badr"))
	local transport = Actor.Create("badr", true, { CenterPosition = start, Owner = soviet, Facing = (Map.CenterOfCell(lz) - start).Facing })
	
	Utils.Do(SovietParadropTypes, function(type)
        local a = Actor.Create(type, false, { Owner = soviet })
        BindActorTriggers2(a)
        transport.LoadPassenger(a)
    end)
	
	transport.Paradrop(lz)
	Trigger.AfterDelay(DateTime.Seconds(20), ParadropSovietUnits)
end

SendSuperUnits = function()
	SendGDIUnits(GDIEast6.Location, GDISuperInfantry, 30)
	ShipGDIUnits(GDIWater6, GDILanding6, GDISuperVehicle)
	SendSovietUnits(SovietNorth6.Location, SovietSuperInfantry, 30)
	SendSovietUnits(SovietSouth6.Location, SovietSuperVehicle, 30)
end

ProduceUnits = function(t)
    local factory = t[1]
    if not factory.IsDead then
        local unitType = t[2][Utils.RandomInteger(1, #t[2] + 1)]
        factory.Wait(Actor.BuildTime(unitType))
        factory.Produce(unitType)
        factory.CallFunc(function() ProduceUnits(t) end)
    end
end

SetupFactories = function()
    Utils.Do(ProducedUnitTypes, function(pair)
        Trigger.OnProduction(pair[1], function(_, a) BindActorTriggers(a) end)
    end)
end

SetupGDIUnits = function()
	Utils.Do(Map.NamedActors, function(a)
		if a.Owner == gdi and a.HasProperty("AcceptsUpgrade") and a.AcceptsUpgrade("unkillable") then
			a.GrantUpgrade("unkillable")
			a.Stance = "Defend"
		end
	end)
end

SetupSovietnUnits = function()
	Utils.Do(Map.NamedActors, function(a)
		if a.Owner == soviet and a.HasProperty("AcceptsUpgrade") and a.AcceptsUpgrade("unkillable") then
			a.GrantUpgrade("unkillable")
			a.Stance = "Defend"
		end
	end)
end

ticks = 0
speed = 5

Tick = function()
	ticks = ticks + 1

	local t = (ticks + 45) % (360 * speed) * (math.pi / 180) / speed;
	Camera.Position = viewportOrigin + WVec.New(8000,8000,0) + WVec.New(35200 * math.sin(t), 20480 * math.cos(t), 0)
end

WorldLoaded = function()
	gdi = Player.GetPlayer("GDI")
	soviet = Player.GetPlayer("Soviet")
	viewportOrigin = Camera.Position
	
--	SetupGDIUnits()
--	SetupSovietUnits()
	SetupFactories()
	
	Utils.Do(ProducedUnitTypes, ProduceUnits)
	
	SendGDIUnits(GDIEast1.Location, GDIInfantryTypes, 30)
	SendGDIUnits(GDIEast2.Location, GDIVehicleTypes, 30)
	SendGDIUnits(GDIEast3.Location, GDIInfantryTypes, 30)
	SendGDIUnits(GDIEast4.Location, GDIVehicleTypes, 30)
	SendGDIUnits(GDIEast5.Location, GDIInfantryTypes, 30)
	
	SendSovietUnits(SovietNorth1.Location, SovietInfantryTypes, 30)
	SendSovietUnits(SovietNorth2.Location, SovietVehicleTypes, 30)
	SendSovietUnits(SovietNorth3.Location, SovietInfantryTypes, 30)
	SendSovietUnits(SovietNorth4.Location, SovietVehicleTypes, 30)
	SendSovietUnits(SovietNorth5.Location, SovietInfantryTypes, 30)
	
	SendSovietUnits(SovietSouth1.Location, SovietInfantryTypes, 30)
	SendSovietUnits(SovietSouth2.Location, SovietVehicleTypes, 30)
	SendSovietUnits(SovietSouth3.Location, SovietInfantryTypes, 30)
	SendSovietUnits(SovietSouth4.Location, SovietVehicleTypes, 30)
	SendSovietUnits(SovietSouth5.Location, SovietInfantryTypes, 30)
	
	Trigger.AfterDelay(DateTime.Seconds(60), function() ShipGDIUnits(GDIWater1, GDILanding1, GDIWaterTypes) end)
	Trigger.AfterDelay(DateTime.Seconds(60), function() ShipGDIUnits(GDIWater2, GDILanding2, GDIWaterTypes) end)
	Trigger.AfterDelay(DateTime.Seconds(60), function() ShipGDIUnits(GDIWater3, GDILanding3, GDIWaterTypes) end)
	Trigger.AfterDelay(DateTime.Seconds(60), function() ShipGDIUnits(GDIWater4, GDILanding4, GDIWaterTypes) end)
	Trigger.AfterDelay(DateTime.Seconds(60), function() ShipGDIUnits(GDIWater5, GDILanding5, GDIWaterTypes) end)
	
	Trigger.AfterDelay(DateTime.Seconds(60), ParadropSovietUnits)
	Trigger.AfterDelay(DateTime.Seconds(60), ParadropSovietUnits)
	
	Trigger.AfterDelay(DateTime.Seconds(60), function() HeliGDIUnits(HeliEntry1, HeliLanding1, GDIHeliTypes) end)
	Trigger.AfterDelay(DateTime.Seconds(60), function() HeliGDIUnits(HeliEntry2, HeliLanding2, GDIHeliTypes) end)
	Trigger.AfterDelay(DateTime.Seconds(60), function() HeliGDIUnits(HeliEntry3, HeliLanding3, GDIHeliTypes) end)
	Trigger.AfterDelay(DateTime.Seconds(60), function() HeliGDIUnits(HeliEntry4, HeliLanding4, GDIHeliTypes) end)
	Trigger.AfterDelay(DateTime.Seconds(60), function() HeliGDIUnits(HeliEntry5, HeliLanding5, GDIHeliTypes) end)
	Trigger.AfterDelay(DateTime.Seconds(60), function() HeliGDIUnits(HeliEntry6, HeliLanding6, GDIHeliTypes) end)
	
	Trigger.AfterDelay(DateTime.Seconds(120), SendSuperUnits)
end