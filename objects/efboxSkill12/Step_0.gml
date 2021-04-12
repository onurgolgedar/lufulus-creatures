event_inherited()

if (contPlayer.drawSkill12) {
	global.skillBar += 100/(1.25*sec)*delta()

	if (global.skillBar >= 100) {
		global.skillBar = 100
		event_perform(ev_other, ev_user0)
	}
}

if (maxTime == -1 and (mouse_check_button_released(mb_left) or global.gamepad_active and gamepad_button_check_released(global.gamepad, gp_shoulderr))) 
	event_perform(ev_other, ev_user0)
else if (maxTime != -1 and global.gamepad_active and gamepad_button_check_pressed(global.gamepad, gp_shoulderr))
	event_user(2)
	
var device = get_multitouch_pressed()
if ((device != -1 and !check_joystick_left_hover(device) and !check_joystick_right_hover(device) and device != contPlayer.deviceSkill12 or mouse_check_button_pressed(mb_left))) {
	contPlayer.deviceSkill12 = device
	if (global.mouseControl) {
		with (parWindow)
			if (mouseOnBody)
			    exit
	}

	if (test_upperclick_arrow() or global.itemSelected != -1)
		exit

	event_user(2)
}