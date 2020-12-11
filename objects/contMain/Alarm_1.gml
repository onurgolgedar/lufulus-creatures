if (period > 0.5) {
	if (!global.pause) {
		period -= 0.5
		global.gameTime += (!isRoomOut)/20
	}

	delta_alarm(1, sec/20)
}
else {
	if (!global.pause) {
		period = 0
		global.gameTime += (!isRoomOut)/20
	}
	
	delta_alarm(0, sec/20)
	
	// ? (no extension, but correct)
	/*if (window_has_focus()) {
		if (window_get_fullscreen())
			window_set_topmost(true)
		else
			window_set_topmost(false)
	}*/
}

event_perform(ev_other, ev_user6)