if (arrowEffect != pointer_null) {
	var effect_x = rh_center_x+lengthdir_x(68, dir)
	var effect_y = rh_center_y+lengthdir_y(68, dir)
	
	with (arrowEffect)
		if (part_system_exists(ps))
			part_system_position(ps, effect_x, effect_y)
}