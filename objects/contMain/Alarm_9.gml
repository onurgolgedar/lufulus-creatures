ini_open("display.ini")
	global.displayRefreshRate = ini_read_real("Display", "refreshRate", IS_MOBILE ? 30 : 60)
	
	if (!global.manualRefreshRate_mode)
		global.refreshRate = global.displayRefreshRate
ini_close()

alarm[9] = 2*sec