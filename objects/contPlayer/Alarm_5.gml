if (global.comboCount > 1) {
	change_exp(global.comboExperience)

	audio_play_sound(sndCombo, 1, 0)
	
	global.comboExperience = 0
	global.comboBaseExperience = 0
}

global.comboCount = 0