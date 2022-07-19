/// @param delay*
function update_character() {

	if (argument_count == 0) {
		global.notRecalculateResultValues_sha = true
		update_extensions()
		update_stats()
		update_maxhealth()
		update_maxmana()
		update_physicalpower()
		update_criticalchance()
		update_attackspeed()
		update_magicalpower()
		update_armor()
		update_movementspeed()
		update_damagereduction()
		update_resistance()
		update_criticalfactor()
		global.notRecalculateResultValues_sha = false
		sync_localstats()

		global.anticheat_resultValues = recalculate_sha_resultValues()

		with (contGUi)
			event_perform(ev_other, ev_user0)
		
		with (objPlayer) {
			update_weight()
			range = baseRange
			if (extension_exists(ext_melee_range))
				range += round(baseRange*0.1)
			event_user(4)
		}
	}
	else
		with (contPlayer)
			alarm[7] = argument[0]


}
