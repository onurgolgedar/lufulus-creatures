if (contMain.isRoomOut)
	exit

var targetZoom_h = view_get_hport(0)*(0.950-0.12*global.gamepad_active-0.33*IS_MOBILE)/(view_get_hport(0)/global.portHeight_real)
if (camera_get_view_height(global.camera) != targetZoom_h) {	
	camera_set_view_size(global.camera,
	targetZoom_h*aspectRatio,
	targetZoom_h)
    
    viewH = camera_get_view_height(global.camera)
    viewW = camera_get_view_width(global.camera)
    
	camera_set_view_border(global.camera, floor(viewW/2), floor(viewH/2))
	camera_set_view_speed(global.camera, -1, -1)
	
	with (contLight)
		SL_engine_render()
	
	with(contGUI) {
		colorScreenAlpha = 1
		alarm[1] = 2
	}
}