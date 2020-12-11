function free_surface() {
	if (surface_exists(argument[0])) {
		surface_set_target(argument[0])
			draw_clear_alpha(c_black, 0)
		surface_reset_target()
	}
	
	surface_free(argument[0])


}
