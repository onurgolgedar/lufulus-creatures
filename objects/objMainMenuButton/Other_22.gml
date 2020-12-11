if (isQuestion(1)) {
	if (isButton(0)) {
		open_saved_game("1")
	}
	else if (isButton(1)) {
		open_saved_game("2")
	}
	else if (isButton(2)) {
		open_saved_game("3")
	}
	else if (isButton(3)) {
		open_saved_game("4")
	}
}
else if (isQuestion(2)) {
	if (isButton(0)) {
		file_delete(string(global.steamID)+"\\save_1.lufsav")
		
		with (contOut)
			event_perform(ev_other, ev_user0)
			
		event_perform(ev_other, ev_user1)
	}
	else if (isButton(1)) {
		file_delete(string(global.steamID)+"\\save_2.lufsav")
		
		with (contOut)
			event_perform(ev_other, ev_user0)
			
		event_perform(ev_other, ev_user1)
	}
	else if (isButton(2)) {
		file_delete(string(global.steamID)+"\\save_3.lufsav")
		
		with (contOut)
			event_perform(ev_other, ev_user0)
			
		event_perform(ev_other, ev_user1)
	}
	else if (isButton(3)) {
		file_delete(string(global.steamID)+"\\save_4.lufsav")
		
		with (contOut)
			event_perform(ev_other, ev_user0)
			
		event_perform(ev_other, ev_user1)
	}
}