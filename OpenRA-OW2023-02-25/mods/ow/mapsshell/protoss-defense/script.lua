--[[
   Copyright 2007-2022 The OpenRA Developers (see AUTHORS)
   This file is part of OpenRA, which is free software. It is made
   available to you under the terms of the GNU General Public License
   as published by the Free Software Foundation, either version 3 of
   the License, or (at your option) any later version. For more
   information, see COPYING.
]]

UnitTypes = { "zhydra", "zhydra", "zhydra", "zhydra" }
Zerglings = { "zzergling2", "zzergling2", "zzergling2", "zzergling2", "zzergling2", "zzergling2", "zzergling2", "zzergling2", "zzergling2", "zzergling2", "zzergling2", "zzergling2" }
BeachUnitTypes = { "zultra","zultra" }
ProxyType = "powerproxy.paratroopers"
ProducedUnitTypes =
{
		{ factory = Gateway1, types = { "pzealot","pzealot","pdrago","pdtemplar" } },
		{ factory = Gateway2, types = { "pzealot","pzealot","pdrago","parchon" } },
		{ factory = Gateway3, types = { "pzealot","pzealot","pdrago" } },
		{ factory = Gateway4, types = { "pzealot","pzealot","pdrago" } },
		{ factory = Hatchery1, types = { "zzergling", "zzergling", "zhydra", "zlurker.ai", "zultra", "zkerrigan" } },
		{ factory = Hatchery2, types = { "zzergling", "zzergling", "zhydra", "zlurker.ai" } },
		{ factory = Hatchery3, types = { "zzergling", "zzergling", "zhydra", "zlurker.ai" } },
		{ factory = Hatchery4, types = { "zzergling", "zzergling", "zhydra", "zultra" } },
		{ factory = Hatchery5, types = { "zzergling", "zzergling", "zhydra" } },
		{ factory = Spire1, types = { "zmuta", "zguardian", "zqueen" } },
		{ factory = Spire2, types = { "zmuta" } },
		{ factory = Stargate1, types = { "pmother", "pscout", "pscout", "pscout" } }
}

HelicopterUnitTypes = { "pzealot", "pzealot", "pdrago" };
ParadropWaypoints = { Nydus1, Nydus2, Nydus3, Nydus4 }
AlliedUnitTypes = { "pzealot", "pzealot", "pzealot", "pzealot", "pdrago" }

Mig1Waypoints = { Mig11, Mig12, Mig13, Mig14 }
Mig2Waypoints = { Mig21, Mig22, Mig23, Mig24 }

BindActorTriggers = function(a)
	if a.HasProperty("Hunt") then
		if a.Owner == allies then
			Trigger.OnIdle(a, function(a)
				if a.IsInWorld then
					a.Hunt()
				end
			end)
		else
			Trigger.OnIdle(a, function(a)
				if a.IsInWorld then
					a.AttackMove(AttackSpot.Location)
				end
			end)
		end
	end

	if a.HasProperty("HasPassengers") then
		Trigger.OnPassengerExited(a, function(t, p)
			BindActorTriggers(p)
		end)

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

	if not AlliedTechnologyCenter.IsDead then
		Trigger.OnAllKilled(units, function() SendAlliedUnits(entryCell, unitTypes, interval) end)
	end
end

SendSovietUnits = function(entryCell, unitTypes, interval)
	local units = Reinforcements.Reinforce(soviets, unitTypes, { entryCell }, interval)
	Utils.Do(units, function(unit)
		BindActorTriggers(unit)
	end)
	if not AlliedTechnologyCenter.IsDead then
		Trigger.OnAllKilled(units, function() SendSovietUnits(entryCell, unitTypes, interval) end)
	end
end

SendMigs = function(waypoints)
	local migEntryPath = { waypoints[1].Location, waypoints[2].Location }
	local migs = Reinforcements.Reinforce(soviets, { "zmuta" }, migEntryPath, 4)
	Utils.Do(migs, function(mig)
		mig.Move(waypoints[3].Location)
		mig.Move(waypoints[4].Location)
		mig.Destroy()
	end)

	Trigger.AfterDelay(DateTime.Seconds(40), function() SendMigs(waypoints) end)
end

InsertAlliedChinookReinforcements = function(entry, hpad)
	local waitTime = Utils.RandomInteger(45,75)
	local units = Reinforcements.ReinforceWithTransport(allies, "pshuttle",
		HelicopterUnitTypes, { entry.Location, hpad.Location + CVec.New(1, 2) }, { entry.Location })[2]

	Utils.Do(units, function(unit)
		BindActorTriggers(unit)
	end)

	if not AlliedTechnologyCenter.IsDead then
		Trigger.AfterDelay(DateTime.Seconds(waitTime), function() InsertAlliedChinookReinforcements(entry, hpad) end)
	end
end

