if (get_dayhour() > 0 and get_dayhour() < 3)
	global.sl_ambient_light = 0.28
else if (get_dayhour() >= 3 and get_dayhour() < 6)
	global.sl_ambient_light = 0.4
else if (get_dayhour() >= 6 and get_dayhour() < 9)
	global.sl_ambient_light = 0.83
else if (get_dayhour() >= 9 and get_dayhour() < 12)
	global.sl_ambient_light = 0.92
else if (get_dayhour() >= 12 and get_dayhour() < 17)
	global.sl_ambient_light = 0.83
else if (get_dayhour() >= 17 and get_dayhour() < 21)
	global.sl_ambient_light = 0.52
else if (get_dayhour() >= 21 and get_dayhour() < 24)
	global.sl_ambient_light = 0.4
	
contMain.arrowDraw_isOn = global.sl_ambient_light < 0.75