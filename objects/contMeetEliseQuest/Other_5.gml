for (var i = 0; i < 4; i++) {
	if (sound[i] != pointer_null)
		audio_stop_sound(sound[i])
}

global.immortality = beforeImmortality
global.showGUI = beforeShowGUI
global.add_expRatio = beforeExpRatio
global.anticheat_adds = recalculate_sha_adds()