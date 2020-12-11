if (blackScreenAlpha > 0)
	blackScreenAlpha -= 0.05

if (maxPage != -1) {
	var dw =  display_get_gui_width()
	var dh =  display_get_gui_height()
	
	if (gamepad_button_check_pressed(global.gamepad, gp_face1))
		event_perform(ev_keypress, vk_enter)
		
	if (gamepad_button_check_pressed(global.gamepad, gp_face2))
		event_perform(ev_keypress, vk_enter)
			
	if (image_alpha > 0.9 and !instance_exists(parWindow)) {
		if (point_distance(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), dw/2+cinematicText_width/2+45+IS_MOBILE*40, dh-118-IS_MOBILE*40) < 40+IS_MOBILE*30)
			mouseOnNext = true
		else
			mouseOnNext = false
	
		if (point_distance(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), dw/2-cinematicText_width/2-45-IS_MOBILE*40, dh-118-IS_MOBILE*40) < 40+IS_MOBILE*30)
			mouseOnBack = backButton_isActive
		else
			mouseOnBack = false
	}
	else {
		mouseOnNext = false
		mouseOnBack = false
	}
}