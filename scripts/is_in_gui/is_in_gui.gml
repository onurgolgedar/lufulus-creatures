/// @param x
/// @param y
function is_in_gui() {

	return argument[0] > -50 and argument[0] < display_get_gui_width()+50
	and argument[1] > -50 and argument[1] < display_get_gui_height()+50


}
