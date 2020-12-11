if (room == roomFPS) {
	event_perform(ev_keypress, vk_enter)
	exit
}

if (global.consoleMode) {
	global.consoleMode = false
	exit
}

if (!global.pause) {
	with (parWindow)
		exit
		
	with (objMap)
		exit
		
	if (room == roomOptions)
		with (objMainMenuButton)
			if (text == "Main Menu" or text == "Ana Menü")
				event_perform(ev_other, ev_user1)
				
	with (contGUI) {
		if (colorScreenAlpha > 0.1)
			exit
	}
}

if (!global.pause) {
	with (contFloor)
		drawPaths = false
	if (instance_number(parWindow) == 0 and !instance_exists(objMap))
		event_perform(ev_other, ev_user3)
}
else
	event_perform(ev_other, ev_user4)