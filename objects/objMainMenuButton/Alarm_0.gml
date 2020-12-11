var randomVar = irandom(6)

if (randomVar == 0)
	rigidbody_set_definedstance(stBase, irandom_range(sec, sec*2))
else if (randomVar == 1)
	rigidbody_set_definedstance(stBase2, irandom_range(sec, sec*2))
else if (randomVar == 2)
	rigidbody_set_definedstance(stBase3, irandom_range(sec, sec*2))
	
alarm[0] = irandom_range(sec, sec*2)