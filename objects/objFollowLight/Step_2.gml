if (sl_light_refresh) {
	if (owner != -1 and instance_exists(owner)) {
		x = owner.x
		y = owner.y
	}
	else if (owner != -1 and !manualDestroy) {
		alarm[0] = 8
		owner = -1
	}
	
	sl_light_x = x
	sl_light_y = y
}