event_inherited()

if (death and ds_list_size(droppedList) > 0) {
	draw_set_color(c_ltblue) draw_set_center()
		draw_text_outline(screen_point(x, 0), screen_point(y, 1)-50+contMain.period, dropText, 2, c_black, global.performanceOutFidelty, 1, 1, 0)
	draw_set_default()
}