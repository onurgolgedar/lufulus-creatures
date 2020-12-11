if (isRoomOut or global.consoleMode)
	exit
	
if (global.pause)
	exit

if (instance_exists(objCharacterWindow)) {
    with (objCharacterWindow)
		close_table()
}
else {
    instance_create_layer(20, 249-IS_MOBILE*190, "lyWindows", objCharacterWindow)
	audio_play_sound(sndWindowTick, 1, 0)
}