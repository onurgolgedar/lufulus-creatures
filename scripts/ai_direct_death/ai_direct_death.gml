function ai_direct_death() {
	drop_lists_clear()
	alarm[7] = -1
	death = true

	var ds_size = ds_list_size(rigidbodyParts)
	for (var rb = 0; rb < ds_size; rb++) {
		var part = ds_list_find_value(rigidbodyParts, rb)
		if (part != pointer_null) {
			with (part) {
				physics_joint_set_value(joint, phy_joint_angle_limits, false)
				joint = pointer_null
				
				active = false
			}
		}
	}


}
