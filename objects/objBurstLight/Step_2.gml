if (sl_light_refresh) {
	if (!noOwner) {
		if (owner != -1 and instance_exists(owner)) {
			x = owner.x
			y = owner.y
		}
		else if (owner != -1) {
			alarm[0] = min(10, alarm[0])
			owner = -1
		}
	}
	
	sl_light_x = x
	sl_light_y = y
	
	var durationRatio = alarm[0]/maxDuration
	if (durationRatio <= 0.7) {
		if (durationRatio <= 0.5) {
			sl_light_xscale = maxScale*durationRatio/0.5
			sl_light_yscale = sl_light_xscale
		}
		
		sl_light_power = maxPower*durationRatio/0.7
	}
}