ParadropSovietUnits = function()
	local lz = Utils.Random(ParadropWaypoints)
	local aircraft = powerproxy.TargetParatroopers(lz.CenterPosition)

	if not AlliedTechnologyCenter.IsDead then
		Utils.Do(aircraft, function(a)
			Trigger.OnPassengerExited(a, function(t, p)
				BindActorTriggers(p)
			end)
		end)
		Trigger.AfterDelay(DateTime.Seconds(60), ParadropSovietUnits)
	end

end

ProduceUnits = function(t)
	local factory = t.factory
	if not factory.IsDead then
		local unitType = t.types[Utils.RandomInteger(1, #t.types + 1)]
		factory.Wait(Actor.BuildTime(unitType)*0.5)
		factory.Produce(unitType)
		if not AlliedTechnologyCenter.IsDead then
			factory.CallFunc(function() ProduceUnits(t) end)
		end
	end
end

SetupAlliedUnits = function()
	Utils.Do(Map.NamedActors, function(a)
		if a.Owner == allies and a.HasProperty("AcceptsCondition") and a.AcceptsCondition("unkillable") then
			a.GrantCondition("unkillable")
			a.Stance = "Defend"
		end
	end)
	Utils.Do(Map.NamedActors, function(a)
		if a.Owner == allies and a.HasProperty("AcceptsCondition") and a.AcceptsCondition("defender") then
			a.GrantCondition("defender")
			a.Stance = "Defend"
		end
	end)
end

SetupSovietUnits = function()
	Utils.Do(Map.NamedActors, function(a)
		if a.Owner == soviets and a.HasProperty("AcceptsCondition") and a.AcceptsCondition("unkillable") then
			a.GrantCondition("unkillable")
			a.Stance = "Defend"
		end
	end)
end

SetupFactories = function()
	Utils.Do(ProducedUnitTypes, function(production)
		Trigger.OnProduction(production.factory, function(_, a) BindActorTriggers(a) end)
	end)
end

ChronoshiftAlliedUnits = function()
	local cells = Utils.ExpandFootprint({ ChronoshiftLocation.Location }, false)
	local units = { }
	if not Chronosphere.IsDead then
		for i = 1, #cells do
		local unit = Actor.Create("pzealot", true, { Owner = allies, Facing = Angle.South })
		BindActorTriggers(unit)
		units[unit] = cells[i]
		end
		Chronosphere.Chronoshift(units)
		Trigger.AfterDelay(DateTime.Seconds(30), ChronoshiftAlliedUnits)
	end
end

ticks = 0
speed = 3

Tick = function()
	ticks = ticks + 1

	local t = (ticks + 45) % (360 * speed) * (math.pi / 180) / speed;
	Camera.Position = viewportOrigin + WVec.New(11200 * math.sin(t), 12480 * math.cos(t), 0)
end

WorldLoaded = function()
	allies = Player.GetPlayer("Defender")
	soviets = Player.GetPlayer("Attacker")
	viewportOrigin = Camera.Position

	SetupAlliedUnits()
	SetupSovietUnits()
	SetupFactories()
	InsertAlliedChinookReinforcements(Chinook1Entry, HeliPad1)
	InsertAlliedChinookReinforcements(Chinook2Entry, HeliPad2)
	InsertAlliedChinookReinforcements(Entry3, HeliPad3)
	InsertAlliedChinookReinforcements(Entry8, HeliPad4)
	InsertAlliedChinookReinforcements(Entry5, HeliPad5)
	powerproxy = Actor.Create(ProxyType, false, { Owner = soviets })
	ParadropSovietUnits()
	Trigger.AfterDelay(DateTime.Seconds(5), ChronoshiftAlliedUnits)
	Utils.Do(ProducedUnitTypes, ProduceUnits)

	Trigger.AfterDelay(DateTime.Seconds(30), function() SendMigs(Mig1Waypoints) end)
	Trigger.AfterDelay(DateTime.Seconds(30), function() SendMigs(Mig2Waypoints) end)

	SendAlliedUnits(Entry5.Location, AlliedUnitTypes, 50)

	SendSovietUnits(Entry1.Location, UnitTypes, 50)
	SendSovietUnits(Entry2.Location, UnitTypes, 50)
	SendSovietUnits(Entry3.Location, UnitTypes, 50)
	SendSovietUnits(Entry4.Location, UnitTypes, 50)
	SendSovietUnits(Entry6.Location, UnitTypes, 50)
	SendSovietUnits(Entry7.Location, UnitTypes, 50)
	SendSovietUnits(Entry8.Location, BeachUnitTypes, 75)
	SendSovietUnits(Entry1.Location, Zerglings, 5)
	SendSovietUnits(Entry2.Location, Zerglings, 5)
	SendSovietUnits(Entry3.Location, Zerglings, 5)
	SendSovietUnits(Entry4.Location, Zerglings, 5)
	SendSovietUnits(Entry6.Location, Zerglings, 5)
	SendSovietUnits(Entry7.Location, Zerglings, 5)
end
