global.lightActive = lightActive_before
if (!global.pause) {
	if (!IS_MOBILE)
		application_surface_draw_enable(true)
	
	with (contFloor)
		drawPaths = true
}