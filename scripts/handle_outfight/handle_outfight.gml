function handle_outfight() {
	var isOutfight = is_outfight()

	if (contPlayer.alarm[2] == -1) {
		delta_alarm(2, 1.5*sec, contPlayer)
	}

	if (contPlayer.alarm[4] == -1)
		delta_alarm(4, sec*2/3, contPlayer)
	
	if (instance_exists(contWarzone)) {
		with (parTarget) {
			if (!death and teamNo != team_player) {
				with (contPlayer)
					event_user(4)
			
				contPlayer.alarm[2] = -1
				contPlayer.alarm[4] = -1				
				break
			}
		}
	}
	
	if (contPlayer.alarm[2] != -1 or contPlayer.alarm[4] != -1) {
		with (parTarget) {
			if (mode == md_attack and !death and target == objPlayer.id) {
				with (contPlayer)
					event_user(4)
			
				contPlayer.alarm[2] = -1
				contPlayer.alarm[4] = -1
				break
			}
		}
	}

	if (global.gamepad_active and !isOutfight and is_outfight()) {
		if (window_get_fullscreen()) {
			if (display_mouse_get_x() == display_get_width()-3 and display_mouse_get_y() == display_get_height()-3)
				display_mouse_set/**/(display_get_width()*3/4, display_get_height()*3/4)
		}
		else {
			if (display_mouse_get_x() == window_get_x()+view_get_wport(0)-3 and display_mouse_get_y() == window_get_y()+view_get_hport(0)-3)
				display_mouse_set/**/(window_get_x()+view_get_wport(0)*3/4, window_get_y()+view_get_hport(0)*3/4)
		}
	}


}
