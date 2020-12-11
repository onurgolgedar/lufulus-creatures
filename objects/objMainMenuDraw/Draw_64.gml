var wPort = display_get_gui_width()
var hPort = display_get_gui_height()

draw_set_font(fontInfo_small)
	draw_set_color(c_orange)
		draw_text_outline(30, hPort-50, (eng() ? "version " : "sürüm ")+string(VERSION), 2, c_black, 10, 1, 1, 0)
		
	if ((showGPUWarning or room == roomOptions) and os_type == os_windows) {
		draw_set_alpha(0.5) draw_set_color(c_black)
			draw_rectangle(20, 40, 290, 170-!showGPUWarning*68, 0)
		draw_set_alpha(1) draw_set_color(c_white)
		
		draw_text_outline(30, 50, eng() ? ("Graphics Card:\n"+global.graphicsCard) : ("Ekran Kartı:\n"+global.graphicsCard), 2, c_black, 10, 1, 1, 0)
		
		if (showGPUWarning) {
			draw_set_color(c_ltorange)
				draw_text_outline(30, 100, eng() ? ("If it is an integrated GPU,\ntry to open the game with\na dedicated GPU.") : ("Eğer bu bir entegre ekran kartı ise\noyunu, gelişmiş olan ekran kartı\nile açmayı deneyin."), 2, c_black, 10, 1, 1, 0)
		}
	}
	
	if (!global.canChangeVsync and room == roomOptions and os_type == os_windows) {
		draw_set_alpha(0.5) draw_set_color(c_black)
			draw_rectangle(20, 180-!showGPUWarning*68, 305, 240-!showGPUWarning*68, 0)
		draw_set_alpha(1) draw_set_color(c_white)
		
		draw_set_color(c_ltorange)
			if (global.gpuControlProblem)
				draw_text_outline(30, 190-!showGPUWarning*68, eng() ? ("GPU permission is needed to\nbe able to change FPS.") : ("FPS değerlerini değiştirebilmek için\nGPU izni gerekmektedir."), 2, c_black, 10, 1, 1, 0)
			else
				draw_text_outline(30, 190-!showGPUWarning*68, eng() ? ("FPS cannot be changed because\nyou skipped the configration phase.") : ("FPS değerleri değiştirilemez\nçünkü konfigrasyon kısmını atladınız."), 2, c_black, 10, 1, 1, 0)
	}
draw_set_default()

