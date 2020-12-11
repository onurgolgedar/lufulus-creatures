/// @param x
/// @param y
/// @param text
/// @param textW
/// @param textH
/// @param color
/// @param alpha*
/// @param inverseRotation*
/// @param font*
function show_textbox_general() {

	var st_offset = 5
	var a0add = 0
	var a1add = 0
	var before_alpha = draw_get_alpha()

	var v_alpha
	if (argument_count > 6)
		v_alpha = argument[6]
	else
		v_alpha = 1
	
	var v_inverse
	if (argument_count > 7)
		v_inverse = argument[7]
	else
		v_inverse = false
	
	var v_font
	if (argument_count > 8)
		v_font = argument[8]
	else
		v_font = fontItemInfo

	/*!*/ // !
	if (surface_exists(contMain.textbox_surface))
		surface_set_target(contMain.textbox_surface)
	else {
		contMain.textbox_surface = create_surface(display_get_gui_width(), display_get_gui_height())
		surface_set_target(contMain.textbox_surface)
	}

	draw_set_color(argument[5])
	    // WARNING! Mouse position control
	    if (device_mouse_x_to_gui(0) >= display_get_gui_width()/2 xor v_inverse) {
	        if (device_mouse_y_to_gui(0) >= display_get_gui_height()/2) {
	            a0add = -argument[3]-st_offset*2
	            a1add = -argument[4]-st_offset*2
	        }
	        else {
	            a0add = -argument[3]-st_offset*2
	            a1add = +argument[4]+st_offset*2
	        }
	    }
	    else {
	        if (device_mouse_y_to_gui(0) >= display_get_gui_height()/2) {
	            a0add = +argument[3]+st_offset*2
	            a1add = -argument[4]-st_offset*2
	        }
	        else {
	            a0add = +argument[3]+st_offset*2
	            a1add = +argument[4]+st_offset*2
	        }
	    }
    
		draw_set_alpha(0.975*v_alpha)
		    draw_rectangle(argument[0], argument[1],
		    argument[0]+a0add,
		    argument[1]+a1add, 0)
		draw_set_alpha(v_alpha)
	draw_set_color(c_black)

	/*draw_roundrect(argument[0], argument[1],
	argument[0]+a0add,
	argument[1]+a1add, 1)*/
	a0add += 2*sign(a0add)
	draw_line_width(argument[0], argument[1], argument[0]+a0add, argument[1], 2)
	draw_line_width(argument[0], argument[1]+a1add, argument[0]+a0add, argument[1]+a1add, 2) 

	if (a1add > 0) {
		draw_line_width(argument[0], argument[1]-1, argument[0], argument[1]+a1add+1, 4) 
		draw_line_width(argument[0]+a0add, argument[1]-1, argument[0]+a0add, argument[1]+a1add+1, 4)
	}
	else {
		draw_line_width(argument[0], argument[1]+1, argument[0], argument[1]+a1add-1, 4) 
		draw_line_width(argument[0]+a0add, argument[1]+1, argument[0]+a0add, argument[1]+a1add-1, 4)
	}

	draw_set_font(v_font) draw_set_color(c_white)
	    // WARNING! Mouse position control
	    if (device_mouse_x_to_gui(0) >= display_get_gui_width()/2 xor v_inverse) {
	        if (device_mouse_y_to_gui(0) >= display_get_gui_height()/2) {
	            draw_set_halign(fa_left) draw_set_valign(fa_top)
	                draw_text_colortags(argument[0]-st_offset-argument[3], argument[1]-argument[4]-st_offset, argument[2])
	        }
	        else {
	            draw_set_halign(fa_left) draw_set_valign(fa_top)
	                draw_text_colortags(argument[0]-st_offset-argument[3], argument[1]+st_offset, argument[2])
	        }
	    }
	    else  {
	        if (device_mouse_y_to_gui(0) >= display_get_gui_height()/2) {
	            draw_set_halign(fa_left) draw_set_valign(fa_top)
	                draw_text_colortags(argument[0]+st_offset, argument[1]-argument[4]-st_offset, argument[2])
	        }
	        else {
	            draw_set_halign(fa_left) draw_set_valign(fa_top)
	                draw_text_colortags(argument[0]+st_offset, argument[1]+st_offset, argument[2])
	        }
	    }
	draw_set_default()
	draw_set_alpha(before_alpha)

	surface_reset_target()
	return argument[3]+st_offset*2


}
