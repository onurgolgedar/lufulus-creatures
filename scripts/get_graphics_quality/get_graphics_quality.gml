function get_graphics_quality() {
	return 670+clamp((display_get_height()-1050)/(2160-1050)*180, 0, 180)


}
