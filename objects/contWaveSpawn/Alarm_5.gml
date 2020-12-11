if (isBreak and (!objPlayer.noArms or room == roomLufulus) and wave_no != wave_maxNo and alarm[10] == -1 and alarm[4] == -1) {
	//alarm[3] = -1
	delta_alarm(4, 5)
	lufulusWave_counter = 0
}

delta_alarm(5, sec/3)