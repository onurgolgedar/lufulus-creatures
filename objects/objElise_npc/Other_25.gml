event_inherited()

if (room == roomCreature4) {
	audio_play_sound(sndFailure, false, false)
	
	show_messagebox(300, 300, eng() ? (name+" is dead.") : (name+" öldü."), eng() ? "Failed" : "Başarısız")
	
	change_location(room, global.locationName, sec*1)
}