/// @param x
/// @param y

function mouse_set_position() {
	display_mouse_set/**/(window_get_x()+argument[0]*(window_get_width()/display_get_gui_width()), window_get_y()+argument[1]*(window_get_height()/display_get_gui_height()))
}
