delta_alarm(2, sec/4)

if (maxTime != -1)
	if (mouse_check_button(mb_left) or global.gamepad_active and gamepad_button_check(global.gamepad, gp_shoulderr))
		event_perform(ev_mouse, ev_global_left_press)