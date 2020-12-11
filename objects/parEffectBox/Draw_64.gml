if (owner.object_index == objPlayer and visible and global.showGUI) {	
	draw_sprite_ext(sprEfboxOut, 0, xx, 31, 1, 1, 0, image_blend, image_alpha)
	
	draw_sprite_ext(sprite_index, image_index, xx, 31, 1, 1, 0, image_blend, (0.6+mouseOn*0.4)*image_alpha)

	if (time > 0)
		draw_sprite_general(sprEfboxOut, 1, 0, 0, sprite_get_width(sprEfboxOut), 5+(sprite_get_height(sprEfboxOut)-5)*time/maxTime, xx-sprite_get_width(sprEfboxOut)/2, 31-sprite_get_height(sprEfboxOut)/2, 1, 1, 0, c_white, c_white, c_white, c_white, image_alpha)
	
	if (mouseOn) {		
		draw_sprite_ext(sprEfboxOut, 2, xx, 31, 1, 1, 0, c_aqua, 0.3*image_alpha)
		
		draw_set_font(fontItemInfo) draw_set_alpha(image_alpha)
			show_textbox_tcolor(xx-25, 63, description, tbW, tbH)
		draw_set_font(global.mainFont) draw_set_alpha(1)
	}
}