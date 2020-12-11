owner.stunned = !(owner.object_index == objPlayer and (global.stunResistance or contPlayer.broccoliMode))

if (owner.object_index == objPlayer) {
	if (extension_exists(ext_tenacity))
		time = round(time/2)
		
	if (extension_exists(ext_shift_tenacity))
		time = round(time*2/10)
		
	if (time > 0.1*sec and time <= 2.5*sec) {
		if (global.gamepad_active) {
			var vibration = clamp(time+0.05*sec, 0, 1)
			gamepad_set_vibration_ext(vibration, vibration, sec/6+time/3)
		}
	}
		
}