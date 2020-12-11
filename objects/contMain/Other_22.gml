if (isQuestion(1)) {
	if (isButton(0)) {
		objMessageBox.visible = false
		application_surface_draw_enable(true)
		gui_resize_special()
		global.pause = false
		instance_activate_all()
		physics_pause_enable(false)
		event_perform(ev_alarm, 3)
		if (screenSave != pointer_null) {
			free_surface(screenSave)
			screenSave = pointer_null
		}
		
		with (contMain)
			event_perform(ev_other, ev_user0)
			
		room_goto(roomMenu)
	}
	else if (isButton(2)) {
		game_end()
	}
	else if (isButton(3)) {
		with (contView)
			event_perform(ev_keypress, vk_f11)
		event_perform(ev_keypress, vk_escape)
	}
	else
		event_perform(ev_keypress, vk_escape)
}
else if (isQuestion(2)) {
	if (isButton(0)) {
		game_end()
	}
	else if (isButton(2)) {
		show_message("")
	}
}
else if (isQuestion(3)) {
	if (isButton(0))
		event_perform(ev_keypress, ord("B"))
	else if (isButton(1))
		event_perform(ev_keypress, ord("C"))
	else if (isButton(2))
		event_perform(ev_keypress, ord("J"))
	else if (isButton(3))
		event_perform(ev_keypress, ord("Y"))
	else if (isButton(4))
		event_perform(ev_keypress, ord("M"))
}