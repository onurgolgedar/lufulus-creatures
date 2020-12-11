with (owner)
	rigidbody_set_definedstance(isRightHanded ? stBaRanged2_right : stBaRanged2_left, sec/15)
	
delta_alarm(1, sec/15+delay)
delta_alarm(2, (sec/15+delay)+delay)