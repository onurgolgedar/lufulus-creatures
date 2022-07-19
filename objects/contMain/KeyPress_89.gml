if (is_room_out() or global.consoleMode)
	exit
	
if (global.pause)
	exit
	
if (!isActive_skills) {
	show_messagebox(contGUi.sLogoX-20, display_get_gui_height()-215, eng() ? "Skills will be available when the character\ndiscovers himself. (Aproximation: Level 13)" : "Beceriler karakter kendini keşfettiğinde\nhazır olacak. (Yaklaşık: Seviye 13)", eng() ? "Not Ready" : "Hazır Değil", sec*4)
	exit
}

if (instance_exists(objSkillTable)) {
	with (objSkillTable)
		close_table()
}
else {
	instance_create_layer(20, 259-IS_MOBILE*250, "lyWindows", objSkillTable)
	audio_play_sound(sndWindowTick, 1, 0)
}