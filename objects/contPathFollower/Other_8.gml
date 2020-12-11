pathEnd = true
path_speed = 0

if (point_distance(x, y, owner.x, owner.y) > 60 and owner.type != type_npc) {
	with (owner) {
		physics_apply_impulse(x, y, lengthdir_x(totalMass*9, targetPointDir),
		lengthdir_y(totalMass*9, targetPointDir))
	}
}
