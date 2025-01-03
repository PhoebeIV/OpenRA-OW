
ticks = 0
speed = 5

Tick = function()
	ticks = ticks + 1

	local t = (ticks + 45) % (360 * speed) * (math.pi / 180) / speed;
	Camera.Position = viewportOrigin + WVec.New(11200 * math.sin(t), 12480 * math.cos(t), 0)
end

WorldLoaded = function()
	viewportOrigin = Camera.Position
end
