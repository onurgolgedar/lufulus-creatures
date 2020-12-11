delta_alarm(6, sec)

ini_open("display.ini")
	// global.refreshRate
	displayRefreshRate = ini_read_real("Display", "refreshRate", IS_MOBILE ? 30 : 60)
ini_close()