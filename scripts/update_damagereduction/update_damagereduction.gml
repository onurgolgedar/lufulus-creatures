function update_damagereduction() {
	global.damageReduction = 0
	global.damageReduction += skill_get_value(objSkill_4, skill_get_upgrade(objSkill_4), type_value3)			                    *(1-global.damageReduction/100)

	if (instance_exists(objPlayer) and test_effectbox(efboxMainBS, objPlayer.id))
		global.damageReduction += efboxMainBS.myDmgRed		                                                                        *(1-global.damageReduction/100)
	
	global.damageReduction += extension_exists(ext_damageReduction15)*15											                *(1-global.damageReduction/100)

	if (!global.notRecalculateResultValues_sha)
		global.anticheat_resultValues = recalculate_sha_resultValues()


}
