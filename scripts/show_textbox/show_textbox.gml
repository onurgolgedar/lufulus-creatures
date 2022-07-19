/// @param x
/// @param y
/// @param text
/// @param alpha*
function show_textbox() {

	var v_alpha = 1
	if (argument_count == 4)
		v_alpha = argument[3]

	draw_set_font(fontiteminfo)
	    var stf_return = show_textbox_general(argument[0], argument[1], argument[2],
		string_width(argument[2]),
		string_height(argument[2]), c_textbox, v_alpha)
	draw_set_font(global.mainFont)

	return stf_return


}
