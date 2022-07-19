if (is_room_out() or global.consoleMode or contGUi.roomNameAlpha > 0.6)
	exit
	
if (global.pause)
	exit

if (instance_exists(objMap)) {
    with (objMap)
		alarm[1] = 1
}
else {
	if (!is_outfight() and !instance_exists(contWarzone))
		show_messagebox(200, 200, eng() ? "It is not allowed when you are in fight." : "Bu işlem savaş sırasında yapılamaz.", eng() ? "Not Allowed" : "İşlem Gerçekleştirilemedi", sec)
	else {
	    instance_create_layer(display_get_gui_width()/2/*432+150*/, display_get_gui_height()/2, "lyNirvana", objMap)
		audio_play_sound(sndWindowTick, 1, 0)
	}
}