with (owner)
	rigidbody_set_definedstance(stBrainAttack2, sec*2/4)

if (repeatAnimation > 0)
	delta_alarm(1, sec*2/4+delay+sec/4)
else
	delta_alarm(2, 1)
	
repeatAnimation--