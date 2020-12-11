if (global.gamepad_active and clickObject != pointer_null) {
	with (clickObject)
		event_perform(ev_mouse, ev_left_press)
		
	clickObject = pointer_null
}