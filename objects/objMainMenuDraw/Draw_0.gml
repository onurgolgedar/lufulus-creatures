if (instance_exists(objFullscreenButton)) {
	var musicExists = false
	if (audio_is_playing(sndMusicBoss)
		or audio_is_playing(sndMusicCastle)
		or audio_is_playing(sndMusicClassic_calm)
		or audio_is_playing(sndMusicMenu))
	musicExists = true
	
	var musicButtonX = objFullscreenButton.x-95
	var musicButtonY = objFullscreenButton.y
	var mouseOn_musicButton = false
	if (point_distance(mouse_x, mouse_y, musicButtonX, musicButtonY) < 32)
		mouseOn_musicButton = true
	else
		mouseOn_musicButton = false
		
	var breath = contMain.period/320
	var size = 1+breath
	draw_sprite_ext(sprMusic, !musicExists, musicButtonX-1, musicButtonY-1, size+breath+0.15, size+breath+0.15, 0, c_black, image_alpha/2.5)
	draw_sprite_ext(sprMusic, !musicExists, musicButtonX-1, musicButtonY-1, size+breath+0.12, size+breath+0.12, 0, c_black, image_alpha/2.5)
	draw_sprite_ext(sprMusic, !musicExists, musicButtonX, musicButtonY, size, size, 0, c_white, image_alpha)
	
	draw_set_center() draw_set_color(cl) draw_set_font(fontMenuButton) draw_set_alpha(image_alpha)
		draw_text_outline(musicButtonX, musicButtonY+54, musicExists ? (eng() ? "Stop\nMusic" : "Müziği\nDurdur") : (eng() ? "Play\nMusic" : "Müziğe\nDevam"), 3, c_black, 7, 0.55, 0.55, 0)
	draw_set_default() draw_set_alpha(1)
	
	if (mouseOn_musicButton) {
		shader_set(shBright)
		var sh_alpha = contMain.uni_bright_alpha
		shader_set_uniform_f(sh_alpha, (0.7+contMain.period/17)*image_alpha)

		draw_sprite_ext(sprMusic, !musicExists, musicButtonX, musicButtonY, size, size, 0, c_white, image_alpha)
		shader_reset()
		
		if (mouse_check_button_pressed(mb_left) or gamepad_leftpressed()) {
			if (!global.musicStopped or musicExists) {
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

if (room == roomOptions) {
	mouseOn_light = false
	mouseOn_fullscreen = false
	mouseOn_pixelQuality[0] = false
	mouseOn_pixelQuality[1] = false
	mouseOn_pixelQuality[2] = false
	mouseOn_performanceMode[0] = false
	mouseOn_performanceMode[1] = false
	mouseOn_performanceMode[2] = false
	mouseOn_performanceMode[3] = false
	mouseOn_guiSize[0] = false
	mouseOn_guiSize[1] = false
	mouseOn_guiSize[2] = false
	mouseOn_guiSize[3] = false
	mouseOn_turkish = false
	mouseOn_vs = false
	mouseOn_fpsChoice[0] = false
	mouseOn_fpsChoice[1] = false
	mouseOn_fpsChoice[2] = false
	mouseOn_fpsChoice[3] = false
	mouseOn_fpsChoice[4] = false
	mouseOn_fpsChoice[5] = false
	mouseOn_fpsChoice[6] = false
	
	var fontSize = (0.9+image_alpha*0.1+contMain.period/320)*image_xscale
	var button_breath = contMain.period/320
	
	rightSide_x = room_width/2+33
	var leftSide_x = room_width/2+4
	var offset_y = room_height/2-320+IS_MOBILE*20
	offset_y_start = offset_y
	between = 40+IS_MOBILE*6
	var condition, text, mouseOn
	checkButton_between = 40+IS_MOBILE*6

	if (!IS_MOBILE) {
		#region Fullscreen
		// Init
		condition = window_get_fullscreen()
		text = lt_fullscreen
		if (point_distance(mouse_x, mouse_y, rightSide_x, offset_y) < 19+IS_MOBILE*3)
			mouseOn_fullscreen = true
		mouseOn = mouseOn_fullscreen
		
		// Draw
		draw_sprite_ext(sprCheck_button, 0, rightSide_x, offset_y, 1+IS_MOBILE*0.25+button_breath, 1+IS_MOBILE*0.25+button_breath, 0, mouseOn ? c_white : c_gray, image_alpha)
		if (condition)
			draw_sprite_ext(sprCheck, 0, rightSide_x, offset_y, 1+IS_MOBILE*0.25+button_breath, 1+IS_MOBILE*0.25+button_breath, 0, c_white, image_alpha)
		
		draw_set_halign(fa_right) draw_set_valign(fa_center) draw_set_font(fontMenuButton) draw_set_alpha(image_alpha) draw_set_color(cl)
			draw_text_outline(leftSide_x, offset_y, text, 2, c_black, 7, fontSize, fontSize, 0)
		draw_set_default() draw_set_alpha(1)
		#endregion
		offset_y += between
	}
	
	#region Turkish
	// Init
	condition = global.language == lang_turkish
	text = lt_turkish
	if (point_distance(mouse_x, mouse_y, rightSide_x, offset_y) < 19+IS_MOBILE*3)
		mouseOn_turkish = true
	mouseOn = mouseOn_turkish
		
	// Draw
	draw_sprite_ext(sprCheck_button, 0, rightSide_x, offset_y, 1+IS_MOBILE*0.25+button_breath, 1+IS_MOBILE*0.25+button_breath, 0, mouseOn ? c_white : c_gray, image_alpha)
	
	draw_set_halign(fa_center) draw_set_valign(fa_center) draw_set_alpha(image_alpha)
	if (condition) {
		draw_set_color(c_yellow)
			draw_text_outline(rightSide_x, offset_y, "2", 2, c_black, 7, fontSize+0.2, fontSize+0.2, 0)
			
			draw_set_halign(fa_left)
				draw_text_outline(rightSide_x+30, offset_y, "TR", 2, c_black, 7, fontSize+0.15, fontSize+0.15, 0)
			draw_set_halign(fa_right)
		//draw_sprite_ext(sprCheck, 0, rightSide_x, offset_y, 1+IS_MOBILE*0.25+button_breath, 1+IS_MOBILE*0.25+button_breath, 0, c_white, image_alpha)
	}
	else {
		draw_set_color(c_yellow)
			draw_text_outline(rightSide_x, offset_y, "1", 2, c_black, 7, fontSize+0.2, fontSize+0.2, 0)
			
			draw_set_halign(fa_left)
				draw_text_outline(rightSide_x+30, offset_y, "ENG", 2, c_black, 7, fontSize+0.15, fontSize+0.15, 0)
			draw_set_halign(fa_right)
	}
	
	draw_set_font(fontMenuButton) draw_set_alpha(image_alpha) draw_set_color(cl)
		draw_text_outline(leftSide_x, offset_y, text, 2, c_black, 7, fontSize, fontSize, 0)
	draw_set_default() draw_set_alpha(1)
	#endregion
	offset_y += between*(1+IS_MOBILE)
	
	if (!IS_MOBILE) {
		#region GUI Size
		// Init
		text = lt_guisize
	
		if (point_distance(mouse_x, mouse_y, rightSide_x, offset_y) < 19+IS_MOBILE*3)
			mouseOn_guiSize[0] = true
		mouseOn[0] = mouseOn_guiSize[0]
		condition[0] = global.gui_size == 1.4
	
		if (point_distance(mouse_x, mouse_y, rightSide_x+checkButton_between, offset_y) < 19+IS_MOBILE*3)
			mouseOn_guiSize[1] = true
		mouseOn[1] = mouseOn_guiSize[1]
		condition[1] = global.gui_size == 1.3
	
		if (point_distance(mouse_x, mouse_y, rightSide_x+checkButton_between*2, offset_y) < 19+IS_MOBILE*3)
			mouseOn_guiSize[2] = true
		mouseOn[2] = mouseOn_guiSize[2]
		condition[2] = global.gui_size == 1.2
	
		if (point_distance(mouse_x, mouse_y, rightSide_x+checkButton_between*3, offset_y) < 19+IS_MOBILE*3)
			mouseOn_guiSize[3] = true
		mouseOn[3] = mouseOn_guiSize[3]
		condition[3] = global.gui_size == 1.1
		
		// Draw
		draw_set_center() draw_set_color(c_white) draw_set_alpha(image_alpha)
		draw_sprite_ext(sprCheck_button, 0, rightSide_x, offset_y, 1+IS_MOBILE*0.25+button_breath, 1+IS_MOBILE*0.25+button_breath, 0, mouseOn[0] ? c_white : c_gray, image_alpha)
		if (condition[0])
			draw_text_outline(rightSide_x, offset_y, "XS", 2, c_black, 7, fontSize+0.2, fontSize+0.2, 0)
		
		draw_sprite_ext(sprCheck_button, 0, rightSide_x+checkButton_between, offset_y, 1+IS_MOBILE*0.25+button_breath, 1+IS_MOBILE*0.25+button_breath, 0, mouseOn[1] ? c_white : c_gray, image_alpha)
		if (condition[1])
			draw_text_outline(rightSide_x+checkButton_between, offset_y, "S", 2, c_black, 7, fontSize+0.2, fontSize+0.2, 0)
		
		draw_sprite_ext(sprCheck_button, 0, rightSide_x+checkButton_between*2, offset_y, 1+IS_MOBILE*0.25+button_breath, 1+IS_MOBILE*0.25+button_breath, 0, mouseOn[2] ? c_white : c_gray, image_alpha)
		if (condition[2])
			draw_text_outline(rightSide_x+checkButton_between*2, offset_y, "M", 2, c_black, 7, fontSize+0.2, fontSize+0.2, 0)
		
		draw_sprite_ext(sprCheck_button, 0, rightSide_x+checkButton_between*3, offset_y, 1+IS_MOBILE*0.25+button_breath, 1+IS_MOBILE*0.25+button_breath, 0, IS_MOBILE ? (mouseOn[3] ? c_gray : c_dkgray) : (mouseOn[3] ? c_white : c_gray), image_alpha)
		if (condition[3])
			draw_text_outline(rightSide_x+checkButton_between*3, offset_y, "L", 2, c_black, 7, fontSize+0.2, fontSize+0.2, 0)
		
		draw_set_halign(fa_right) draw_set_valign(fa_center) draw_set_font(fontMenuButton) draw_set_color(cl)
			draw_text_outline(leftSide_x, offset_y, text, 2, c_black, 7, fontSize, fontSize, 0)
		draw_set_default() draw_set_alpha(1)
		#endregion
		offset_y += between*2
	}
	
	#region Pixel Quality
	// Init
	text = lt_quality
	
	if (point_distance(mouse_x, mouse_y, rightSide_x, offset_y) < 19+IS_MOBILE*3)
		mouseOn_pixelQuality[0] = true
	mouseOn[0] = mouseOn_pixelQuality[0]
	condition[0] = global.quality == 1
	
	if (point_distance(mouse_x, mouse_y, rightSide_x+checkButton_between, offset_y) < 19+IS_MOBILE*3)
		mouseOn_pixelQuality[1] = true
	mouseOn[1] = mouseOn_pixelQuality[1]
	condition[1] = global.quality == 1.2
	
	if (point_distance(mouse_x, mouse_y, rightSide_x+checkButton_between*2, offset_y) < 19+IS_MOBILE*3)
		mouseOn_pixelQuality[2] = true
	mouseOn[2] = mouseOn_pixelQuality[2]
	condition[2] = global.quality == 1.4
		
	// Draw
	draw_set_center() draw_set_color(c_yellow) draw_set_alpha(image_alpha)
	draw_sprite_ext(sprCheck_button, 0, rightSide_x, offset_y, 1+IS_MOBILE*0.25+button_breath, 1+IS_MOBILE*0.25+button_breath, 0, mouseOn[0] ? c_white : c_gray, image_alpha)
	if (condition[0])
		draw_text_outline(rightSide_x, offset_y, "0", 2, c_black, 7, fontSize+0.2, fontSize+0.2, 0)
		
	draw_sprite_ext(sprCheck_button, 0, rightSide_x+checkButton_between, offset_y, 1+IS_MOBILE*0.25+button_breath, 1+IS_MOBILE*0.25+button_breath, 0, mouseOn[1] ? c_white : c_gray, image_alpha)
	draw_set_color(c_customgreen)
	if (condition[1])
		draw_text_outline(rightSide_x+checkButton_between, offset_y, "1", 2, c_black, 7, fontSize+0.2, fontSize+0.2, 0)
		
	draw_sprite_ext(sprCheck_button, 0, rightSide_x+checkButton_between*2, offset_y, 1+IS_MOBILE*0.25+button_breath, 1+IS_MOBILE*0.25+button_breath, 0, mouseOn[2] ? c_white : c_gray, image_alpha)
	draw_set_color(c_lime)
	if (condition[2])
		draw_text_outline(rightSide_x+checkButton_between*2, offset_y, "2", 2, c_black, 7, fontSize+0.2, fontSize+0.2, 0)
		
	draw_set_halign(fa_right) draw_set_valign(fa_center) draw_set_font(fontMenuButton) draw_set_color(cl)
		draw_text_outline(leftSide_x, offset_y, text, 2, c_black, 7, fontSize, fontSize, 0)
	draw_set_default() draw_set_alpha(1)
	#endregion
	offset_y += between
	
	#region Light
	// Init
	condition = global.lightActive
	text = lt_light
	if (point_distance(mouse_x, mouse_y, rightSide_x, offset_y) < 19+IS_MOBILE*3)
		mouseOn_light = true
	mouseOn = mouseOn_light
	
	// Draw
	draw_sprite_ext(sprCheck_button, 0, rightSide_x, offset_y, 1+IS_MOBILE*0.25+button_breath, 1+IS_MOBILE*0.25+button_breath, 0, mouseOn_light ? c_white : c_gray, image_alpha)
	if (condition)
		draw_sprite_ext(sprCheck, 0, rightSide_x, offset_y, 1+IS_MOBILE*0.25+button_breath, 1+IS_MOBILE*0.25+button_breath, 0, c_white, image_alpha)
	
	draw_set_halign(fa_right) draw_set_valign(fa_center) draw_set_font(fontMenuButton) draw_set_alpha(image_alpha) draw_set_color(cl)
		draw_text_outline(leftSide_x, offset_y, text, 2, c_black, 7, fontSize, fontSize, 0)
	draw_set_default() draw_set_alpha(1)
	#endregion
	offset_y += between
	
	#region Game Quality
	// Init
	text = lt_performance
	
	if (point_distance(mouse_x, mouse_y, rightSide_x, offset_y) < 19+IS_MOBILE*3)
		mouseOn_performanceMode[0] = true
	mouseOn[0] = mouseOn_performanceMode[0]
	condition[0] = global.performanceMode == 0
	
	if (point_distance(mouse_x, mouse_y, rightSide_x+checkButton_between, offset_y) < 19+IS_MOBILE*3)
		mouseOn_performanceMode[1] = true
	mouseOn[1] = mouseOn_performanceMode[1]
	condition[1] = global.performanceMode == 1
	
	if (point_distance(mouse_x, mouse_y, rightSide_x+checkButton_between*2, offset_y) < 19+IS_MOBILE*3)
		mouseOn_performanceMode[2] = true
	mouseOn[2] = mouseOn_performanceMode[2]
	condition[2] = global.performanceMode == 2
	
	if (point_distance(mouse_x, mouse_y, rightSide_x+checkButton_between*3, offset_y) < 19+IS_MOBILE*3)
		mouseOn_performanceMode[3] = true
	mouseOn[3] = mouseOn_performanceMode[3]
	condition[3] = global.performanceMode == 3
		
	// Draw
	draw_set_center() draw_set_color(c_red) draw_set_alpha(image_alpha)
	draw_sprite_ext(sprCheck_button, 0, rightSide_x, offset_y, 1+IS_MOBILE*0.25+button_breath, 1+IS_MOBILE*0.25+button_breath, 0, mouseOn[0] ? c_white : c_gray, image_alpha)
	if (condition[0])
		draw_text_outline(rightSide_x, offset_y, "0", 2, c_black, 7, fontSize+0.2, fontSize+0.2, 0)
		
	draw_set_color(c_orange)
	draw_sprite_ext(sprCheck_button, 0, rightSide_x+checkButton_between, offset_y, 1+IS_MOBILE*0.25+button_breath, 1+IS_MOBILE*0.25+button_breath, 0, mouseOn[1] ? c_white : c_gray, image_alpha)
	if (condition[1])
		draw_text_outline(rightSide_x+checkButton_between, offset_y, "1", 2, c_black, 7, fontSize+0.2, fontSize+0.2, 0)
		
	draw_set_color(c_customgreen)
	draw_sprite_ext(sprCheck_button, 0, rightSide_x+checkButton_between*2, offset_y, 1+IS_MOBILE*0.25+button_breath, 1+IS_MOBILE*0.25+button_breath, 0, mouseOn[2] ? c_white : c_gray, image_alpha)
	if (condition[2])
		draw_text_outline(rightSide_x+checkButton_between*2, offset_y, "2", 2, c_black, 7, fontSize+0.2, fontSize+0.2, 0)
		
	draw_set_color(c_lime)
	draw_sprite_ext(sprCheck_button, 0, rightSide_x+checkButton_between*3, offset_y, 1+IS_MOBILE*0.25+button_breath, 1+IS_MOBILE*0.25+button_breath, 0, mouseOn[3] ? c_white : c_gray, image_alpha)
	if (condition[3])
		draw_text_outline(rightSide_x+checkButton_between*3, offset_y, "3", 2, c_black, 7, fontSize+0.2, fontSize+0.2, 0)
		
	draw_set_halign(fa_right) draw_set_valign(fa_center) draw_set_font(fontMenuButton) draw_set_color(cl)
		draw_text_outline(leftSide_x, offset_y, text, 2, c_black, 7, fontSize, fontSize, 0)
	draw_set_default() draw_set_alpha(1)
	#endregion
	offset_y += between
	
	if (!IS_MOBILE) {
		#region Vertical Sync
		// Init
		condition = global.verticalSync
		text = lt_aa
		if ((global.canChangeVsync and false) and point_distance(mouse_x, mouse_y, rightSide_x, offset_y) < 19+IS_MOBILE*3)
			mouseOn_vs = true
		mouseOn = mouseOn_vs
		
		// Draw
		draw_sprite_ext(sprCheck_button, 0, rightSide_x, offset_y, 1+IS_MOBILE*0.25+button_breath, 1+IS_MOBILE*0.25+button_breath, 0, (mouseOn and global.canChangeVsync and false) ? c_white : ((!global.canChangeVsync or true) ? c_dkgray : c_gray), image_alpha)
		if (condition)
			draw_sprite_ext(sprCheck, 0, rightSide_x, offset_y, 1+IS_MOBILE*0.25+button_breath, 1+IS_MOBILE*0.25+button_breath, 0, c_white, image_alpha)
		
		draw_set_halign(fa_right) draw_set_valign(fa_center) draw_set_font(fontMenuButton) draw_set_alpha(image_alpha)
		if (true or !global.canChangeVsync)
			draw_set_color(c_dkgray)
		else
			draw_set_color(cl)
		
			draw_text_outline(leftSide_x, offset_y, text, 2, c_black, 7, fontSize, fontSize, 0)
		draw_set_default() draw_set_alpha(1)
		#endregion
		offset_y += between
	}
	
	#region FPS Choices
	for (var i = 0; i < 7; i++) {
		// Init
		var canBeChanged = (global.canChangeVsync or IS_MOBILE) and (global.fpsValue[i] <= displayRefreshRate+1 or IS_MOBILE and (global.fpsValue[i] == 60 or global.fpsValue[i] == 30) or global.debugMode)
		condition = (global.manualRefreshRate_mode or IS_MOBILE) and global.refreshRate == global.fpsValue[i]
		text = "FPS"
		var xx = rightSide_x+(i-3)*checkButton_between
		if (canBeChanged and point_distance(mouse_x, mouse_y, xx, offset_y) < 19+IS_MOBILE*3)
			mouseOn_fpsChoice[i] = true
		mouseOn = mouseOn_fpsChoice[i]
		
		// Draw
		draw_sprite_ext(sprCheck_button, 0, xx, offset_y, 1+IS_MOBILE*0.25+button_breath, 1+IS_MOBILE*0.25+button_breath, 0, (mouseOn and canBeChanged) ? c_white : (!canBeChanged ? c_dkgray : c_gray), image_alpha)
		if (condition)
			draw_sprite_ext(sprCheck, 0, xx, offset_y, 1+IS_MOBILE*0.25+button_breath, 1+IS_MOBILE*0.25+button_breath, 0, c_white, image_alpha)
		
		draw_set_color(canBeChanged ? cl : c_dkgray)
		
		draw_set_center() draw_set_alpha(image_alpha)
			draw_text_outline(xx, offset_y+28, global.fpsValue[i], 2, c_black, 7, fontSize, fontSize, 0)		
		draw_set_default() draw_set_alpha(1)
	}
	
	draw_set_halign(fa_right) draw_set_valign(fa_center) draw_set_font(fontMenuButton) draw_set_alpha(image_alpha) draw_set_color(cl)
		draw_text_outline(rightSide_x-3.7*checkButton_between, offset_y+2, text, 2, c_black, 7, fontSize, fontSize, 0)
	draw_set_default() draw_set_alpha(1)
	#endregion
}