if (room == roomOptions) {
	draw_set_alpha(image_alpha)
	draw_set_font(fontMenuButton)
	draw_set_center()
	#region Audio Control Triangle
	var outlineWidth_triangle = 4
	var startX_triangle = display_get_gui_width()/2-297
	var startY_triangle = display_get_gui_height()/2+95+45*!IS_MOBILE
	var width_triangle = 150
	var height_triangle = 60
	var value_triangle = audio_get_master_gain(0)
	var no_triangle = 3
	
	if (device_mouse_x_to_gui(0) < startX_triangle+width_triangle and device_mouse_x_to_gui(0) > startX_triangle
		and device_mouse_y_to_gui(0) > startY_triangle-height_triangle and device_mouse_y_to_gui(0) < startY_triangle) {
		mouseOn_triangle = no_triangle
		if (mouse_check_button_pressed(mb_left) or gamepad_leftpressed())
			mouseHoldOn_triangle = no_triangle
	}
	var color_triangle = (mouseOn_triangle == no_triangle or mouseHoldOn_triangle == no_triangle) ? c_customgreen_compare : c_green
	
	draw_set_color(c_black) draw_set_alpha(0.6*image_alpha)
		draw_triangle(startX_triangle-outlineWidth_triangle*5, startY_triangle+outlineWidth_triangle, startX_triangle+width_triangle+outlineWidth_triangle,
		startY_triangle+outlineWidth_triangle, startX_triangle+width_triangle+outlineWidth_triangle, startY_triangle-height_triangle-outlineWidth_triangle, 0)
		draw_triangle(startX_triangle-outlineWidth_triangle*5-4, startY_triangle+outlineWidth_triangle+1, startX_triangle+width_triangle+outlineWidth_triangle+1,
		startY_triangle+outlineWidth_triangle+2, startX_triangle+width_triangle+outlineWidth_triangle+1, startY_triangle-height_triangle-outlineWidth_triangle-3, 0)
	draw_set_color(cl_dark) draw_set_alpha(image_alpha)
		draw_triangle(startX_triangle, startY_triangle, startX_triangle+width_triangle, startY_triangle,
		startX_triangle+width_triangle, startY_triangle-height_triangle, 0)
	draw_set_color(color_triangle)
		draw_triangle(startX_triangle, startY_triangle, startX_triangle+width_triangle*value_triangle, startY_triangle,
		startX_triangle+width_triangle*value_triangle, startY_triangle-height_triangle*value_triangle, 0)
	draw_set_color(c_black)
	draw_line_width(startX_triangle+width_triangle*value_triangle, startY_triangle, startX_triangle+width_triangle*value_triangle, startY_triangle-height_triangle*value_triangle-1, 2)
	
	draw_set_color(cl)
		draw_text_outline(startX_triangle+width_triangle/2, startY_triangle+19, eng() ? "Master Volume" : "Genel Ses Düzeyi", 2, c_black, 7, 0.6, 0.6, 0)
		draw_text_outline(startX_triangle+width_triangle/2, startY_triangle+39, eng() ? ("%"+string(ceil(value_triangle*100))) : (string(ceil(value_triangle*100))+"%"), 2, c_black, 7, 0.45, 0.45, 0)
	draw_set_color(c_black)
		
	if (mouseHoldOn_triangle == no_triangle) {
		var ratio = (device_mouse_x_to_gui(0)-startX_triangle)/width_triangle
		if (ratio >= 0 and ratio <= 1)
			audio_set_master_gain(0, (device_mouse_x_to_gui(0)-startX_triangle)/width_triangle)
		else if (ratio > 1)
			audio_set_master_gain(0, 1)
		else
			audio_set_master_gain(0, 0)
	}
	#endregion
	#region Audio Control Triangle
	var outlineWidth_triangle = 4
	startX_triangle += 220
	startY_triangle = display_get_gui_height()/2+95+45*!IS_MOBILE
	var width_triangle = 150
	var height_triangle = 60
	var value_triangle = global.audio_gain_music
	var no_triangle = 1
	
	if (device_mouse_x_to_gui(0) < startX_triangle+width_triangle and device_mouse_x_to_gui(0) > startX_triangle
		and device_mouse_y_to_gui(0) > startY_triangle-height_triangle and device_mouse_y_to_gui(0) < startY_triangle) {
		mouseOn_triangle = no_triangle
		if (mouse_check_button_pressed(mb_left) or gamepad_leftpressed())
			mouseHoldOn_triangle = no_triangle
	}
	var color_triangle = (mouseOn_triangle == no_triangle or mouseHoldOn_triangle == no_triangle) ? c_customgreen_compare : c_green
	
	draw_set_color(c_black) draw_set_alpha(0.6*image_alpha)
		draw_triangle(startX_triangle-outlineWidth_triangle*5, startY_triangle+outlineWidth_triangle, startX_triangle+width_triangle+outlineWidth_triangle,
		startY_triangle+outlineWidth_triangle, startX_triangle+width_triangle+outlineWidth_triangle, startY_triangle-height_triangle-outlineWidth_triangle, 0)
		draw_triangle(startX_triangle-outlineWidth_triangle*5-4, startY_triangle+outlineWidth_triangle+1, startX_triangle+width_triangle+outlineWidth_triangle+1,
		startY_triangle+outlineWidth_triangle+2, startX_triangle+width_triangle+outlineWidth_triangle+1, startY_triangle-height_triangle-outlineWidth_triangle-3, 0)
	draw_set_color(cl_dark) draw_set_alpha(image_alpha)
		draw_triangle(startX_triangle, startY_triangle, startX_triangle+width_triangle, startY_triangle,
		startX_triangle+width_triangle, startY_triangle-height_triangle, 0)
	draw_set_color(color_triangle)
		draw_triangle(startX_triangle, startY_triangle, startX_triangle+width_triangle*value_triangle, startY_triangle,
		startX_triangle+width_triangle*value_triangle, startY_triangle-height_triangle*value_triangle, 0)
	draw_set_color(c_black)
	draw_line_width(startX_triangle+width_triangle*value_triangle, startY_triangle, startX_triangle+width_triangle*value_triangle, startY_triangle-height_triangle*value_triangle-1, 2)
	
	draw_set_color(cl)
		draw_text_outline(startX_triangle+width_triangle/2, startY_triangle+19, eng() ? "Music" : "Müzik", 2, c_black, 7, 0.6, 0.6, 0)
		draw_text_outline(startX_triangle+width_triangle/2, startY_triangle+39, eng() ? ("%"+string(ceil(value_triangle*100))) : (string(ceil(value_triangle*100))+"%"), 2, c_black, 7, 0.45, 0.45, 0)
	draw_set_color(c_black)
	
	if (device_mouse_x_to_gui(0) < startX_triangle+width_triangle and device_mouse_x_to_gui(0) > startX_triangle and
		device_mouse_y_to_gui(0) > startY_triangle-height_triangle and device_mouse_y_to_gui(0) < startY_triangle) {
			mouseOn_triangle = no_triangle
		if (mouse_check_button_pressed(mb_left) or gamepad_leftpressed())
			mouseHoldOn_triangle = no_triangle
	}
		
	if (mouseHoldOn_triangle == no_triangle) {
		var ratio = (device_mouse_x_to_gui(0)-startX_triangle)/width_triangle
		if (ratio >= 0 and ratio <= 1)
			change_gain_music((device_mouse_x_to_gui(0)-startX_triangle)/width_triangle)
		else if (ratio > 1)
			change_gain_music(1)
		else
			change_gain_music(0)
	}
	#endregion
	#region Audio Control Triangle
	var outlineWidth_triangle = 4
	startX_triangle += 220
	startY_triangle = display_get_gui_height()/2+95+45*!IS_MOBILE
	var width_triangle = 150
	var height_triangle = 60
	var value_triangle = global.audio_gain_nonmusic
	var no_triangle = 2
	
	if (device_mouse_x_to_gui(0) < startX_triangle+width_triangle and device_mouse_x_to_gui(0) > startX_triangle
		and device_mouse_y_to_gui(0) > startY_triangle-height_triangle and device_mouse_y_to_gui(0) < startY_triangle) {
		mouseOn_triangle = no_triangle
		if (mouse_check_button_pressed(mb_left) or gamepad_leftpressed())
			mouseHoldOn_triangle = no_triangle
	}
	var color_triangle = (mouseOn_triangle == no_triangle or mouseHoldOn_triangle == no_triangle) ? c_customgreen_compare : c_green
	
	draw_set_color(c_black) draw_set_alpha(0.6*image_alpha)
		draw_triangle(startX_triangle-outlineWidth_triangle*5, startY_triangle+outlineWidth_triangle, startX_triangle+width_triangle+outlineWidth_triangle,
		startY_triangle+outlineWidth_triangle, startX_triangle+width_triangle+outlineWidth_triangle, startY_triangle-height_triangle-outlineWidth_triangle, 0)
		draw_triangle(startX_triangle-outlineWidth_triangle*5-4, startY_triangle+outlineWidth_triangle+1, startX_triangle+width_triangle+outlineWidth_triangle+1,
		startY_triangle+outlineWidth_triangle+2, startX_triangle+width_triangle+outlineWidth_triangle+1, startY_triangle-height_triangle-outlineWidth_triangle-3, 0)
	draw_set_color(cl_dark) draw_set_alpha(image_alpha)
		draw_triangle(startX_triangle, startY_triangle, startX_triangle+width_triangle, startY_triangle,
		startX_triangle+width_triangle, startY_triangle-height_triangle, 0)
	draw_set_color(color_triangle)
		draw_triangle(startX_triangle, startY_triangle, startX_triangle+width_triangle*value_triangle, startY_triangle,
		startX_triangle+width_triangle*value_triangle, startY_triangle-height_triangle*value_triangle, 0)
	draw_set_color(c_black)
	draw_line_width(startX_triangle+width_triangle*value_triangle, startY_triangle, startX_triangle+width_triangle*value_triangle, startY_triangle-height_triangle*value_triangle-1, 2)
	
	draw_set_color(cl)
		draw_text_outline(startX_triangle+width_triangle/2, startY_triangle+19, eng() ? "Sound Effects" : "Ses Efektleri", 2, c_black, 7, 0.6, 0.6, 0)
		draw_text_outline(startX_triangle+width_triangle/2, startY_triangle+39, eng() ? ("%"+string(ceil(value_triangle*100))) : (string(ceil(value_triangle*100))+"%"), 2, c_black, 7, 0.45, 0.45, 0)
	draw_set_color(c_black)
		
	if (device_mouse_x_to_gui(0) < startX_triangle+width_triangle and device_mouse_x_to_gui(0) > startX_triangle and
		device_mouse_y_to_gui(0) > startY_triangle-height_triangle and device_mouse_y_to_gui(0) < startY_triangle) {
			mouseOn_triangle = no_triangle
		if (mouse_check_button_pressed(mb_left) or gamepad_leftpressed())
			mouseHoldOn_triangle = no_triangle
	}
		
	if (mouseHoldOn_triangle == no_triangle) {
		var ratio = (device_mouse_x_to_gui(0)-startX_triangle)/width_triangle
		if (ratio >= 0 and ratio <= 1)
			change_gain_nonmusic((device_mouse_x_to_gui(0)-startX_triangle)/width_triangle)
		else if (ratio > 1)
			change_gain_nonmusic(1)
		else
			change_gain_nonmusic(0)
	}
	#endregion
	mouseOn_triangle = -1
	
	draw_set_default()
	draw_set_alpha(1)
}

if (blackScreenAlpha != 0) {
	draw_set_alpha(blackScreenAlpha)
		draw_rectangle(-1, -1, wPort, hPort, 0)
	draw_set_alpha(1)
}