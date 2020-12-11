if (surface_exists(textbox_surface))
	draw_surface(textbox_surface, 0, 0)
else
	textbox_surface = create_surface(display_get_gui_width(), display_get_gui_height())

surface_set_target(textbox_surface)
	draw_clear_alpha(c_black, 0)
surface_reset_target()

if (global.consoleMode) {
	draw_set_valign(fa_center) draw_set_halign(fa_center) draw_set_font(fontConsole) gpu_set_tex_filter(1)
		var tbW = string_width(keyboard_string)
	
		draw_set_alpha(0.5) draw_set_color(c_black)
			draw_roundrect(display_get_gui_width()/2-tbW/2-4-10, display_get_gui_height()/2-200-18-8, display_get_gui_width()/2+tbW/2+4+10, display_get_gui_height()/2-200+18+8, 0)
		draw_set_color(c_white)
			draw_roundrect(display_get_gui_width()/2-tbW/2-4, display_get_gui_height()/2-200-18, display_get_gui_width()/2+tbW/2+4, display_get_gui_height()/2-200+18, 0)
		draw_set_alpha(1) draw_set_color(c_black)
		
		draw_text(display_get_gui_width()/2, display_get_gui_height()/2-200-48, "Command:")
		draw_text(display_get_gui_width()/2, display_get_gui_height()/2-200, keyboard_string)
		draw_text(display_get_gui_width()/2, display_get_gui_height()/2-200+52, "-help")
	draw_set_default() gpu_set_tex_filter(1)
}

if (global.pause) {
	var gui_size = display_get_gui_width()/view_get_wport(0)
	
	if (!IS_MOBILE) {
		if (screenSave != pointer_null and surface_exists(screenSave))
			draw_surface_ext(screenSave, 0, 0, 1/global.quality*gui_size, 1/global.quality*gui_size, 0, c_white, 1)
		else
			screenSave = create_surface(1, 1)
	}
	else
		draw_rectangle(-1, -1, display_get_gui_width()+1, display_get_gui_height()+1, false)
}

if (global.pause or is_room_out() and instance_number(objMessageBox) == 1 and objMessageBox.menuBox) {
	draw_set_alpha(0.7)
		draw_rectangle(-1, -1, display_get_gui_width()+1, display_get_gui_height()+1, false)
	draw_set_alpha(0.7) draw_set_color(c_dkorange)
		draw_rectangle(-1, -1, display_get_gui_width(), 185+IS_MOBILE*15, false)
	draw_set_alpha(0.3) draw_set_color(c_black)
		draw_rectangle(-1, -1, display_get_gui_width(), 185+IS_MOBILE*15, false)
	draw_set_alpha(0.6) draw_set_color(c_black)
		draw_rectangle(-1, -1, display_get_gui_width(), 30, false)
	draw_set_alpha(1)
}

