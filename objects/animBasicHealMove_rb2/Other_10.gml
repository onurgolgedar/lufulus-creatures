/// @description Start

with (owner)
	rigidbody_set_definedstance(stBasicHeal, sec/4)
	
delta_alarm(0, sec/4+delay+sec/4)