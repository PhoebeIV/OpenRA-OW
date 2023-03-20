--[[
   Copyright 2007-2022 The OpenRA Developers (see AUTHORS)
   This file is part of OpenRA, which is free software. It is made
   available to you under the terms of the GNU General Public License
   as published by the Free Software Foundation, either version 3 of
   the License, or (at your option) any later version. For more
   information, see COPYING.
]]
if DateTime.IsHalloween then
	UnitTypes = { "ant", "ant", "ant" }
	BeachUnitTypes = { "ant", "ant" }
	ProxyType = "powerproxy.parazombies"
	ProducedUnitTypes =
	{
		{ factory = AlliedBarracks1, types = { "e1", "e3" } },
		{ factory = AlliedBarracks2, types = { "e1", "e3" } },
		{ factory = SovietBarracks1, types = { "ant" } },
		{ factory = SovietBarracks2, types = { "ant" } },
		{ factory = SovietBarracks3, types = { "ant" } },
		{ factory = AlliedWarFactory1, types = { "jeep", "1tnk", "2tnk", "arty", "ctnk" } },
		{ factory = SovietWarFactory1, types = { "3tnk", "4tnk", "v2rl", "ttnk", "apc", "ztnk" } }
	}
else
	UnitTypes = { "3tnk", "ftrk", "ttnk", "apc", "3tnk", "3tnk", "4tnk" }
	UnitTypes2 = { "helld6", "helld6", "helld6", "helld6", "helld6", "helld6", "helld6", "helld6", "helld6", "helld6", "helld5", "helld5", "helld5", "helld9", "helld3" }
	UnitTypes3 = { "maus", "dmgtnk.m", "dmgtnk.m", "nbos4", "nbos1", "nbos1", "nbos1", "e1of" }
	BeachUnitTypes = { "e1", "e2", "e3", "e4", "e1of", "e2", "e3", "e4", "e1", "e2", "e3", "e4", "e1", "e2", "e3", "e4", "dm5" }
	ProxyType = "powerproxy.paratroopers"
	ChronoshiftSpawns = { "2tnk", "mtnkd.g", "tscyb", "mmch", "smech", "btnk" }
	ChronoshiftSpawns2 = { "dm2", "dm6", "helld4", "helld6", "fe1", "tscyb", "dm3" }
	ChronoshiftSpawns3 = { "tscybcom", "e7", "tse5p.gdi", "tselite", "frmbo", "nbos6", "nbos7", "medideathknight", "baneblade", "novan", "direwolf", "dm5", "u.tnk", "ztnk", "solc", "helld8" }
	ProducedUnitTypes =
	{
    	{ factory = AlliedBarracks1, types = { "e1", "e3", "dm2", "e1of", "e3", "tscybcom", "e1of", "e3", "tselite" } },
    	{ factory = AlliedBarracks2, types = { "dm6", "dm3", "dm2", "e1of", "tscyb", "tscyb", "e1of", "tse5p.dm", "tselite" } },
    	{ factory = AlliedBarracks3, types = { "e1", "e3", "dm2", "e1of", "e3", "tscybcom", "e1of", "e3", "tselite" } },
    	{ factory = SovietBarracks1, types = { "nbos1", "e1", "e2", "e3", "e4", "e1of", "shok", "dm5" } },
--		{ factory = SovietBarracks2, types = { "nbos1", "e1", "e2", "e3", "e4", "e1of", "shok", "nbos7" } },
--		{ factory = SovietBarracks3, types = { "frmbo", "nbos1", "e1of", "e3", "e4", "shok", "nbos6" } },
--    	{ factory = SovietBarracks4, types = { "ge1", "ge2", "ge3", "ge2", "ge2", "ge2", "ge1", "ge2", "tse5.g", "medideathknight" } },
--		{ factory = SovietBarracks5, types = { "nbos1", "e1", "e2", "e3", "e4", "e1of", "shok", "nbos7" } },
--    	{ factory = Demons1, types = { "helld7", "helld5", "helld6", "helld9", "helld7" } },
--    	{ factory = Demons2, types = { "helld5", "helld5", "helld5", "helld5", "helld5", "helld8" } },
--    	{ factory = Demons3, types = { "pzealot", "pzealot", "pzealot", "pzealot", "pdrago" } },
    	{ factory = AlliedWarFactory1, types = { "jeep", "1tnk", "2tnk", "arty", "ctnk" } },
--    	{ factory = AlliedWarFactory2, types = { "jeep", "1tnk", "2tnk", "arty", "ctnk" } },
    	{ factory = SovietWarFactory1, types = { "3tnk", "4tnk", "v2rl", "ttnk", "apc", "maus", "ztnk", "u.tnk", "nbos6" } },
--    	{ factory = SovietWarFactory2, types = { "3tnk.nz", "mmch", "fcru", "2tnk.nz", "dmgtnk.m", "baneblade" } }
	}
