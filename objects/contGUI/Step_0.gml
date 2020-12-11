if (mouse_check_button_pressed(mb_left)) {
	var my = device_mouse_y_to_gui(0)
	var hPort = view_get_hport(0)

	if (my > hPort-200) {
		for (var i = 0; i < 4; i++) {
			if (tbW[i] != -1 and mouseOnSkillBox[i]) {
				global.itemSelected = instance_create(-50, -50, global.selectedSkill[i])
				global.itemSelected.from = "Skill Boxes"
				global.itemSelected.i = i
			}
		}
	}
}

if (IS_MOBILE) {
	var i = get_multitouch_pressed()
	if (i != -1 and !test_upperclick_window() and !instance_exists(objMap)) {
		if (check_joystick_left_hover(i)) {
			joystick_hold = true
			joystick_hold_device = i
		}
		else if (check_joystick_right_hover(i)) {
			joystick2_hold = true
			joystick2_hold_device = i
		}
		else {
			if (point_distance(BUTTON_SPEEDBOOST_X, BUTTON_SPEEDBOOST_Y, device_mouse_x_to_gui(i), device_mouse_y_to_gui(i)) < 40 and objPlayer.energy == 100) {
				with (objPlayer)
					mobileAutoShift = true
			}
			else if (point_distance(BUTTON_WEAPONCHANGE_X, BUTTON_WEAPONCHANGE_Y, device_mouse_x_to_gui(i), device_mouse_y_to_gui(i)) < 40) {
				if (has_shield()) {
					contPlayer.fixedShieldMode = !contPlayer.fixedShieldMode
					if (contPlayer.fixedShieldMode) {
						with (objPlayer)
							event_user(3)
					}
					else {
						with (objPlayer)
							event_user(4)
					}
				}
				else {
					with (contPlayer)
						event_perform(ev_keyrelease, ord("Q"))
				}
			}
			else if (!objPlayer.death and !global.consoleMode and global.skillBar == 0 and !objPlayer.stunned and !objPlayer.noArms) {
				if (point_distance(BUTTON_SKILL1_X, BUTTON_SKILL1_Y, device_mouse_x_to_gui(i), device_mouse_y_to_gui(i)) < 40) {
					with (contPlayer)
						skill_use(global.selectedSkill[0], 0)
				}
				else if (point_distance(BUTTON_SKILL2_X, BUTTON_SKILL2_Y, device_mouse_x_to_gui(i), device_mouse_y_to_gui(i)) < 40) {
					with (contPlayer)
						skill_use(global.selectedSkill[1], 0)
				}
				else if (point_distance(BUTTON_MAIN_X, BUTTON_MAIN_Y, device_mouse_x_to_gui(i), device_mouse_y_to_gui(i)) < 40) {
					with (contPlayer)
						event_perform(ev_keypress, vk_control)
				}
			}
		}
	}

	if (joystick_hold and device_mouse_check_button_released(joystick_hold_device, mb_left)) {
		joystick_hold = false
		joystick_hold_device = -1
	}
	
	if (joystick2_hold and device_mouse_check_button_released(joystick2_hold_device, mb_left)) {
		joystick2_hold = false
		joystick2_hold_device = -1
	}
}