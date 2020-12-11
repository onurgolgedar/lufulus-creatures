event_inherited()

if (importance) {
	audio_play_sound(sndFailure, false, false)
	
	show_messagebox(300, 300, eng() ? ("The soldier is dead.") : ("Asker öldü."), eng() ? "Failed" : "Başarısız")
	
	delete_quest(get_quest_number(objQuestRoad_scout))
	delete_quest(get_quest_number(objQuestRoad_scout2))
	delete_quest_finished(objQuestRoad_scout)
	delete_quest_finished(objQuestRoad_scout2)
	
	change_location(room, global.locationName, sec*2)
}