end

AirUnitTypes = { "mig", "n.mig", "yak", "bf109", "do17", "a10", "tsorcab", "scrin", "a10.n3", "lance", "nhwk", "paladin" }
ShipUnitTypes = { "smech", "smech", "jeep", "triton", "mmch", "mmch" }
HelicopterUnitTypes = { "e1", "e1", "e1of", "tsghost", "e3", "e3", "e3" };

ChronoshiftWaypoints = { Paradrop7, Paradrop9, ChronoshiftLocation }

ParadropWaypoints = { Paradrop1, Paradrop2, Paradrop3, Paradrop4, Paradrop5, Paradrop6, Paradrop7, Paradrop8 }

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
          a.Hunt()
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

SendSovietUnits = function(entryCell, unitTypes, interval)
	local units = Reinforcements.Reinforce(soviets, unitTypes, { entryCell }, interval)
	Utils.Do(units, function(unit)
		BindActorTriggers(unit)
	end)
	Trigger.OnAllKilled(units, function() SendSovietUnits(entryCell, unitTypes, interval) end)
end

SendMigs = function(waypoints)
	local migEntryPath = { waypoints[1].Location, waypoints[2].Location }
	local migs = Reinforcements.Reinforce(soviets, { "mig" }, migEntryPath, 4)
	Utils.Do(migs, function(mig)
		mig.Move(waypoints[3].Location)
		mig.Move(waypoints[4].Location)
		mig.Destroy()
	end)

	Trigger.AfterDelay(DateTime.Seconds(40), function() SendMigs(waypoints) end)
end

ShipAlliedUnits = function()
	local units = Reinforcements.ReinforceWithTransport(allies, "lst",
		ShipUnitTypes, { LstEntry.Location, LstUnload.Location }, { LstEntry.Location })[2]

	Utils.Do(units, function(unit)
		BindActorTriggers(unit)
	end)

	Trigger.AfterDelay(DateTime.Seconds(60), ShipAlliedUnits)
end

InsertAlliedChinookReinforcements = function(entry, hpad)
	local units = Reinforcements.ReinforceWithTransport(allies, "tran",
		HelicopterUnitTypes, { entry.Location, hpad.Location + CVec.New(1, 2) }, { entry.Location })[2]

	Utils.Do(units, function(unit)
		BindActorTriggers(unit)
	end)

	Trigger.AfterDelay(DateTime.Seconds(60), function() InsertAlliedChinookReinforcements(entry, hpad) end)
end

ParadropSovietUnits = function()
	local lz = Utils.Random(ParadropWaypoints)
	local aircraft = powerproxy.TargetParatroopers(lz.CenterPosition)

	Utils.Do(aircraft, function(a)
		Trigger.OnPassengerExited(a, function(t, p)
			BindActorTriggers(p)
		end)
	end)

	Trigger.AfterDelay(DateTime.Seconds(35), ParadropSovietUnits)
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
		if a.Owner == allies and a.HasProperty("AcceptsCondition") and a.AcceptsCondition("unkillable") then
			a.GrantCondition("unkillable")
			a.Stance = "Defend"
		end
	end)
end

