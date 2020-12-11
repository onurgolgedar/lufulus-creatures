function create_surface() {
	var surface = surface_create(argument[0], argument[1])

	surface_set_target(surface)
		draw_clear_alpha(c_black, 0)
	surface_reset_target()

	return surface


}
