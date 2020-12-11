if (is_room_out() or global.consoleMode)
	exit

if (global.pause)
	exit

if (instance_exists(objQuestTable)) {
	with (objQuestTable)
		close_table()
}
else {
	instance_create_layer(20, 252-IS_MOBILE*220, "lyWindows", objQuestTable)
	audio_play_sound(sndWindowTick, 1, 0)
}