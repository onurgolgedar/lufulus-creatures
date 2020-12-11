//mouse_set_position(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0))
if (IS_MOBILE) {
	global_tab = true
	event_perform(ev_mouse, ev_global_left_press)
}