if (from == window_skills and !test_upperclick_window(owner)) {
    if (owner.mouseOnBox and owner.mouseOnBox_i == i and owner.mouseOnBox_j == j and tbT != "") {
		if (textAlpha < 0.98)
			textAlpha += 0.08
		else
			textAlpha = 0.98
		
		if (!virtual)
			textBoxWidth = show_textbox_general(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0),
			tbT, tbW, tbH, c_textbox, textAlpha, false)
		else
			textBoxWidth = show_textbox_general(owner.x+owner.box_x[i, j], owner.y+owner.box_y[i, j],
			tbT, tbW, tbH, c_dkblue, textAlpha, false)
		
		virtual = false
    }
	else
		textAlpha = 0
}
else
	textAlpha = 0