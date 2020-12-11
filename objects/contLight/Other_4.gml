if (room == roomCave)
	global.sl_ambient_light = min(0, global.sl_ambient_light)
else if (room == roomLufulus)
	global.sl_ambient_light = min(0.15, global.sl_ambient_light)
else if (room == roomBeforeRoad or room == roomRoad or room == roomCamp1)
	global.sl_ambient_light = min(0.2, global.sl_ambient_light)
else if (room == roomRebelWar or room == roomWave2 or room == roomWave4)
	global.sl_ambient_light = min(0.5, global.sl_ambient_light)
else if (is_castle(room))
	global.sl_ambient_light -= 0.06
	
contMain.arrowDraw_isOn = global.sl_ambient_light < 0.75