if (global.gamepad_active and gamepad_button_check_pressed(global.gamepad, gp_face2)) {
	with (contMain)
		event_perform(ev_keypress, vk_escape)
}