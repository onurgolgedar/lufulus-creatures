/// @description Start

with (owner)
	rigidbody_set_definedstance(isRightHanded ? stBaRanged_right : stBaRanged_left, sec/15)
	
delta_alarm(0, sec/15+delay)