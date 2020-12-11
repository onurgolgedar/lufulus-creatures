/// @param x
/// @param y
/// @param text
/// @param textW
/// @param textH
/// @param alpha*
function show_textbox_tcolor() {

	var v_alpha = 1
	if (argument_count == 6)
		v_alpha = argument[5]

	return show_textbox_general(argument[0], argument[1], argument[2], argument[3], argument[4], c_textbox, v_alpha)


}
