/// @param device
function check_joystick_left_hover() {

	return point_distance(JOYSTICK_CENTER_X, JOYSTICK_CENTER_Y , device_mouse_x_to_gui(argument[0]), device_mouse_y_to_gui(argument[0])) < JOYSTICK_R+40


}
