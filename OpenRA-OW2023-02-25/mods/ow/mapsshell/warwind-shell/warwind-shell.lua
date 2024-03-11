
ticks = 0
speed = 5

Tick = function()
	ticks = ticks + 1

	local t = (ticks + 45) % (360 * speed) * (math.pi / 180) / speed;
	Camera.Position = viewportOrigin + WVec.New(6000 * math.sin(t), 4000 * math.cos(t), 0)

end

InitPlayers = function()
	GDI = Player.GetPlayer("GDI")
	Nod = Player.GetPlayer("Nod")

	GDI.GrantCondition("enable-medium-ai",0)
	GDI.GrantCondition("enable-all-ai",0)
	Nod.GrantCondition("enable-medium-ai",0)
	Nod.GrantCondition("enable-all-ai",0)

	Nod.Cash = 10000
	GDI.Cash = 10000
end

WorldLoaded = function()
	viewportOrigin = Camera.Position

	InitPlayers()
end