if (!stop) {
	if (target == pointer_null) 
		part_system_position(ps, x, y)
	else if (instance_exists(target)) {
		if (angular_offset == unique_number)
			part_system_position(ps, target.x, target.y)
		else
			part_system_position(ps, target.x+lengthdir_x(angular_offset, target.image_angle), target.y+lengthdir_y(angular_offset, target.image_angle))
	}
	else {
		part_emitter_destroy(ps, pe_Sharp)
		part_emitter_destroy(ps, pe_Soft)
	}
}
	
event_inherited()