NaziInfantryTypes = {"e1","e1","e1","e1","e1","e1","e1","e1","e1of"}
NaziVehicleTypes = {"mtnkd.shd","mtnkd.shd","mtnkd.shd","mtnkd.shd","3tnk.nz"}
NaziSuperInfantry = {"nbos1","nbos1","nbos1","nbos1","nbos1"}
NaziSuperVehicle = {"maus"}

FederationInfantryTypes = {"fe2","fe2","fe2","fe2","fe2"}
FederationVehicleTypes = {"btnk","btnk","mornstar","mornstar"}
FederationFastVehicle = {"speeder","speeder","speeder","speeder"}
FederationSuperVehicle = {"fcru","fcru"}

NaziProxyType = "powerproxy.naziparatroopers"
FedProxyType = "powerproxy.fedparatroopers"
ProducedUnitTypes =
{
	{ factory = FederationBarracks1, types = { "fe1", "fe2", "fe3", "fe4" } },
	{ factory = FederationBarracks2, types = { "fe1", "fe2", "fe3", "fe4" } },
	{ factory = NaziWarFactory1, types = { "mtnkd.shd", "2tnk.nz", "3tnk.nz", "arty.ss" } }
}

NaziParadropWaypoints = { NaziParadrop1, NaziParadrop2 }
FederationParadropWaypoints = { FederationParadrop1, FederationParadrop2 }

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

SendNaziUnits = function(entryCell, unitTypes, interval, target)
	local units = Reinforcements.Reinforce(nazi, unitTypes, { entryCell }, interval)
	Utils.Do(units, function(unit)
		BindActorTriggersTarget(unit, target)
	end)
	Trigger.OnAllKilled(units, function() SendNaziUnits(entryCell, unitTypes, interval, target) end)
end

SendFederationUnits = function(entryCell, unitTypes, interval, target)
	local units = Reinforcements.Reinforce(federation, unitTypes, { entryCell }, interval)
	Utils.Do(units, function(unit)
		BindActorTriggersTarget(unit, target)
	end)
	Trigger.OnAllKilled(units, function() SendFederationUnits(entryCell, unitTypes, interval, target) end)
end

SendSuperUnits = function()
	SendNaziUnits(EntryLeft4.Location, NaziSuperInfantry, 30, EntryRight)
	SendNaziUnits(EntryLeft3.Location, NaziSuperVehicle, 30, EntryRight)
	SendFederationUnits(EntryRight4.Location, FederationFastVehicle, 30, EntryLeft)
	SendFederationUnits(EntryRight3.Location, FederationSuperVehicle, 30, EntryLeft)
end

--[[
SetupUnits = function()
	Utils.Do(Map.NamedActors, function(a)
		if a.Owner == federation and a.HasProperty("AcceptsUpgrade") and a.AcceptsUpgrade("unkillable") then
			a.GrantUpgrade("unkillable")
			a.Stance = "Defend"
		end

		if a.Owner == nazi and a.HasProperty("AcceptsUpgrade") and a.AcceptsUpgrade("unkillable") and a.Type ~= "nbos6" then
			a.GrantUpgrade("unkillable")
			a.Stance = "Defend"
		end
	end)
end
]]

ParadropNaziUnits = function()
	local lz = Utils.Random(NaziParadropWaypoints)
	local aircraft = powerproxy1.TargetParatroopers(lz.CenterPosition)

	Utils.Do(aircraft, function(a)
		Trigger.OnPassengerExited(a, function(t, p)
			BindActorTriggers(p)
		end)
	end)
end

ParadropFedUnits = function()
	local lz = Utils.Random(FederationParadropWaypoints)
	local aircraft = powerproxy2.TargetParatroopers(lz.CenterPosition)

	Utils.Do(aircraft, function(a)
		Trigger.OnPassengerExited(a, function(t, p)
			BindActorTriggers(p)
		end)
	end)
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

SetupFactories = function()
	Utils.Do(ProducedUnitTypes, function(production)
		Trigger.OnProduction(production.factory, function(_, a) BindActorTriggers(a) end)
	end)
end

WeatherThunderStorm = function()
	if (Utils.RandomInteger(1, 200) == 10) then
		local delay = Utils.RandomInteger(1, 10)
		Lighting.Flash("LightningStrike", delay)
		Trigger.AfterDelay(delay, function()
			Media.PlaySound("thunder" .. Utils.RandomInteger(1,6) .. ".aud")
		end)
	end
	if (Utils.RandomInteger(1, 200) == 10) then
		Media.PlaySound("thunder-ambient.aud")
	end
end

ThunderStorm = true

ticks = 0
speed = 7

Tick = function()
	if ThunderStorm then
		WeatherThunderStorm()
	end
	ticks = ticks + 1

	local t = (ticks + 45) % (360 * speed) * (math.pi / 180) / speed;
	Camera.Position = viewportOrigin + WVec.New(29200 * math.sin(t), 10480 * math.cos(t), 0)
end

WorldLoaded = function()
	nazi = Player.GetPlayer("Nazi")
	federation = Player.GetPlayer("Federation")
	viewportOrigin = Camera.Position

	SetupFactories()
	powerproxy1 = Actor.Create(NaziProxyType, false, { Owner = nazi })
	powerproxy2 = Actor.Create(FedProxyType, false, { Owner = federation })
	ParadropNaziUnits()
	ParadropFedUnits()
	Utils.Do(ProducedUnitTypes, ProduceUnits)

	SendNaziUnits(EntryLeft.Location, NaziInfantryTypes, 30, EntryRight)
	SendNaziUnits(EntryLeft2.Location, NaziVehicleTypes, 30, EntryRight)
	SendNaziUnits(EntryTopLeft.Location, NaziInfantryTypes, 30, EntryRight)
	SendNaziUnits(EntryBottom.Location, NaziInfantryTypes, 30, FederationOutpost)

	SendFederationUnits(EntryRight.Location, FederationInfantryTypes, 30, EntryLeft)
	SendFederationUnits(EntryRight2.Location, FederationVehicleTypes, 30, NaziBaseUpper)
	SendFederationUnits(EntryRight3.Location, FederationInfantryTypes, 30, EntryBottom)
	SendFederationUnits(EntryTopRight.Location, FederationInfantryTypes, 30, NaziBaseLower)

	Trigger.AfterDelay(DateTime.Seconds(60), SendSuperUnits)
end
