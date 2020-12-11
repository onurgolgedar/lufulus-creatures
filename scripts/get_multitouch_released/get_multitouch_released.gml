function get_multitouch_released() {
	if (!IS_MOBILE)
		return -1

	for (var i = 0; i < 4; i++)
		if (device_mouse_check_button_released(i, mb_left)) {
			mouse_set_position(device_mouse_x_to_gui(i), device_mouse_y_to_gui(i))
			return i
		}
		
	return -1


}
