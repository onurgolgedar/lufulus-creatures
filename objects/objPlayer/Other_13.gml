if (has_shield() and clickattack_basic_conditions(true) and stance != stShieldMode) {
	rigidbody_set_definedstance_type1(stShieldMode, sec/3)
	
	if (animationController != pointer_null)
		instance_destroy(animationController)
}
else if (IS_MOBILE)
	contPlayer.fixedShieldMode = false