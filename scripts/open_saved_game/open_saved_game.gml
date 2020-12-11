function open_saved_game() {
	global.saveNo = argument[0]

	audio_stop_sound(sndMusicBoss)
	audio_stop_sound(sndMusicCastle)
	audio_stop_sound(sndMusicClassic_calm)
	audio_stop_sound(sndMusicMenu)

	load_all(argument[0])

	with (contMain)
		event_perform(ev_other, ev_user0)
	
	with (contPlayer)
		handle_outfight()

	// Quest Room Control
	var _room = get_location(global.locationName)
	if (_room == roomCave) {
		_room = roomCastle_area
		global.locationName = get_location(_room)
	}
	else if (_room == roomCamp1) {
		_room = roomCastle_area
		global.locationName = get_location(_room)
	}
	else if (_room == roomRebelWar) {
		_room = roomCastle_area
		global.locationName = get_location(_room)
	}
	else if (_room == roomRebelWar2) {
		_room = roomCastle_area
		global.locationName = get_location(_room)
	}
	else if (_room == roomLufulus) {
		_room = roomCastle2_area
		global.locationName = get_location(_room)
	}

	with (contMain)
		event_perform(ev_other, ev_user0)
	
	room_goto(_room)

	ini_open(string(global.steamID)+"\\options.lufsav")
		ini_write_string("24x131ax", "f1w2axhkt", argument[0])
	ini_close()


}
