function rigidbody_set_baBase() {
	var duration_rs

	if (argument_count == 2)
		duration_rs = argument[0]
	else
		duration_rs = sec/4

	if (rigidbodyType == 2)
		rigidbody_set_definedstance(stBase, duration_rs)
	else if (rigidbodyType == 1) {
		if (isRanged)
			rigidbody_set_definedstance(stBasicAttackBase_crossbow, duration_rs)
		else
			rigidbody_set_definedstance(stBasicAttackBase_ohsword_calm, duration_rs)
	}


}
