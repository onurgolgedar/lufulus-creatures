if (target == pointer_null) 
	part_system_position(ps, x, y)
else if (instance_exists(target))
	part_system_position(ps, target.x, target.y)
else
	part_emitter_destroy(ps, pe_Effect1)
	
event_inherited()