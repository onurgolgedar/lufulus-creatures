if (!stop) {
	if (instance_exists(target)) {
		part_system_position(ps, target.x, target.y)
		
		var dir = point_direction(target.x, target.y, owner.x, owner.y)
		part_type_gravity(pt_pullEffect, 0.9, dir)

		size += 0.009
		part_type_size(pt_pullEffect, size, size+0.06, -0.068, 0);
		
		part_emitter_burst(ps, pe_pullEffect, pt_pullEffect, 1)
	}
	else
		part_emitter_destroy(ps, pe_pullEffect)
}

event_inherited()