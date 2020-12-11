function load_options() {
	ini_open(string(global.steamID)+"\\options.lufsav")
		global.quality = ini_read_real("5v26a", "ga2ahs", global.quality)
		global.performanceMode = ini_read_real("5v26a", "2v2b6su", global.performanceMode)
		global.lightActive = ini_read_real("5v26a", "b6s8fds", global.lightActive)
		global.gui_size = ini_read_real("5v26a", "b616dsiz", global.gui_size)
		global.language = ini_read_real("5v26a", "xxt6wa", global.language)
		audio_set_master_gain(0, ini_read_real("5v26a", "5xb25ps", 1))
		global.audio_gain_music = ini_read_real("5v26a", "uc54chdf", global.audio_gain_music)
		global.audio_gain_nonmusic = ini_read_real("5v26a", "74a38g", global.audio_gain_nonmusic)
	
		if (global.canChangeVsync) {
			var readFPS = ini_read_real("5v26a", "rr2ga22", -1)
			if (readFPS != -1 and global.fpsValue[readFPS] <= global.displayRefreshRate+1)
				set_manual_fps(global.fpsValue[readFPS])
			/*else
				change_verticalSync(ini_read_real("5v26a", "jx6fxjc", global.verticalSync))*/
		}
	ini_close()

	change_gain_music(global.audio_gain_music)
	change_gain_nonmusic(global.audio_gain_nonmusic)

	with (objMainMenuButton)
		event_perform(ev_other, ev_user11)


}
