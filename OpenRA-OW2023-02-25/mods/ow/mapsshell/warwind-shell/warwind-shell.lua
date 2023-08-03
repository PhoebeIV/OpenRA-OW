
ticks = 0
speed = 5

Tick = function()
	ticks = ticks + 1

	local t = (ticks + 45) % (360 * speed) * (math.pi / 180) / speed;
	Camera.Position = viewportOrigin + WVec.New(6000 * math.sin(t), 4000 * math.cos(t), 0)

end


WorldLoaded = function()
	viewportOrigin = Camera.Position

end