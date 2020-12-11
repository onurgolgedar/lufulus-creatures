function surface_resize_special() {
	surface_resize(application_surface, camera_get_view_width(global.camera)*global.quality, camera_get_view_height(global.camera)*global.quality)
	//surface_resize(application_surface, camera_get_view_width(global.camera), camera_get_view_height(global.camera))


}
