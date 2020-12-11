var x_mid = display_get_gui_width()/2
var y_mid = display_get_gui_height()/2

if (room == roomCinematic) {
	var buttonAlpha = image_alpha*2-1.5
	
	if (sprite[page-1] != sprNothingness)
		draw_rectangle(-10, -10, display_get_width()+10, display_get_gui_height()+10, 0)
	
	draw_sprite_ext(sprite[page-1], -1, x_mid, y_mid-65+contMain.period/2, 0.86+!IS_MOBILE*0.1, 0.86+!IS_MOBILE*0.1, 0, c_white, image_alpha*3)

	var xx = display_get_gui_width()/2+cinematicText_width/2+45+IS_MOBILE*40
	var yy = display_get_gui_height()-120-IS_MOBILE*60
	draw_sprite_ext(sprCinematicNext, 0, xx, yy, 1+IS_MOBILE*0.5+contMain.period/150, 1+IS_MOBILE*0.5+contMain.period/150, 0, c_white, buttonAlpha*0.8+mouseOnNext*0.15)
	
	if (page == maxPage)
		draw_sprite_ext(sprCinematicNext, 0, xx, yy, 1+IS_MOBILE*0.5+contMain.period/150, 1+IS_MOBILE*0.5+contMain.period/150, 0, c_lime, buttonAlpha*0.5+mouseOnNext*0.1)
	
	if (backButton_isActive) {
		var xx2 = display_get_gui_width()/2-cinematicText_width/2-45-IS_MOBILE*40
		draw_sprite_ext(sprCinematicNext, 0, xx2, yy, -1-IS_MOBILE*0.5-contMain.period/150, 1+IS_MOBILE*0.5+contMain.period/150, 0, c_white, buttonAlpha*0.8+mouseOnBack*0.15)
	}
	
	draw_set_alpha(image_alpha) draw_set_halign(fa_center) draw_set_valign(fa_center) draw_set_font(fontCinematic) draw_set_color(c_white)
		draw_text_outline(x_mid, yy+(35+IS_MOBILE*20)-image_alpha*(35+IS_MOBILE*20), cinematicText[page-1], 2, c_black, 8, 0.85+IS_MOBILE*0.15+contMain.period/2000, 0.85+IS_MOBILE*0.15+contMain.period/2000, 0)
	draw_set_alpha(1) draw_set_color(c_black)
}

if (blackScreenAlpha != 0) {
	var wPort = display_get_gui_width()
	var hPort = display_get_gui_height()
	draw_set_alpha(blackScreenAlpha)
		draw_rectangle(-1, -1, wPort, hPort, 0)
	draw_set_alpha(1)
}

draw_set_default()