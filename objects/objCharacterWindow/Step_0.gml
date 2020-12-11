if (!destroy) {
	if (front)
		event_perform(ev_other, ev_user1)
		
	if (gamepad_button_check_pressed(global.gamepad, gp_stickr) or gamepad_leftpressed())
		event_perform(ev_mouse, ev_global_right_press)
		
	if (gamepad_button_check_released(global.gamepad, gp_shoulderl))
		event_perform(ev_mouse, ev_global_left_release)
		
	if (greenForeground_alpha > 0)
		greenForeground_alpha -= 0.05
	
    if ((mouse_check_button_pressed(mb_left) or gamepad_leftpressed() or gamepad_button_check_pressed(global.gamepad, gp_shoulderl))
	and !test_upperclick_window() and !test_upperclick_tutorial(true)) {
        event_perform(ev_other, ev_user1)    
		
		if (mouseOnBody and !mouseOnExit and !mouseOnPageButton1 and !mouseOnPageButton2 and !mouseOnPageButton3
		and !mouseOnSTR and !mouseOnDEX and !mouseOnMP and !mouseOnVIT and !mouseOnSTA and !mouseOnSaveButton and !mouseOnUndoButton) {
	        dragHOffset = device_mouse_x_to_gui(0)-x
	        dragVOffset = device_mouse_y_to_gui(0)-y
	        drag = true
			
			event_perform(ev_other, ev_user0)
		}
    }
    
    if (front and (global.itemSelected != -1 or multitouchClick or (mouse_check_button_pressed(mb_left) and !IS_MOBILE) or imaginaryClick or gamepad_leftpressed() or gamepad_button_check_pressed(global.gamepad, gp_shoulderl))
	and !test_upperclick_window() and !test_upperclick_tutorial(true)) {
		imaginaryClick = false
		
        if (mouseOnPageButton1 and page != 1) {
            page = 1
			audio_play_sound(sndMenuTick, 1, 0)
		}
        else if (mouseOnPageButton2 and page != 2) {
            page = 2
			audio_play_sound(sndMenuTick, 1, 0)
		}
        else if (mouseOnPageButton3 and page != 3) {
            page = 3
			audio_play_sound(sndMenuTick, 1, 0)
		}
		else if (mouseOnSaveButton and global.virtual_stat_points != global.statPoints and global.itemSelected == -1) {
			global.givenStr += global.virtual_str
			global.givenDex += global.virtual_dex
			global.givenVit += global.virtual_vit
			global.givenMp += global.virtual_mp
			global.givenSta += global.virtual_sta
			global.statPoints = global.virtual_stat_points
			
			global.virtual_str = 0
			global.virtual_dex = 0
			global.virtual_vit = 0
			global.virtual_mp = 0
			global.virtual_sta = 0
			update_character()
			
			audio_play_sound(sndMenuTick, 1, 0)
			
			save_stats(global.saveNo)
			
			global.anticheat_stats = recalculate_sha_stats()
		}
		else if (mouseOnUndoButton and global.virtual_stat_points != global.statPoints and global.itemSelected == -1) {			
			global.virtual_str = 0
			global.virtual_dex = 0
			global.virtual_vit = 0
			global.virtual_mp = 0
			global.virtual_sta = 0
			global.virtual_stat_points = global.statPoints
			update_character()
			
			global.anticheat_stats = recalculate_sha_stats()
			
			audio_play_sound(sndMenuTick, 1, 0)
		}
		else if (global.virtual_stat_points > 0 and (!IS_MOBILE or multitouchClick) and global.itemSelected == -1) {
	        if (mouseOnSTR) {
				global.virtual_stat_points--
				global.virtual_str++
				update_character()
				
				if (ds_list_find_index(global.takenTutorials, 11) == -1)
					ds_list_add(global.takenTutorials, 11)
				
				global.anticheat_stats = recalculate_sha_stats()
				
				greenForeground_alpha = 0.9
				audio_play_sound(sndMenuTick, 1, 0)
				statText_alpha = -0.5
			}
	        else if (mouseOnDEX) {
				global.virtual_stat_points--
				global.virtual_dex++
				update_character()
		
				if (ds_list_find_index(global.takenTutorials, 11) == -1)
					ds_list_add(global.takenTutorials, 11)
				
				global.anticheat_stats = recalculate_sha_stats()
				
				greenForeground_alpha = 0.9
				audio_play_sound(sndMenuTick, 1, 0)
				statText_alpha = -0.5
			}
	        else if (mouseOnVIT) {
				global.virtual_stat_points--
				global.virtual_vit++
				update_character()
				
				if (ds_list_find_index(global.takenTutorials, 11) == -1)
					ds_list_add(global.takenTutorials, 11)
				
				global.anticheat_stats = recalculate_sha_stats()
				
				greenForeground_alpha = 0.9
				audio_play_sound(sndMenuTick, 1, 0)
				statText_alpha = -0.5
			}
	        else if (mouseOnMP) {
				global.virtual_stat_points--
				global.virtual_mp++
				update_character()
				
				if (ds_list_find_index(global.takenTutorials, 11) == -1)
					ds_list_add(global.takenTutorials, 11)
				
				global.anticheat_stats = recalculate_sha_stats()
				
				greenForeground_alpha = 0.9
				audio_play_sound(sndMenuTick, 1, 0)
				statText_alpha = -0.5
			}
	        else if (mouseOnSTA) {
				global.virtual_stat_points--
				global.virtual_sta++
				update_character()
				
				if (ds_list_find_index(global.takenTutorials, 11) == -1)
					ds_list_add(global.takenTutorials, 11)
				
				global.anticheat_stats = recalculate_sha_stats()
				
				greenForeground_alpha = 0.9
				audio_play_sound(sndMenuTick, 1, 0)
				statText_alpha = -0.5
			}
		}
		
		multitouchClick = false
    }
    
    if (front and drag) {
        x = device_mouse_x_to_gui(0)-dragHOffset
        y = device_mouse_y_to_gui(0)-dragVOffset
    }
}

