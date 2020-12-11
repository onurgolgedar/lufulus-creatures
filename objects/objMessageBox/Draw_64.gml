var isDialogue = (dialogueID != -1)

var mainAlpha = image_alpha*(contMain.isRoomOut or global.pause or !contPlayer.onDialogue or isDialogue)/*/(!front+1)*/

if (specialDesign) {
	with (owner) {
		if (object_get_parent(id) == parWindow)
			draw_sprite_ext(sprMarkBubble, -1, owner.box_x[i, j]+owner.x, owner.box_y[i, j]+owner.y, 0.65, 0.65, 0, c_white, 1)
	}
}

if (front and (isDialogue or blackBackground) and !is_room_out()) {
	draw_set_alpha(1/2)
		draw_rectangle(-1, -1, display_get_gui_width(), display_get_gui_height(), 0)
}

draw_set_alpha(mainAlpha) gpu_set_tex_filter(1)
	if (!menuBox) {
		draw_set_alpha(mainAlpha/1.2)
			draw_roundrect(x, y, x+offX, y+offY, 0)
		draw_set_alpha(mainAlpha/3)
			draw_set_color(front ? color : c_gray)
				draw_roundrect(x+2, y+2, x+offX-2, y+offY-2, 0)
		    draw_set_color(windowColor)
				if (!specialDesign)
					draw_roundrect(x+4, y+4, x+offX-4, y+offY-4, 0)
		    draw_set_color(c_black)
		draw_set_alpha(mainAlpha)
	    draw_roundrect(x, y, x+offX, y+offY, 1)
	}
	else {
		/*draw_set_alpha(mainAlpha/1.4)
		draw_roundrect(x, y, x+offX, y+offY+5, 0)
		draw_set_alpha(mainAlpha)*/
	}
        
    draw_set_font(fontMessageTitle) draw_set_color(c_white)
        draw_text_colortags(x+textHOffset, y+textVOffset, title)
    draw_set_font(fontMain)
        draw_text_colortags(x+textHOffset, y+textVOffset+titleHeight, text)
	draw_set_color(c_black)
    
        for (i = 0; i < buttonCount; i++) {
			if (buttonClipped[i] != "[Hide]") {
				draw_set_valign(fa_center) draw_set_halign(fa_left) 

				var isCancelButton = false /*buttonClipped[i] == "Cancel" or buttonClipped[i] == "Back"*/
				var isUseButton = specialDesign and (buttonClipped[i] == "Use" or buttonClipped[i] == "Call" or buttonClipped[i] == "Çağır" or buttonClipped[i] == "Kullan" or buttonClipped[i] == "Kabul Et" or buttonClipped[i] == "Accept")
	
				draw_roundrect(x+buttonPosition_x[i], y+buttonPosition_y[i], x+buttonPosition_x[i]+buttonWidth, y+buttonPosition_y[i]+buttonHeight, 0)
	            draw_set_color(isCancelButton ? c_dkgray : (isUseButton ? c_green : c_buttoncolorspecial))
	            mouseOnButton = -1
            
	            if (device_mouse_x_to_gui(0) > x+buttonPosition_x[i] and device_mouse_x_to_gui(0) < x+buttonPosition_x[i]+buttonWidth and
	                device_mouse_y_to_gui(0) > y+buttonPosition_y[i] and device_mouse_y_to_gui(0) < y+buttonPosition_y[i]+buttonHeight and front) {
	                mouseOnButton = i
					if (!IS_MOBILE)
						draw_set_color(isCancelButton ? c_orange : (isUseButton ? c_lime : c_ltyellow))
	            }
            
	            draw_roundrect(x+buttonPosition_x[i]+2, y+buttonPosition_y[i]+2, x+buttonPosition_x[i]+buttonWidth-2, y+buttonPosition_y[i]+buttonHeight-2, 0)
	            draw_set_color(c_black)
            
	            if (mouseOnButton != i or IS_MOBILE) draw_set_color(c_white) else draw_set_color(c_black)
	                draw_text_colortags(x+buttonPosition_x[i]+9, y+buttonPosition_y[i]+buttonHeight/2, buttonClipped[i], true)
	            draw_set_color(c_black)
					
				draw_set_default()
			}
        }
    
    if (time > 0) {
		var cltime = (timeStopped or drag) ? c_aqua : c_ltyellow
		draw_set_alpha(mainAlpha*(1-0.4*(time > maxTime)))
		draw_roundrect(x, y-10, x+offX, y+4, 0)
        draw_set_color(cltime) 
            draw_roundrect(x+3, y-8, x+3+min(time/maxTime, 1)*(offX-6), y+2, 0)
        draw_set_alpha(mainAlpha*0.8)
			//draw_text_outline(x+10, y-23, cltime == c_ltyellow ? ltext_stopTimer : ltext_timerStopped, 2, c_black, global.performanceOutFidelty, 0.7, 0.7, 0)
		draw_set_color(c_black) draw_set_alpha(mainAlpha)
    }

	for (i = 0; i < buttonCount; i++) {					
	    if (device_mouse_x_to_gui(0) > x+buttonPosition_x[i] and device_mouse_x_to_gui(0) < x+buttonPosition_x[i]+buttonWidth and
			device_mouse_y_to_gui(0) > y+buttonPosition_y[i] and device_mouse_y_to_gui(0) < y+buttonPosition_y[i]+buttonHeight and front) {
	        mouseOnButton = i
		}

		if (mouseOnButton == i)
		    if (button[i] != buttonClipped[i]) {
				draw_set_font(fontItemInfo)
					show_textbox_tcolor(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), button_colorful[i], string_width(button[i]), string_height(button[i]), mainAlpha)
				draw_set_font(global.mainFont)
			}
					
		mouseOnButton = -1
	}
	
	if (!front) {
		draw_set_alpha(mainAlpha/6)
			draw_roundrect(x, y, x+offX, y+offY, 0)
	}
draw_set_alpha(1) draw_set_default() gpu_set_tex_filter(1)