//if (room != roomOptions)
	instance_create_layer(camera_get_view_x(global.camera)+camera_get_view_width(global.camera)-70, camera_get_view_y(global.camera)+70, "lyNirvana", objFullscreenButton)

if (global.gamepad_active) {
	with (objMainMenuButton) {
		if (text == "Main Menu" or text == "Ana Menü") {
			mouse_set_position(screen_point(x, 0), screen_point(y, 1))
			other.tab_index = 16
			break
		}
		else if (usable and (text == "Continue" or text == "Devam Et")) {
			mouse_set_position(screen_point(x, 0), screen_point(y, 1))
			other.tab_index = 2
			break
		}
		else if (usable and (text == "New Game" or text == "Yeni Oyun")) {
			other.tab_index = 1
			mouse_set_position(screen_point(x, 0), screen_point(y, 1))
		}
	}
}