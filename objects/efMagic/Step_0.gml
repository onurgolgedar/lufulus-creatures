if (target == pointer_null) 
	part_system_position(ps, x, y)
else if (instance_exists(target)) {
	part_system_position(ps, target.x, target.y)
	part_type_size(pt_Effect1, 0.15+0.35*image_xscale, 0.2+0.5*image_xscale, 0, 0.2+0.2*image_xscale);
}
else
	part_emitter_destroy(ps, pe_Effect1)
	
event_inherited()