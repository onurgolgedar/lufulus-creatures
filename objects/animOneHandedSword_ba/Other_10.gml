/// @description Start

with (owner) {
	if (basicAttackStyle == 0)
		rigidbody_set_definedstance_type1(stBeforeBasicAttack_ohsword, sec/20)
	else if (basicAttackStyle == 1)
		rigidbody_set_definedstance_type1(stBeforeBasicAttack_ohsword_2, sec/20)
	else if (basicAttackStyle == 2)
		rigidbody_set_definedstance_type1(stBeforeBasicAttack_ohsword_3, sec/20)
}

delta_alarm(0, sec/20+delay*2)