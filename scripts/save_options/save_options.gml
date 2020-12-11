function save_options() {
	ini_open(string(global.steamID)+"\\options.lufsav")
		ini_write_real("5v26a", "ga2ahs", global.quality)
		ini_write_real("5v26a", "2v2b6su", global.performanceMode)
		ini_write_real("5v26a", "b6s8fds", global.lightActive)
		ini_write_real("5v26a", "b616dsiz", global.gui_size)
		ini_write_real("5v26a", "xxt6wa", global.language)
		ini_write_real("5v26a", "5xb25ps", audio_get_master_gain(0))
		ini_write_real("5v26a", "uc54chdf", global.audio_gain_music)
		ini_write_real("5v26a", "74a38g", global.audio_gain_nonmusic)
	
		if (global.canChangeVsync) {
			ini_write_real("5v26a", "jx6fxjc", global.verticalSync)
			if (global.manualRefreshRate_mode) {
				for (var i = 0; i < 7; i++) {
					if (global.refreshRate == global.fpsValue[i])
						ini_write_real("5v26a", "rr2ga22", i)
				}
			}
			else
				ini_write_real("5v26a", "rr2ga22", -1)
		}
	ini_close()


}
