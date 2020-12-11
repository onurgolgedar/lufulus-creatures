function start_room_music() {
	var music = pointer_null

	if (room == roomMenu or room == roomOptions)
		music = sndMusicMenu
	else if (is_castle(room))
		music = sndMusicCastle
	
	if (music != pointer_null)
		audio_play_sound(music, 10, true)


}
