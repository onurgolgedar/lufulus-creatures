function sound_play_at(sound, x, y, loop = false) {
	return audio_play_sound_at(sound, x, y, 0, 60, 1200, 1.9, loop, 1)
}
