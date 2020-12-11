function set_window_size() {
	var graphicsQuality = get_graphics_quality()
	var windowScale = get_window_scale()

	window_set_size(view_get_wport(0)*(global.portHeight_real/graphicsQuality)*windowScale, view_get_hport(0)*(global.portHeight_real/graphicsQuality)*windowScale)
}