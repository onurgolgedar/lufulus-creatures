function ai_reset_skills() {
	if (abilityEarthMove) {
		earthmove_initiate()
	
		with (objEarthMove_SO)
			if (owner == other.id)
				instance_destroy()
	}

	if (abilityShock)
		shock_initiate(shockPower)

	if (abilityRofux)
		rofux_initiate(rofuxDamage)

	if (abilityLaser)
		laser_initiate(laserDamage, laserDuration)


}