SetupSovietUnits = function()
	Utils.Do(Map.NamedActors, function(a)
		if a.Owner == soviets and a.HasProperty("AcceptsCondition") and a.AcceptsCondition("unkillable") and a.Type ~= "nbos6" then
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
  local spawn = Utils.Random(ChronoshiftSpawns)
  local lz = Utils.Random(ChronoshiftWaypoints)
	local cells = Utils.ExpandFootprint({ lz.Location }, false)
	local units = { }
	for i = 1, #cells do
		local unit = Actor.Create(spawn, true, { Owner = allies, Facing = Angle.North })
		BindActorTriggers(unit)
		units[unit] = cells[i]
	end
	Chronosphere.Chronoshift(units)
	Trigger.AfterDelay(DateTime.Seconds(30), ChronoshiftAlliedUnits)
end

ChronoshiftAlliedUnits2 = function()
  local spawn = Utils.Random(ChronoshiftSpawns2)
  local lz = Utils.Random(ChronoshiftWaypoints)
	local cells = Utils.ExpandFootprint({ lz.Location }, true)
	local units = { }
	for i = 1, #cells do
		local unit = Actor.Create(spawn, true, { Owner = allies, Facing = Angle.North })
		BindActorTriggers(unit)
		units[unit] = cells[i]
	end
	Chronosphere.Chronoshift(units)
	Trigger.AfterDelay(DateTime.Seconds(20), ChronoshiftAlliedUnits2)
end

ChronoshiftAlliedUnits3 = function()
  local spawn = Utils.Random(ChronoshiftSpawns3)
  local lz = Utils.Random(ChronoshiftWaypoints)
	local unit = Actor.Create(spawn, true, { Owner = allies, Facing = Angle.North, Location = lz.Location })
	BindActorTriggers(unit)
	Trigger.AfterDelay(DateTime.Seconds(30), ChronoshiftAlliedUnits3)
end

ChronoshiftSovietUnits = function()
  local lz = Utils.Random(ParadropWaypoints)
	local cells = Utils.ExpandFootprint({ lz.Location }, true)
	local units = { }
	for i = 1, #cells do
		local unit = Actor.Create("helld6", true, { Owner = soviets, Facing = Angle.North })
		BindActorTriggers(unit)
		units[unit] = cells[i]
	end
	Chronosphere.Chronoshift(units)
	Trigger.AfterDelay(DateTime.Seconds(50), ChronoshiftSovietUnits)
end

ChronoshiftSovietUnits2 = function()
  local spawn = Utils.Random(ChronoshiftSpawns3)
  local lz = Utils.Random(ParadropWaypoints)
	local unit = Actor.Create(spawn, true, { Owner = soviets, Facing = Angle.North, Location = lz.Location })
	BindActorTriggers(unit)
	Trigger.AfterDelay(DateTime.Seconds(50), ChronoshiftSovietUnits2)
end

ticks = 0
speed = 5

Tick = function()
	ticks = ticks + 1

	local t = (ticks + 45) % (360 * speed) * (math.pi / 180) / speed;
	Camera.Position = viewportOrigin + WVec.New(19200 * math.sin(t), 20480 * math.cos(t), 0)
end

WorldLoaded = function()
	allies = Player.GetPlayer("Allies")
	soviets = Player.GetPlayer("Soviets")
	viewportOrigin = Camera.Position

  SetupAlliedUnits()
  SetupSovietUnits()
	SetupFactories()
	ShipAlliedUnits()
	InsertAlliedChinookReinforcements(Chinook1Entry, HeliPad1)
	InsertAlliedChinookReinforcements(Chinook2Entry, HeliPad2)
	powerproxy = Actor.Create(ProxyType, false, { Owner = soviets })
	ParadropSovietUnits()
	Trigger.AfterDelay(DateTime.Seconds(5), ChronoshiftAlliedUnits)
	Trigger.AfterDelay(DateTime.Seconds(8), ChronoshiftAlliedUnits2)
	Trigger.AfterDelay(DateTime.Seconds(12), ChronoshiftAlliedUnits2)
	Trigger.AfterDelay(DateTime.Seconds(16), ChronoshiftAlliedUnits3)
	Trigger.AfterDelay(DateTime.Seconds(20), ChronoshiftSovietUnits)
	Trigger.AfterDelay(DateTime.Seconds(21), ChronoshiftSovietUnits)
	Trigger.AfterDelay(DateTime.Seconds(22), ChronoshiftSovietUnits)
	Trigger.AfterDelay(DateTime.Seconds(23), ChronoshiftSovietUnits)
	Trigger.AfterDelay(DateTime.Seconds(24), ChronoshiftSovietUnits)
  Trigger.AfterDelay(DateTime.Seconds(12), ChronoshiftSovietUnits2)
  Trigger.AfterDelay(DateTime.Seconds(25), ChronoshiftSovietUnits2)
  Trigger.AfterDelay(DateTime.Seconds(40), ChronoshiftSovietUnits2)
	Utils.Do(ProducedUnitTypes, ProduceUnits)

	Trigger.AfterDelay(DateTime.Seconds(30), function() SendMigs(Mig1Waypoints) end)
	Trigger.AfterDelay(DateTime.Seconds(30), function() SendMigs(Mig2Waypoints) end)

	SendSovietUnits(Entry1.Location, UnitTypes, 30)
	SendSovietUnits(Entry2.Location, UnitTypes, 30)
	SendSovietUnits(Entry3.Location, UnitTypes, 30)
	SendSovietUnits(Entry4.Location, UnitTypes, 30)
	SendSovietUnits(Entry5.Location, UnitTypes, 30)
	SendSovietUnits(Entry6.Location, UnitTypes, 30)
	SendSovietUnits(Entry2.Location, UnitTypes2, 40)
	SendSovietUnits(Entry4.Location, UnitTypes2, 20)
	SendSovietUnits(Entry5.Location, UnitTypes2, 45)
	SendSovietUnits(Entry6.Location, UnitTypes2, 50)
	SendSovietUnits(Entry6.Location, UnitTypes3, 60)
	SendSovietUnits(Entry7.Location, BeachUnitTypes, 15)
	SendSovietUnits(Entry8.Location, BeachUnitTypes, 15)
	SendSovietUnits(Entry8.Location, UnitTypes2, 20)
	SendSovietUnits(Entry7.Location, UnitTypes2, 20)
end