if (global.pause) {
	#region Audio Control Triangle
	var outlineWidth_triangle = 4
	var width_triangle = 180
	var startX_triangle = display_get_gui_width()-180-98+20*IS_MOBILE
	var startY_triangle = 130
	var height_triangle = 70
	var value_triangle = audio_get_master_gain(0)
	var no_triangle = 3
	
	if (device_mouse_x_to_gui(0) < startX_triangle+width_triangle and device_mouse_x_to_gui(0) > startX_triangle
		and device_mouse_y_to_gui(0) > startY_triangle-height_triangle and device_mouse_y_to_gui(0) < startY_triangle) {
		mouseOn_triangle = no_triangle
		if (mouse_check_button_pressed(mb_left) or gamepad_leftpressed())
			mouseHoldOn_triangle = no_triangle
	}
	var color_triangle = (mouseOn_triangle == no_triangle or mouseHoldOn_triangle == no_triangle) ? c_lime : c_green
	
	draw_set_color(c_black)
		draw_triangle(startX_triangle-outlineWidth_triangle*5, startY_triangle+outlineWidth_triangle, startX_triangle+width_triangle+outlineWidth_triangle,
		startY_triangle+outlineWidth_triangle, startX_triangle+width_triangle+outlineWidth_triangle, startY_triangle-height_triangle-outlineWidth_triangle, 0)
	draw_set_color(color_triangle)
		draw_triangle(startX_triangle, startY_triangle, startX_triangle+width_triangle*value_triangle, startY_triangle,
		startX_triangle+width_triangle*value_triangle, startY_triangle-height_triangle*value_triangle, 0)
	draw_set_color(c_white)
	
	draw_set_font(fontTag) draw_set_center()
		draw_text(startX_triangle+width_triangle/2, startY_triangle+20, eng() ? ("Master Volume: %"+string(ceil(value_triangle*100))) : ("Genel Ses Düzeyi: "+string(ceil(value_triangle*100))+"%"))
	draw_set_default()
		
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
	var width_triangle = 180
	var startX_triangle = display_get_gui_width()-180-318+20*IS_MOBILE
	var startY_triangle = 130
	var height_triangle = 70
	var value_triangle = global.audio_gain_music
	var no_triangle = 1
	
	if (device_mouse_x_to_gui(0) < startX_triangle+width_triangle and device_mouse_x_to_gui(0) > startX_triangle
		and device_mouse_y_to_gui(0) > startY_triangle-height_triangle and device_mouse_y_to_gui(0) < startY_triangle) {
		mouseOn_triangle = no_triangle
		if (mouse_check_button_pressed(mb_left) or gamepad_leftpressed())
			mouseHoldOn_triangle = no_triangle
	}
	var color_triangle = (mouseOn_triangle == no_triangle or mouseHoldOn_triangle == no_triangle) ? c_lime : c_green
	
	draw_set_color(c_black)
		draw_triangle(startX_triangle-outlineWidth_triangle*5, startY_triangle+outlineWidth_triangle, startX_triangle+width_triangle+outlineWidth_triangle,
		startY_triangle+outlineWidth_triangle, startX_triangle+width_triangle+outlineWidth_triangle, startY_triangle-height_triangle-outlineWidth_triangle, 0)
	draw_set_color(color_triangle)
		draw_triangle(startX_triangle, startY_triangle, startX_triangle+width_triangle*value_triangle, startY_triangle,
		startX_triangle+width_triangle*value_triangle, startY_triangle-height_triangle*value_triangle, 0)
	draw_set_color(c_white)
	
	draw_set_font(fontTag) draw_set_center()
		draw_text(startX_triangle+width_triangle/2, startY_triangle+20, eng() ? ("Music: %"+string(ceil(value_triangle*100))) : ("Müzik: "+string(ceil(value_triangle*100))+"%"))
	draw_set_default()
		
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
	var width_triangle = 180
	var startX_triangle = display_get_gui_width()-180-538+20*IS_MOBILE
	var startY_triangle = 130
	var height_triangle = 80
	var value_triangle = global.audio_gain_nonmusic
	var no_triangle = 2
	
	if (device_mouse_x_to_gui(0) < startX_triangle+width_triangle and device_mouse_x_to_gui(0) > startX_triangle
		and device_mouse_y_to_gui(0) > startY_triangle-height_triangle and device_mouse_y_to_gui(0) < startY_triangle) {
		mouseOn_triangle = no_triangle
		if (mouse_check_button_pressed(mb_left) or gamepad_leftpressed())
			mouseHoldOn_triangle = no_triangle
	}
	var color_triangle = (mouseOn_triangle == no_triangle or mouseHoldOn_triangle == no_triangle) ? c_lime : c_green
	
	draw_set_color(c_black)
		draw_triangle(startX_triangle-outlineWidth_triangle*5, startY_triangle+outlineWidth_triangle, startX_triangle+width_triangle+outlineWidth_triangle,
		startY_triangle+outlineWidth_triangle, startX_triangle+width_triangle+outlineWidth_triangle, startY_triangle-height_triangle-outlineWidth_triangle, 0)
	draw_set_color(color_triangle)
		draw_triangle(startX_triangle, startY_triangle, startX_triangle+width_triangle*value_triangle, startY_triangle,
		startX_triangle+width_triangle*value_triangle, startY_triangle-height_triangle*value_triangle, 0)
	draw_set_color(c_white)
	
	draw_set_font(fontTag) draw_set_center()
		draw_text(startX_triangle+width_triangle/2, startY_triangle+20, eng() ? ("Sound Effects: %"+string(ceil(value_triangle*100))) : ("Ses Efektleri: "+string(ceil(value_triangle*100))+"%"))
	draw_set_default()
		
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
	draw_set_default()
	mouseOn_triangle = -1
	
	var musicExists = false
	if (audio_is_playing(sndMusicBoss)
		or audio_is_playing(sndMusicCastle)
		or audio_is_playing(sndMusicClassic_calm)
		or audio_is_playing(sndMusicMenu))
	musicExists = true
	
	var musicButtonX = display_get_gui_width()-180-650+28*IS_MOBILE
	var musicButtonY = 104
	var mouseOn_musicButton = false
	if (point_distance(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), musicButtonX, musicButtonY) < 32)
		mouseOn_musicButton = true
	else
		mouseOn_musicButton = false
		
	var breath = contMain.period/320
	var size = 1+breath
	
	draw_sprite_ext(sprMusic, !musicExists, musicButtonX-1, musicButtonY-1, size+breath+0.15, size+breath+0.15, 0, c_black, image_alpha/2.5)
	draw_sprite_ext(sprMusic, !musicExists, musicButtonX-1, musicButtonY-1, size+breath+0.12, size+breath+0.12, 0, c_black, image_alpha/2.5)
	draw_sprite_ext(sprMusic, !musicExists, musicButtonX, musicButtonY, size, size, 0, c_white, image_alpha)

	draw_set_center() draw_set_color(c_white) draw_set_font(fontTag) draw_set_alpha(image_alpha)
		draw_text(musicButtonX, musicButtonY+46, musicExists ? (eng() ? "Stop Music" : "Müziği Kapat") : (eng() ? "Play Music" : "Müziğe Devam"))
	draw_set_default() draw_set_alpha(1)
	
	if (mouseOn_musicButton) {
		shader_set(shBright)
		var sh_alpha = contMain.uni_bright_alpha
		shader_set_uniform_f(sh_alpha, (0.7+contMain.period/17)*image_alpha)

		draw_sprite_ext(sprMusic, !musicExists, musicButtonX, musicButtonY, size, size, 0, c_white, image_alpha)
		shader_reset()
		
		if (mouse_check_button_pressed(mb_left) or gamepad_leftpressed()) {
			if (musicExists) {
				global.musicStopped = true
				audio_stop_sound(sndMusicBoss)
				audio_stop_sound(sndMusicCastle)
				audio_stop_sound(sndMusicClassic_calm)
				audio_stop_sound(sndMusicMenu)
				audio_play_sound(sndWindowTick, 10, false)
			}
			else {
				global.musicStopped = false
				start_room_music()
			}
		}
	}
}

if (fps < room_speed*0.92 and room != roomMenu and global.gameTime-startTime > 3) {
	draw_set_font(fontMessageTitle)
		draw_text(18, 250, "FPS/RS: "+string(round(fps))+"/"+string(room_speed)/*+string_return(" (Free) ", global.freeFPS_mode and game_get_speed(gamespeed_fps) == 0)*/)
		if (global.debugMode) {
			draw_text(18, 280, "Physics Speed: "+string(global.physics_world_speed))
			draw_text(18, 310, "Calculated: "+string(global.averageFPS))
			draw_text(18, 340, "Real FPS: "+string(fps_real))
			draw_text(18, 370, "Perform Well: "+string(performWell ? "True" : "False"))
		
			if (fps_real < room_speed) {
				draw_set_color(c_purple)
					draw_text(18, 400, "FPS drop risk!")
				draw_set_color(c_black)
			}
		}
	draw_set_default()
}