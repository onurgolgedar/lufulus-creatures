//if (window_has_focus()) {
//	var isFinished = false
//	var beforePhase = 1
	
//	if (alarm[0] == -1)
//		delta_alarm(0, sec)
	
//	secsPassed += delta_time/1000000
	
//	if (phase == 1)
//		test_vsyncForcedOn = (exceedRR_count < (RR_count+exceedRR_count)*2/10)
//	else if (phase == 2)
//		test_vsyncForcedOff = (exceedRR_count > (RR_count+exceedRR_count)*1/10)
	
//	if (exceedRR_count+RR_count > 20) {	
//		beforePhase = phase
//		if (phase == 1) {
//			phase = 2
			
//			change_verticalSync(true)
//			game_set_fps(500)
//		}
//	}
//	else if (secsPassed > 8) {
//		alarm[0] = -1
//		secsPassed = 0
//		exceedRR_count = 0
//		RR_count = 0
//	}
		
//	if (exceedRR_count+RR_count > 20) {
//		if (global.canChangeVsync)
//			global.canChangeVsync = test_vsyncForcedOn == false and test_vsyncForcedOff == false
			
//		if (beforePhase == 2)
//			isFinished = true
			
//		alarm[0] = -1
//		exceedRR_count = 0
//		RR_count = 0
//	}
		
//	if (!global.canChangeVsync or isFinished) {
//		with (contMain)
//			event_perform(ev_other, ev_user0)
//		room_goto(roomMenu)
//	}
//}
//else {
//	alarm[0] = -1
//	secsPassed = 0
//	exceedRR_count = 0
//	RR_count = 0
//}