function broke_outfight() {
	if (is_outfight()) {
		if (global.gamepad_active) {
			if (!window_get_fullscreen())
				display_mouse_set/**/(window_get_x()+view_get_wport(0)-3, window_get_y()+view_get_hport(0)-3)
			else
				display_mouse_set/**/(display_get_width()-3, display_get_height()-3)
		}
	}

	contPlayer.alarm[2] = -1
	contPlayer.alarm[3] = sec

	with (contPlayer)
		event_user(4)


}
