/// @param value
/// @param isVertical
function screen_point() {

	var cam = global.camera

	if (argument[1])
		return (argument[0]-camera_get_view_y(cam))*display_get_gui_height()/camera_get_view_height(cam)

	return (argument[0]-camera_get_view_x(cam))*display_get_gui_width()/camera_get_view_width(cam)


}
