function update_criticalfactor() {
	global.criticalFactor = calculate_criticalfactor()

	if (!global.notRecalculateResultValues_sha)
		global.anticheat_resultValues = recalculate_sha_resultValues()


}
