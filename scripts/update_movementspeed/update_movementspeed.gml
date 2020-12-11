function update_movementspeed() {
	if (instance_exists(objPlayer)) {
		var noArms_mode = objPlayer.noArms
		global.movementSpeed = 5.3+IS_MOBILE*0.3
		global.movementSpeed *= (1+global.dex*0.005-!(objPlayer.shiftMode and contPlayer.shiftNoSlow_extension)*!noArms_mode*(global.clothesSlow/100+global.weaponSlow/100)+extension_exists(ext_speed7)*7/100+extension_exists(ext_med_archblue)*5/100)

		if (noArms_mode)
			global.movementSpeed += 1

		global.movementSpeed += global.add_speed

		if (!global.notRecalculateResultValues_sha)
			global.anticheat_resultValues = recalculate_sha_resultValues()
	}


}
