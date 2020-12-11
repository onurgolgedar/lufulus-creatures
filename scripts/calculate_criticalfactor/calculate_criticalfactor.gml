function calculate_criticalfactor() {
	return 0.75-has_shield()*0.25
		   +skill_get_value(objSkill_3, skill_get_upgrade(objSkill_3), type_value3)/100


}
