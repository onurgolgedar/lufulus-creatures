if (!objPlayer.noArms or room == roomLufulus) {	
	blacksmithQuest_exists = is_quest_incomplete(objQuest_blacksmith)
	if (blacksmithQuest_exists) {
		with (parAi) {
			var myID = id
			if (hasDropList) {
				var deleted = remove_dropped(objSw_001Q)
				
				if (deleted) {
					with (objTradeWindow)
						if (owner == myID)
							close_table()
				}
			}
		}
				
		blacksmithQuest_dropped = false
	}
	
	wave_started = true
	delta_alarm(0, 1*sec)
	delta_alarm(1, 3*sec)
	
	wave_no++
	wave_cycle = 0
	
	if (wave_no == wave_maxNo-2 and !audio_is_playing(sndMusicBoss))
		audio_play_sound(sndMusicBoss, 10, true)
	
	if (wave_no == 1 or wave_no == 2)
		wave_maxCycle = 3
	else if (wave_no == 3)
		wave_maxCycle = 5
	else if (wave_no == 4)
		wave_maxCycle = 7
	
	if (questionBox != pointer_null and instance_exists(questionBox))
		with (questionBox)
			close_window()
}