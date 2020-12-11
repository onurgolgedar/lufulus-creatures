function update_resistance() {
	global.resistance = skill_get_value(objSkill_4, skill_get_upgrade(objSkill_4), type_value2)
	+extension_exists(ext_resistance10)*10+extension_exists(ext_resistance18)*18+extension_exists(ext_resistance26)*26

	if (!global.notRecalculateResultValues_sha)
		global.anticheat_resultValues = recalculate_sha_resultValues()


}
