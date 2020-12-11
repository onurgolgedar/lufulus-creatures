if (instance_exists(target) and !stop and target.mana > target.maxMana/50) {
	part_emitter_region(ps, pe_manaParticleMain, target.x-8, target.x+8, target.y-8, target.y+8, ps_shape_rectangle, ps_distr_linear);
	
	var dir = point_direction(target.x, target.y, owner.x, owner.y)
	part_type_direction(pt_manaParticleMain, dir, dir, 0, 0);

	if (point_distance(target.x, target.y, owner.x, owner.y) < sv_soulSteal_range)
		part_emitter_burst(ps, pe_manaParticleMain, pt_manaParticleMain, 1);
}

event_inherited()