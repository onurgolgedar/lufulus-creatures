function change_verticalSync() {
	if (global.verticalSync != argument[0] and (!argument[0] or os_type == os_windows)) {
		global.verticalSync = argument[0]
	
		global.manualRefreshRate_mode = false
		ini_open("display.ini")
			global.refreshRate = ini_read_real("Display", "refreshRate", IS_MOBILE ? 30 : 60)
			global.displayRefreshRate = global.displayRefreshRate
		ini_close()
	
		if (game_get_fps() == fps_free)
			game_set_fps(global.refreshRate)
	
		display_reset(0, argument[0])
		
		with (contView)
			alarm[8] = sec/4
	}


}
