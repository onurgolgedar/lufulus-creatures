/// @description Main Loop

with (objPlayer) {
	if (shiftMode)
		shiftDecrease = baseShiftDecrease*(1-1/3*extension_exists(ext_shift_longer))*(1-1/2*other.galaxy_extension)
	
	var healthReg = maxHp/100*(0.30+((contPlayer.upgSk4 > 0) ? skill_get_value(objSkill_4, contPlayer.upgSk4, type_value)/2 : 0))
	
	if (extension_exists(ext_regenerate_missing))
		healthReg += (maxHp-hp)/40
	
	var manaReg = maxMana/50*(1+other.masterMage_extension*0.2)
	
	if (healthReg > 0)
		change_hp(healthReg*(1+IS_MOBILE))
	change_mana(manaReg)
}

if (irandom(20) == 0 and objPlayer.image_speed == 0)
	objPlayer.image_speed = 0.85

if (!is_room_out() and !global.isCheated) {
	if (global.anticheat_adds != recalculate_sha_adds() or
	global.anticheat_stats != recalculate_sha_stats() or
	global.anticheat_skillPoints != recalculate_sha_skillPoints() or
	global.anticheat_resultValues != recalculate_sha_resultValues() or 
	global.anticheat_hour != recalculate_sha_time() or 
	global.anticheat_game_score != recalculate_sha_game_score() or
	global.anticheat_ownings != recalculate_sha_ownings()) {
		global.isCheated = true
		save_anticheat(global.saveNo)
	}
}
		
delta_alarm(6, sec/2)