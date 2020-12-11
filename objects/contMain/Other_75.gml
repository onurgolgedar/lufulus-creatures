var eventType = ds_map_find_value(async_load, "event_type")
var gamePad_index = ds_map_find_value(async_load, "pad_index")

if (!IS_MOBILE) {
	if (eventType == "gamepad discovered") {
		global.gamepad = gamePad_index
		
		if (gamepad_is_connected(global.gamepad)) {
			gamepad_set_axis_deadzone(global.gamepad, 0.3)
			gamepad_set_vibration(global.gamepad, 0, 0)
		
			if (!global.gamepad_active)
				show_messagebox(200, 200, eng() ? "You can get information about its\nusage by pressing <F3>." : "<F3> tuşuna basarak kullanımı hakkında\nbilgi alabilirsiniz.", eng() ? "Gamepad Connected" : "Oyun Kumandası Bağlandı", room == roomMenu ? 4*sec : -1)
		
			global.gamepad_active = true
		}
		else {
			global.gamepad_active = false
			global.mouseControl = true
			controlled_window_set_cursor_sprite(sprCursor, 0)
		}
	} else if (eventType == "gamepad lost") {
		global.gamepad = gamePad_index
	
		if (global.gamepad_active)
			show_messagebox(200, 200, "", eng() ? "Gamepad Disconnected" : "Oyun Kumandası\nBağlantısı Koptu", 2*sec)
		
		directPause_gamepad = true
		event_perform(ev_keypress, ord("P"))
		
		global.gamepad_active = false
		global.mouseControl = true
	}
}