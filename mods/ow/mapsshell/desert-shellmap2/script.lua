if DateTime.IsHalloween then
	UnitTypes = { "ant", "ant", "ant" }
	BeachUnitTypes = { "ant", "ant" }
	ProxyType = "PowerProxy.parazombies"
	ProducedUnitTypes =
	{
		{ factory = AlliedBarracks1, types = { "e1", "e3", "medi", "mech", "rmbo", "tselite" } },
		{ factory = AlliedBarracks2, types = { "e1", "e3", "medi", "mech", "rmbo" } },
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
	BeachUnitTypes = { "e1", "e2", "e3", "e4", "e1of", "e2", "e3", "e4", "e1", "e2", "e3", "e4", "e1", "e2", "e3", "e4", "dm5", "rmbo", "dm6", "dm1", "dm2", "dm3" }
	ProxyType = "PowerProxy.paratroopers"
	HyperionType = "PowerProxy.hyperion"
	ChronoshiftSpawns = { "2tnk", "mtnkd.g", "tscyb", "mmch", "smech", "btnk" }
	ChronoshiftSpawns2 = { "dm2", "dm6", "helld4", "helld6", "fe1", "tscyb", "dm3", "c10.dr", "c10.scot", "pzealot", "parchon", "zultra", "dm7" }
	ChronoshiftSpawns3 = { "terminator", "tscybcom", "e7.e", "e7.g", "tselite", "frmbo", "nbos6", "nbos7", "baneblade", "novan", "direwolf", "dm5", "u.tnk", "ztnk", "solc", "helld8", "dukenukem", "hartman", "judgedredd", "tvult.raynor", "usarailgun", "usadisrupter", "chinadeathhand", "chinazhurong", "chinafortress", "japanhakaimono", "japankuruttaneko", "japanskyempress", "zkerrigan", "olddk", "strifeguy.hero5", "btrae.hero5", "hereticcorvus" }
	ProducedUnitTypes =
	{
		{ factory = AlliedBarracks1, types = { "e1", "e3", "dm2", "e1of", "e3", "tscybcom", "e1of", "e3", "tselite", "c10.dr", "c10.scot", "c1.masterbot", "rmbo" } },
		{ factory = AlliedBarracks2, types = { "dm6", "dm3", "dm2", "dm2of", "e1of", "tscyb", "tscyb", "e1of", "tse5p.dm", "tselite", "c10.dr", "c10.scot", "rmbo" } },
		{ factory = Actor434, types = { "e1", "e3", "dm2", "dm2of", "e1of", "e3", "dm2", "e1of", "e3", "tselite" } },
		{ factory = SovietBarracks1, types = { "nbos1", "e1", "e2", "e3", "e4", "shok", "dm5", "c10.dr", "c10.scot", "c1.masterbot", "rmbo" } },
		{ factory = SovietBarracks2, types = { "nbos1", "e1", "e2", "e3", "e4", "shok", "nbos7", "c10.dr", "c10.scot", "rmbo", "japanmatsui" } },
		{ factory = SovietBarracks3, types = { "frmbo", "nbos1", "e1of", "e3", "e4", "shok", "nbos6", "c10.dr", "c10.scot", "c1.masterbot", "rmbo" } },
		{ factory = Actor428, types = { "helld7", "helld5", "helld6", "helld9", "helld7" } },
		{ factory = Actor429, types = { "helld5", "helld5", "helld5", "helld5", "helld5", "helld8" } },
		{ factory = AlliedWarFactory1, types = { "jeep", "1tnk", "2tnk", "arty", "ctnk", "direwolf", "japankuruttaneko" } },
		{ factory = Actor413, types = { "bike", "1tnk", "btnk", "aaty", "ctnk", "novan" } },
		{ factory = SovietWarFactory1, types = { "3tnk", "4tnk", "v2rl", "ttnk", "apc", "maus", "ztnk", "u.tnk", "nbos6" } },
		{ factory = Actor412, types = { "3tnk.nz", "mmch", "fcru", "2tnk.nz", "dmgtnk.m", "baneblade" } }
	}
end

ShipUnitTypes = { "smech", "smech", "jeep", "triton", "mmch", "mmch" }
HelicopterUnitTypes = { "e1", "e1", "e1of", "tsghost", "e3", "e3", "e3" };

ParadropWaypoints = { Paradrop1, Paradrop2, Paradrop3, Paradrop4, Paradrop5, Paradrop6, Paradrop7, Paradrop8 }
ChronoshiftWaypoints = { Paradrop7, Paradrop9, ChronoshiftLocation }

BindActorTriggers = function(a)
	if a.HasProperty("Hunt") then
		if a.Owner == Allies then
			Trigger.OnIdle(a, function(a)
				if a.IsInWorld then
					a.Hunt()
				end
			end)
		else
			Trigger.OnIdle(a, function(a)
				if a.IsInWorld then
					a.AttackMove(LandMine100.Location)
				end
			end)
		end
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
		if a.Owner == Allies then
			Trigger.OnIdle(a, function(a)
				if a.IsInWorld then
					a.Hunt()
				end
			end)
		else
			Trigger.OnIdle(a, function(a)
				if a.IsInWorld then
					a.AttackMove(LandMine100.Location)
				end
			end)
		end
	end

	if a.HasProperty("HasPassengers") then
		Trigger.OnDamaged(a, function()
			if a.HasPassengers then
				a.Stop()
				a.UnloadPassengers()
			end
		end)
	end
	if a.HasProperty("AcceptsCondition") and a.AcceptsCondition("killable") then
		a.GrantCondition("killable")
	end
end

SendSovietUnits = function(entryCell, unitTypes, interval)
	local units = Reinforcements.Reinforce(Soviets, unitTypes, { entryCell }, interval)
	Utils.Do(units, function(unit)
		BindActorTriggers(unit)
	end)

	if not AlliedTechnologyCenter.IsDead then
		Trigger.OnAllKilled(units, function() SendSovietUnits(entryCell, unitTypes, interval) end) end
end

ShipAlliedUnits = function()
	local units = Reinforcements.ReinforceWithTransport(Allies, "lst",
		ShipUnitTypes, { LstEntry.Location, LstUnload.Location }, { LstEntry.Location })[2]

	Utils.Do(units, function(unit)
		BindActorTriggers(unit)
	end)


end

InsertAlliedChinookReinforcements = function(entry, hpad)
	local units = Reinforcements.ReinforceWithTransport(Allies, "tran",
		HelicopterUnitTypes, { entry.Location, hpad.Location + CVec.New(1, 2) }, { entry.Location })[2]

	Utils.Do(units, function(unit)
		BindActorTriggers(unit)
	end)

	if not AlliedTechnologyCenter.IsDead then
		Trigger.AfterDelay(DateTime.Seconds(30), function() InsertAlliedChinookReinforcements(entry, hpad) end) end
end

ParadropSovietUnits = function()
	local lz = Utils.Random(ParadropWaypoints)
	local units = PowerProxy.TargetParatroopers(lz.CenterPosition)

	Utils.Do(units, function(a)
		BindActorTriggers(a)
	end)

	if not AlliedTechnologyCenter.IsDead then
		Trigger.AfterDelay(DateTime.Seconds(20), ParadropSovietUnits) end
end

ProduceUnits = function(t)
	local factory = t.factory
	if not factory.IsDead and not AlliedTechnologyCenter.IsDead then
		local unitType = t.types[Utils.RandomInteger(1, #t.types + 1)]
		factory.Wait(Actor.BuildTime(unitType) * 0.33)
		factory.Produce(unitType)
		factory.CallFunc(function() ProduceUnits(t) end)
	end
end

SetupAlliedUnits = function()
	Utils.Do(Map.NamedActors, function(a)
		if a.Owner == Allies and a.HasProperty("AcceptsCondition") and a.AcceptsCondition("unkillable") then
			a.GrantCondition("unkillable")
			a.Stance = "Defend"
		end
	end)
end

SetupSovietUnits = function()
	Utils.Do(Map.NamedActors, function(a)
		if a.Owner == Soviets and a.HasProperty("AcceptsCondition") and a.AcceptsCondition("unkillable") and a.Type ~= "nbos6" then
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
		local unit = Actor.Create(spawn, true, { Owner = Allies, Facing = Angle.North })
		BindActorTriggers(unit)
		units[unit] = cells[i]
	end
	Actor435.Chronoshift(units)
	if not AlliedTechnologyCenter.IsDead then
		Trigger.AfterDelay(DateTime.Seconds(30), ChronoshiftAlliedUnits) end
end

ChronoshiftAlliedUnits2 = function()
	local spawn = Utils.Random(ChronoshiftSpawns2)
	local lz = Utils.Random(ChronoshiftWaypoints)
	local cells = Utils.ExpandFootprint({ lz.Location }, true)
	local units = { }
	for i = 1, #cells do
		local unit = Actor.Create(spawn, true, { Owner = Allies, Facing = Angle.North })
		BindActorTriggers(unit)
		units[unit] = cells[i]
	end
	Actor435.Chronoshift(units)
	if not AlliedTechnologyCenter.IsDead then
		Trigger.AfterDelay(DateTime.Seconds(30), ChronoshiftAlliedUnits2) end
end

ChronoshiftAlliedUnits3 = function()
	local spawn = Utils.Random(ChronoshiftSpawns3)
	local lz = Utils.Random(ChronoshiftWaypoints)
    local cells = Utils.ExpandFootprint({ lz.Location }, false)
	local units = { }
	for i = 1, #cells do
		local unit = Actor.Create(spawn, true, { Owner = Allies, Facing = Angle.North })
		BindActorTriggers2(unit)
		units[unit] = cells[i]
	end
	Actor435.Chronoshift(units)
	if not AlliedTechnologyCenter.IsDead then
		Trigger.AfterDelay(DateTime.Seconds(60), ChronoshiftAlliedUnits3) end
end

ChronoshiftSovietUnits = function()
	local lz = Utils.Random(ParadropWaypoints)
	local cells = Utils.ExpandFootprint({ lz.Location }, true)
	local units = { }
	for i = 1, #cells do
		local unit = Actor.Create("helld6", true, { Owner = Soviets, Facing = Angle.North })
		BindActorTriggers(unit)
		units[unit] = cells[i]
	end
	Actor435.Chronoshift(units)
	if not AlliedTechnologyCenter.IsDead then
		Trigger.AfterDelay(DateTime.Seconds(30), ChronoshiftSovietUnits) end
end

ChronoshiftSovietUnits2 = function()
	local spawn = Utils.Random(ChronoshiftSpawns3)
	local lz = Utils.Random(ParadropWaypoints)
	local cells = Utils.ExpandFootprint({ lz.Location }, false)
	local units = { }
	for i = 1, #cells do
		local unit = Actor.Create(spawn, true, { Owner = Soviets, Facing = Angle.North })
		BindActorTriggers2(unit)
		units[unit] = cells[i]
	end
	Actor435.Chronoshift(units)
	if not AlliedTechnologyCenter.IsDead then
		Trigger.AfterDelay(DateTime.Seconds(60), ChronoshiftSovietUnits2) end
end

SendAC130 = function()
	local lz = AlliedTechnologyCenterWaypoint
	AC130.TargetAirstrike(lz.CenterPosition, Angle.SouthWest)

	if not AlliedTechnologyCenter.IsDead then
		Trigger.AfterDelay(DateTime.Seconds(90), SendAC130) end
end

SendHyperion = function()
	local lz = HyperionWaypoint

	HyperionPower.TargetAirstrike(lz.CenterPosition, Angle.NorthEast)

	if not AlliedTechnologyCenter.IsDead then
		Trigger.AfterDelay(DateTime.Seconds(90), SendHyperion) end
end

DoColonyDrop = function()

	ColonyProxy.TargetDropPodsOW(Paradrop1.Location)
	ColonyProxy.TargetDropPodsOW(Paradrop2.Location)
	ColonyProxy.TargetDropPodsOW(Paradrop3.Location)
	ColonyProxy.TargetDropPodsOW(Paradrop4.Location)
	ColonyProxy.TargetDropPodsOW(Paradrop5.Location)
	ColonyProxy.TargetDropPodsOW(Paradrop6.Location)
	ColonyProxy.TargetDropPodsOW(Paradrop7.Location)
	ColonyProxy.TargetDropPodsOW(Paradrop8.Location)
	ColonyProxy.TargetDropPodsOW(Paradrop9.Location)
	ColonyProxy.TargetDropPodsOW(AttackDest.Location)

	Trigger.AfterDelay(425, function()
		Lighting.Red = 1.25
		Lighting.Green = 0.9
		Lighting.Blue = 0.7
		Lighting.Ambient = 0.55
	end)

end

WorldLoaded = function()
	Allies = Player.GetPlayer("Allies")
	Soviets = Player.GetPlayer("Soviets")

	HyperionPower = Actor.Create("powerproxy.hyperion", false, { Owner = Allies })
	AC130 = Actor.Create("powerproxy.ac130", false, { Owner = Soviets })

	SetupAlliedUnits()
	SetupSovietUnits()
	SetupFactories()
	ShipAlliedUnits()
	InsertAlliedChinookReinforcements(Chinook1Entry, Paradrop7)
	InsertAlliedChinookReinforcements(Chinook2Entry, AttackDest)
	PowerProxy = Actor.Create(ProxyType, false, { Owner = Soviets })
	ColonyProxy = Actor.Create("powerproxy.colonydrop", false, { Owner = Soviets })
	RandomSupport1 = Actor.Create("powerproxy.metalnuke", false, { Owner = Soviets })
	RandomSupport2 = Actor.Create("powerproxy.earthquake", false, { Owner = Soviets })
	ParadropSovietUnits()
	Trigger.AfterDelay(DateTime.Seconds(15), ChronoshiftAlliedUnits)
	Trigger.AfterDelay(DateTime.Seconds(20), ChronoshiftAlliedUnits2)
	Trigger.AfterDelay(DateTime.Seconds(30), ChronoshiftAlliedUnits3)
	Trigger.AfterDelay(DateTime.Seconds(20), ChronoshiftSovietUnits)
	Trigger.AfterDelay(DateTime.Seconds(30), ChronoshiftSovietUnits)
	Trigger.AfterDelay(DateTime.Seconds(40), ChronoshiftSovietUnits)
	Trigger.AfterDelay(DateTime.Seconds(55), ChronoshiftSovietUnits2)
	Trigger.AfterDelay(DateTime.Seconds(30), SendAC130)
	Trigger.AfterDelay(DateTime.Seconds(45), SendHyperion)
	Utils.Do(ProducedUnitTypes, ProduceUnits)
	Utils.Do(ProducedUnitTypes, ProduceUnits)

	SendSovietUnits(Entry1.Location, UnitTypes, 50)
	SendSovietUnits(Entry2.Location, UnitTypes, 50)
	SendSovietUnits(Entry3.Location, UnitTypes, 50)
	SendSovietUnits(Entry4.Location, UnitTypes, 50)
	SendSovietUnits(Entry5.Location, UnitTypes, 50)
	SendSovietUnits(Entry6.Location, UnitTypes, 50)
	SendSovietUnits(Entry2.Location, UnitTypes2, 60)
	SendSovietUnits(Entry4.Location, UnitTypes2, 60)
	SendSovietUnits(Entry5.Location, UnitTypes2, 60)
	SendSovietUnits(Entry6.Location, UnitTypes2, 60)
	SendSovietUnits(Entry6.Location, UnitTypes3, 75)
	SendSovietUnits(Entry7.Location, BeachUnitTypes, 25)
	SendSovietUnits(Entry8.Location, BeachUnitTypes, 25)
	SendSovietUnits(Entry8.Location, UnitTypes2, 30)
	SendSovietUnits(Entry7.Location, UnitTypes2, 30)

	Trigger.OnKilled(AlliedTechnologyCenter, DoColonyDrop)
end
