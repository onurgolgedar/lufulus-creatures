event_inherited()

if (mode == md_waiting and !stunned) {	
	if (ds_list_size(windows) == 0) {
		if (irandom(11) == 0 and anim_end()) {
			if (autoAnimChange and irandom(4) == 0) {
				var rnd = irandom(5)
	
				if (rnd == 0)
					rigidbody_set_definedstance_type1(stNormal)
				else if (rnd == 1)
					rigidbody_set_definedstance_type1(stNormal2) // ? need new
				else if (rnd < 4)
					rigidbody_set_definedstance_type1(stSerious)
				else
					rigidbody_noarms_type1()
			}
		
			if (irandom(3) == 0)
				targetAngle = baseAngle+choose(45, -45, -30, 30, -15, 15)
		}
	}
}