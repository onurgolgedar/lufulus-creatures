if (front)
	event_perform(ev_other, ev_user1)
	
if (gamepad_button_check_released(global.gamepad, gp_shoulderl))
	event_perform(ev_mouse, ev_global_left_release)

if ((mouse_check_button_pressed(mb_left) or gamepad_leftpressed() or gamepad_button_check_pressed(global.gamepad, gp_shoulderl)) and !destroy
and !test_upperclick_window() and !test_upperclick_tutorial(true)) {
    event_perform(ev_other, ev_user1)

    if (mouseOnBody) {
        event_perform(ev_other, ev_user0)
        event_perform(ev_other, ev_user2)
        
        if (mouseOnButton == -1 and !menuBox) {
            dragHOffset = device_mouse_x_to_gui(0)-x
            dragVOffset = device_mouse_y_to_gui(0)-y
            drag = true
        }
    }
}

if (IS_MOBILE) {
	relatedMouseDevice = get_multitouch_pressed()
	if (relatedMouseDevice != -1) {
		global_tab = true
		event_perform(ev_mouse, ev_global_left_press)
	}

	relatedMouseDevice = get_multitouch_released()
	if (!drag and relatedMouseDevice != -1) {
		global_tab = true
		//leftPressedOnBody = true
		event_perform(ev_mouse, ev_global_left_release)
	}
}

relatedMouseDevice = 0

if (drag) {
    x = device_mouse_x_to_gui(0)-dragHOffset
    y = device_mouse_y_to_gui(0)-dragVOffset
}