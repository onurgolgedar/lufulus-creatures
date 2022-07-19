if (isRoomOut or global.consoleMode)
	exit
	
if (global.pause)
	exit

if (instance_exists(objitemBag)) {
	with (objitemBag)
		close_table()
}
else {
	/*if (!is_outfight())
		show_messagebox(200, 200, eng() ? "It is not allowed when you are in fight." : "Bu işlem savaş sırasında yapılamaz.", eng() ? "Not Allowed" : "İşlem Gerçekleştirilemedi", sec)
	else {*/
		instance_create_layer(20, 245-IS_MOBILE*180, "lyWindows", objitemBag)
		
		audio_play_sound(sndWindowTick, 1, 0)
	//}
}