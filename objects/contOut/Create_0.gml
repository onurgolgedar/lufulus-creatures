delta_alarm(0, sec/4)
alarm[1] = 2

image_alpha = 0

init_cinematic()

mouseOnNext = false
mouseOnBack = false
backButton_isActive = false
blackScreenAlpha = 0
global_tab = false

if (maxPage != -1) {
	draw_set_font(fontCinematic) draw_set_alpha(0)
		cinematicText_width = string_width(draw_text_colortags(0, 0, cinematicText[page-1]))
	draw_set_font(global.mainFont) draw_set_alpha(1)
}