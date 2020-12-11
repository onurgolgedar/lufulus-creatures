if (global.gamepad_active) {
	global.gamepad_active = false
	global.mouseControl = true
	controlled_window_set_cursor_sprite(sprCursor, 0)
	
	if (global.debugMode)
		show_messagebox(200, 200, "", eng() ? "Gamepad Disconnected" : "Oyun Kumandası\nBağlantısı Koptu", 2*sec)
}