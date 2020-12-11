if (instance_exists(owner)) {
	x = owner.x
	y = owner.y
	image_angle = owner.image_angle

	with (owner)
		earthmove_change(-irandom_range(15, 30), 1)

	if (!owner.death and owner.target != pointer_null
	and place_meeting(x, y, owner.target)
	and !collision_line(x, y, owner.target.x, owner.target.y, parSolid, 1, 0))
		with (owner.target) {
			attacked(other.owner.physicalPower*2, other.owner, false)
			add_effectbox(efboxStun)
		}
}

instance_destroy()