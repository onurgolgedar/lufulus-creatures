var cam_angle = camera_get_view_angle(global.camera)

if (cam_angle != 0) {
	if (cam_angle > 1)
		camera_set_view_angle(global.camera, cam_angle/1.1-0.5)
	else
		camera_set_view_angle(global.camera, 0)
}

delta_alarm(3, sec/15)