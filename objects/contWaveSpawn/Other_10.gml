if (room != roomLufulus) {
	with (objPlayer)
		rigidbody_noarms_type1()
	
	experienceGiven = ceil(calculate_level_exp(level)/(17-wave_no*1.5)*(1+isDestroyedMap))

	var ltext
	ltext[0] = eng() ? ("You earned [c="+string(c_aqua)+"]"+string(experienceGiven)+" bonus exp[/c].") : ("Ekstra [c="+string(c_aqua)+"]"+string(experienceGiven)+" tecrübe[/c] daha kazandın.")
	ltext[1] = eng() ? ("[c="+string(c_white)+"]Wave "+string(wave_no)+"/"+string(wave_maxNo)+" is finished![/c]") : ("[c="+string(c_white)+"]Dalga "+string(wave_no)+"/"+string(wave_maxNo)+" tamamlandı![/c]")

	show_messagebox(420, 350, ltext[0], ltext[1], sec*3.5)
	
	with (objPlayer) {
		change_hp(global.maxHp)
		change_mana(global.maxMana)
	}
	
	if (wave_no == wave_maxNo) {
		areAllWavesFinished = true
			
		quest_progress(objQuest_wave, 1)
		
		if (room == roomWave2)
			quest_progress(objChallenge_wave, 1)
		
		if (!global.isCheated and !steam_get_achievement("champion"))
			steam_set_achievement("champion")
			
		if (!isDestroyedMap)
			ds_list_add(global.destroyedMaps, room)
	}
}
	
delta_alarm(2, sec)
alarm[9] = 3
delta_alarm(10, 1*sec)