/// @param x
/// @param y
function is_in_view() {
	var cam = global.camera

	// REAL
	return argument[0] > camera_get_view_x(cam)-80+IS_MOBILE*10 and argument[0] < camera_get_view_x(cam)+camera_get_view_width(cam)+80-IS_MOBILE*10
	and argument[1] > camera_get_view_y(cam)-80+IS_MOBILE*10 and argument[1] < camera_get_view_y(cam)+camera_get_view_height(cam)+80-IS_MOBILE*10


}
