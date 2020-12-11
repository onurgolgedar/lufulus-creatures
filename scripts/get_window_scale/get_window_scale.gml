function get_window_scale() {
	return 1+clamp((display_get_height()-1050)/(2160-1050)*0.3, 0, 0.3)


}
