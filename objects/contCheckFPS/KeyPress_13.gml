if (room == roomFPS) {
	test_vsyncForcedOff = -1
	test_vsyncForcedOn = -1
	
	global.canChangeVsync = false
	
	with (contMain)
		event_perform(ev_other, ev_user0)
	room_goto(roomMenu)
}