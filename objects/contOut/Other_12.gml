if (page > 1) {
	page--
	
	draw_set_font(fontCinematic) draw_set_alpha(0)
		cinematicText_width = string_width(draw_text_colortags(0, 0, cinematicText[page-1]))
	draw_set_font(global.mainFont) draw_set_alpha(1)
	
	image_alpha = 0
	blackScreenAlpha = 1
	
	if (page == 1)
		backButton_isActive = false
	else
		backButton_isActive = true
}