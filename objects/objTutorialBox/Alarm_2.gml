draw_set_font(fontTutorial) draw_set_alpha(0)
	var pureText = draw_text_colortags(0, 0, text)
	tW = string_width(pureText)
	tH = string_height(pureText)
draw_set_font(global.mainFont) draw_set_alpha(1)

offset_y += 30+tH/2