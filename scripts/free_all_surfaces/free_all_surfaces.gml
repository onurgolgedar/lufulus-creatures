function free_all_surfaces() {
	if (surface_exists(global.minimapSurface))
		free_surface(global.minimapSurface)
	
	with (contGUI) {
		if (surface_exists(textShadow_surface))
			free_surface(textShadow_surface)
	}
	
	with (contMain) {
		if (screenSave != pointer_null) {
			if (surface_exists(screenSave))
				free_surface(screenSave)
			screenSave = pointer_null
		}
		
		if (surface_exists(textbox_surface))
			free_surface(textbox_surface)
	}

	with (contLight) {
		if (surface_exists(sl_buffer_surface1))
			free_surface(sl_buffer_surface1)
	
		if (surface_exists(sl_buffer_surface2))
			free_surface(sl_buffer_surface2)
	}

	with (contLight)
		SL_engine_free()


}
