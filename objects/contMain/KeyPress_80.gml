if (!global.pause or directPause_gamepad) {
	directPause_gamepad = false
	
	if (!global.consoleMode and !is_room_out()) {
		if (instance_exists(contLight)) {
			free_surface(contLight.sl_buffer_surface1)
			free_surface(contLight.sl_buffer_surface2)
		}

		event_perform(ev_other, ev_user4)
			
		audio_pause_all()
	
		if (!IS_MOBILE)
			application_surface_draw_enable(false)
	}
}
else
	event_perform(ev_keypress, vk_escape)