if (global.gamepad_active and !IS_MOBILE) {
	var imageIndex = !eng()
	var yy = display_get_gui_height()/2
	var alpha = 1-contGUi.colorScreenAlpha
	
	if (room == roomBeforeRoad)
		draw_sprite_ext(sprGamepadControl_movement, imageIndex, 0, yy, 1, 1, 0, c_white, alpha)
	else if (room == roomRoad) {
		if (drawGamepadControlWindow) {
			draw_sprite_ext(sprGamepadControl_general2, imageIndex, display_get_gui_width(), yy, 1, 1, 0, c_white, alpha)
			draw_sprite_ext(sprGamepadControl_general, imageIndex, 0, yy, 1, 1, 0, c_white, alpha)
		}
		
		if (drawGamepadControlAttack)
			draw_sprite_ext(sprGamepadControl_attack, imageIndex, display_get_gui_width()/2-50, 100, 1, 1, 0, c_white, alpha)
		
		if (drawGamepadControlSwitchMode)
			draw_sprite_ext(sprGamepadControl_switchMode, imageIndex, 0, yy, 1, 1, 0, c_white, alpha)
	}
}