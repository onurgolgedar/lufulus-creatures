with (owner)
	rigidbody_set_definedstance(stSlowStoneMove2, sec/15)
	
delta_alarm(1, sec/15+delay)
delta_alarm(2, alarm[1]+delay)