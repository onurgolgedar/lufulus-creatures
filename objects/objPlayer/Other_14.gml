if (stance == stShieldMode) {
	with (objShield_sdest)
		alarm[0] = 1
	
	if (has_active_sweapon())
		rigidbody_set_definedstance_type1(stBasicAttackBase_ohsword, sec/10)
	else
		rigidbody_set_definedstance_type1(stBasicAttackBase_shieldOnly, sec/10)
}