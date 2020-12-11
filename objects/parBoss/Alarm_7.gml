event_inherited()

if (mode == md_attack and hp > maxHp*0.75) {
	if (!audio_is_playing(sndMusicBoss))
		audio_play_sound(sndMusicBoss, 10, false)
}