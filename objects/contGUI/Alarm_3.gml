if (roomNameAlpha-0.06 > 0) {
	roomNameAlpha -= 0.06
	alarm[3] = 2
}
else {
	roomNameAlpha = 0
	
	if (surface_exists(textShadow_surface))
		free_surface(textShadow_surface)
}