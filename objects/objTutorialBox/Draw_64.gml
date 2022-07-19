if (inView and !is_cinematic() and global.showGUI) {
	if (mouseNear) {
		draw_set_color(c_ltyellow) draw_set_alpha(image_alpha*alphaFactor*0.5)
			draw_rectangle(x-tW/2-5, y-tH/2-2, x+tW/2+5, y+tH/2+2, 0)
	
		draw_set_color(c_black)
			draw_rectangle(x-tW/2-5, y-tH/2-2+tH_title, x+tW/2+5, y+tH/2+2, 0)

		draw_set_alpha(image_alpha*alphaFactor) draw_set_font(fontTutorial)
			draw_rectangle_width(x-tW/2-5, y-tH/2-2, x+tW/2+5, y+tH/2+2, 3)

			draw_text_colortags(x-tW/2, y-tH/2, text)
		draw_set_center() draw_set_font(fontMain)
	}

	draw_set_alpha(image_alpha*(1-alphaFactor))
		if (title != "") {
			draw_set_color(c_yellow) draw_set_center()
				draw_text_outline(x-offset_x, y-offset_y+40, title, 2, c_black, global.performanceOutFidelty, 1, 1, 0)
			draw_set_default()
		}
	
	draw_set_color(c_yellow) draw_set_alpha(image_alpha*(0.2+alphaFactor/5))
		var xx = x-offset_x
		var yy = y-offset_y

		if (mouseNear and !mouse_ison_window) {
			draw_sprite_ext(sprinfoCircle, imageNumber+2, xx, yy, image_xscale, image_yscale, 0, c_white, image_alpha)
		
			draw_set_color(c_yellow)
		}
		
		draw_set_alpha(image_alpha)
		
		draw_sprite_ext(sprinfoCircle, imageNumber, xx, yy, image_xscale, image_yscale, 0, c_white, image_alpha)
	draw_set_default() draw_set_alpha(1)
}