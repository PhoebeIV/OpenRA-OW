--[[
   Copyright 2007-2022 The OpenRA Developers (see AUTHORS)
   This file is part of OpenRA, which is free software. It is made
   available to you under the terms of the GNU General Public License
   as published by the Free Software Foundation, either version 3 of
   the License, or (at your option) any later version. For more
   information, see COPYING.
]]

UnitTypes = { "zhydra", "zhydra", "zhydra", "zhydra" }
BeachUnitTypes = { "zultra","zultra" }

AlliedUnitTypes = { "pzealot", "pzealot", "pzealot", "pzealot", "pdrago" }

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

SendSovietUnits = function(entryCell, unitTypes, interval)
	local units = Reinforcements.Reinforce(soviets, unitTypes, { entryCell }, interval)
	Utils.Do(units, function(unit)
		BindActorTriggers(unit)
	end)
	Trigger.OnAllKilled(units, function() SendSovietUnits(entryCell, unitTypes, interval) end)
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

WorldLoaded = function()
	allies = Player.GetPlayer("Defender")
	soviets = Player.GetPlayer("Attacker")

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
