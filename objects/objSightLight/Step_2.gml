if (sl_light_refresh) {
	if (owner != -1 and instance_exists(owner)) {
		x = owner.x
		y = owner.y
		sl_light_angle = owner.image_angle
		
		sl_light_active = owner.mode != md_attack and !owner.death
	}
	else if (owner != -1) {
		alarm[0] = 8
		owner = -1
	}
	
	sl_light_x = x
	sl_light_y = y
}