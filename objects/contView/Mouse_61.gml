if (contMain.isRoomOut)
	exit

var limitZoom_h = view_get_hport(0)*(1.33-0.4*IS_MOBILE)/(view_get_hport(0)/global.portHeight_real)
if (camera_get_view_height(global.camera)*1.05 < limitZoom_h or global.zoomMode) {
	camera_set_view_size(global.camera,
	floor(camera_get_view_width(global.camera)*1.05),
	floor(camera_get_view_height(global.camera)*1.05))
    
    viewH = camera_get_view_height(global.camera)
    viewW = camera_get_view_width(global.camera)
    
	camera_set_view_border(global.camera, floor(viewW/2), floor(viewH/2))
	camera_set_view_speed(global.camera, -1, -1)
	
	with (contLight) {
		if (surface_exists(sl_buffer_surface1))
			free_surface(sl_buffer_surface1)
	
		if (surface_exists(sl_buffer_surface2))
			free_surface(sl_buffer_surface2)
	}
	
	with (contLight)
		SL_engine_render()
}
else if (camera_get_view_height(global.camera) != limitZoom_h) {
	camera_set_view_size(global.camera,
	floor(limitZoom_h*aspectRatio),
	limitZoom_h)
    
    viewH = camera_get_view_height(global.camera)
    viewW = camera_get_view_width(global.camera)
    
	camera_set_view_border(global.camera, floor(viewW/2), floor(viewH/2))
	camera_set_view_speed(global.camera, -1, -1)
	
	with (contLight) {
		if (surface_exists(sl_buffer_surface1))
			free_surface(sl_buffer_surface1)
	
		if (surface_exists(sl_buffer_surface2))
			free_surface(sl_buffer_surface2)
	}
	
	with (contLight)
		SL_engine_render()
}