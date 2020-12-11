change_verticalSync(false)

if (os_type != os_windows) {
	test_vsyncForcedOn = -1
	test_vsyncForcedOff = -1
	
	global.canChangeVsync = false
}

global.gpuControlProblem = test_vsyncForcedOn == true or test_vsyncForcedOn == true

ini_open("display.ini")
	global.refreshRate = ini_read_real("Display", "refreshRate", IS_MOBILE ? 30 : 60)
	global.displayRefreshRate = global.refreshRate
ini_close()

window_center()