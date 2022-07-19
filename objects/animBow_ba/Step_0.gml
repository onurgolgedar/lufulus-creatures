var pwr_l = 0

if (alarm[0] == -1 and alarm[1] > 0)
	pwr_l = (maxPowerTime-alarm[1])/maxPowerTime

if (((!mouse_check_button(mb_left) or mouse_check_button(mb_right) and pwr_l > 0.5) and !IS_MOBILE and !global.gamepad_active
	or (!gamepad_button_check(global.gamepad, gp_shoulderr) or gamepad_button_check(global.gamepad, gp_shoulderrb) and pwr_l > 0.5) and global.gamepad_active
	or !contGUi.joystick2_hold and IS_MOBILE and !global.gamepad_active)
	and !released) {
	released = true

	if (alarm[0] == -1 and alarm[1] > 0) {
		pwr = pwr_l
	
		// ? pwr delta
		delta_alarm(1, 1)
	}
	else if (alarm[0] != -1)
		event_user(1)
}