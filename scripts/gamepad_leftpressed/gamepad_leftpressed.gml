function gamepad_leftpressed() {
	return global.gamepad_active and (gamepad_button_check_pressed(global.gamepad, gp_stickr) /*and global.mouseControl*/ or gamepad_button_check_pressed(global.gamepad, gp_face1))


}
