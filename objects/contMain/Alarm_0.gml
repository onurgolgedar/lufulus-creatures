if (period < 9.5) {
	if (!global.pause) {
		period += 0.5
		global.gameTime += (!isRoomOut)/20
	}
	
	delta_alarm(0, sec/20)
}
else {
	if (!global.pause) {
		period = 10
		global.gameTime += (!isRoomOut)/20
	}
	
	delta_alarm(1, sec/20)
}

event_perform(ev_other, ev_user6)