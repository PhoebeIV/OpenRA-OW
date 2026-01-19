FCOMS = { FCOM1, FCOM2, FCOM3, FCOM4, FCOM5, FCOM6, FCOM7, FCOM8, FCOM9 , FCOM10,  FCOM11, FCOM12 }

BindActorTriggers = function(a)
	if a.HasProperty("Hunt") then
		if a.Owner == TopGuy or a.Owner == BottomGuy then
			Trigger.OnIdle(a, function(a)
				if a.IsInWorld then
					a.Hunt()
				end
			end)
		end	
	end
end

SetupForwardCommands = function()
	Utils.Do(FCOMS, function(production)
		Trigger.OnProduction(production, function(_, a) BindActorTriggers(a) end)
	end)
end


WorldLoaded = function()
	DoBaseScriptLoad()

	TopGuy = Player.GetPlayer("TopGuy")
	BottomGuy = Player.GetPlayer("BottomGuy")

	SetupForwardCommands()

	TopWeap1.RallyPoint = BottomLane1.Location
	TopWeap2.RallyPoint = BottomLane2.Location
	TopWeap3.RallyPoint = BottomLane3.Location
	TopWeap4.RallyPoint = BottomLane4.Location
	TopBarr1.RallyPoint = BottomLane1.Location
	TopBarr2.RallyPoint = BottomLane2.Location
	TopBarr3.RallyPoint = BottomLane3.Location
	TopBarr4.RallyPoint = BottomLane4.Location

	BotWeap1.RallyPoint = TopLane1.Location
	BotWeap2.RallyPoint = TopLane2.Location
	BotWeap3.RallyPoint = TopLane3.Location
	BotWeap4.RallyPoint = TopLane4.Location
	BotBarr1.RallyPoint = TopLane1.Location
	BotBarr2.RallyPoint = TopLane2.Location
	BotBarr3.RallyPoint = TopLane3.Location
	BotBarr4.RallyPoint = TopLane4.Location

end