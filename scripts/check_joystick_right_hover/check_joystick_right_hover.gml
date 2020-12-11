/// @param device
function check_joystick_right_hover() {

	return point_distance(JOYSTICK2_CENTER_X, JOYSTICK2_CENTER_Y , device_mouse_x_to_gui(argument[0]), device_mouse_y_to_gui(argument[0])) < (contPlayer.melee ? JOYSTICK_R : JOYSTICK2_R)+40


}
