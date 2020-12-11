function set_manual_fps() {
	change_verticalSync(false)
	with (contMain) {
		global.manualRefreshRate_mode = true
		change_verticalSync(false)
		global.refreshRate = argument[0]
		game_set_fps(global.refreshRate)
		totalDFPS = 0
		totalDFPS_count = 0
		alarm[2] = sec
	}


}
