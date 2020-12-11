if (!objPlayer.death) {
	var explosion = instance_create_layer(objPlayer.x, objPlayer.y, "lyAir", objMainBS_SO2)
	explosion.image_xscale = calculate_baseskill_range()
	explosion.image_yscale = explosion.image_xscale
	explosion.bar = global.skillBar
	explosion.upgrade = level

	if (global.gamepad_active)
		gamepad_set_vibration_ext(global.skillBar/100, global.skillBar/100, sec/4)

	with (explosion) {
		upgSk7 = other.upgSk7
		upgSk6 = other.upgSk6
		upgSk5 = other.upgSk5
	}
}
	
instance_destroy()