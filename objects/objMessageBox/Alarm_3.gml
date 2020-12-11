var decrease
if (contMain.isRoomOut and !global.pause)
	decrease = delta()
else
	decrease = delta()*(!contPlayer.onDialogue)*!drag*!timeStopped

if (time-decrease > 0) {
	if (!soundPlayed and decrease > 0) {
		audio_play_sound(sndWindowTick, 1, 0)
		soundPlayed = true
	}

	time -= decrease
	
	alarm[3] = 1
}
else if (time != -1) {
	time -= decrease
	destroy = true
	alarm[2] = 1
}