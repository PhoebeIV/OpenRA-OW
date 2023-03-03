--[[Tick = function()
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
end]]

ClearWeather = function()
	--Media.DisplayMessage("Weather: Clear")
	if IonStorm then
		IonStorm = false
		Lighting.Flash("LightningStrike",1)
	end
	
	TargetRed = 0.0
	TargetGreen = 0.0
	TargetBlue = 0.0
	TargetAmbient = 0.0
end

IonStormWarning = function()
	Media.DisplayMessage("Warning: Ion Storm approaching.")
	TargetRed = 0.5
	TargetGreen = 0.5
	TargetBlue = -0.5
	TargetAmbient = -0.5
	Trigger.AfterDelay(DateTime.Seconds(15), function() Media.DisplayMessage("Warning: Ion Storm approaching.") end)
	Trigger.AfterDelay(DateTime.Seconds(30), function() IonStormStart() end)
end

IonStormStart = function()
	IonStorm = true
	Media.DisplayMessage("Warning: An Ion Storm is here!")
	Lighting.Flash("LightningStrike",1)
end

IonStormLightning = function()
	local StrikeType = Utils.RandomInteger(0, 100)
	local delay = Utils.RandomInteger(1, 10)
	
	if (StrikeType == 10) then
		Lighting.Flash("LightningStrike", delay)
	end
	if (StrikeType <= 10) then
		Actor.Create("Lightning", true, { Owner = Neutral, Location = Map.RandomCell() })
		Actor.Create("Lightning", true, { Owner = Neutral, Location = Map.RandomCell() })
		Actor.Create("Lightning", true, { Owner = Neutral, Location = Map.RandomCell() })
		Actor.Create("Lightning", true, { Owner = Neutral, Location = Map.RandomCell() })
		Actor.Create("Lightning", true, { Owner = Neutral, Location = Map.RandomCell() })
		Trigger.AfterDelay(delay, function()
			Media.PlaySound("expnew" .. Utils.RandomInteger(16,19) .. ".aud")
		end)
	end
end

--[[WeatherMeteors = function()
	if (Utils.RandomInteger(1, 200) == 10) then
		Actor.Create("Meteor", true, { Owner = Neutral, Location = Map.RandomCell() })
	end
end]]

ChangeWeather = function()
	local WeatherType = Utils.RandomInteger(0, 2)
	--Media.DisplayMessage("Switching to weather type " .. WeatherType)
	
	if WeatherType == 0 then ClearWeather()
	elseif (WeatherType == 1 and IonStorm == false) then IonStormWarning() end
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

Tick = function()
	if (Utils.RandomInteger(0, 200) == 1 and WeatherDuration >= WeatherChangeThreshold) then
		WeatherDuration = 0
		ChangeWeather()
	end
	
	WeatherDuration = WeatherDuration + 1
	
	if IonStorm then IonStormLightning() end
	--if Meteors then WeatherMeteors() end
	
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

WeatherDuration = 0
WeatherChangeThreshold = 3000

IonStorm = false
--Meteors = false

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
	Neutral = Player.GetPlayer("Neutral")
	Time = Utils.RandomInteger(0, SunRise)
	if (Time >= SunSet) then
		Lighting.Red = 0.75
		Lighting.Green = 0.85
		Lighting.Blue = 1.5
		Lighting.Ambient = 0.75
	end
end