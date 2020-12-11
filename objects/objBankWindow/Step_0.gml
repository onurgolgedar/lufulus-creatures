if (!destroy) {
	if (front)
		event_perform(ev_other, ev_user1)
		
	if (gamepad_button_check_pressed(global.gamepad, gp_stickr) or gamepad_leftpressed())
		event_perform(ev_mouse, ev_global_right_press)
		
	if (gamepad_button_check_released(global.gamepad, gp_shoulderl)) {
		event_perform(ev_mouse, ev_global_left_release)
		
		if (global.itemSelected != -1) {
			with (contMain)
				event_perform(ev_mouse, ev_global_left_release)
		}
	}
	
    if ((mouse_check_button_pressed(mb_left) or gamepad_leftpressed() or gamepad_button_check_pressed(global.gamepad, gp_shoulderl))
	and !test_upperclick_window() and !test_upperclick_tutorial(true)) {
        event_perform(ev_other, ev_user1)    
        event_perform(ev_other, ev_user2)
        
        if (mouseOnBody and !mouseOnExit and !mouseOnPageButton1 and !mouseOnPageButton2 and !mouseOnPageButton3) {
            if (!mouseOnBox) {
                dragHOffset = device_mouse_x_to_gui(0)-x
                dragVOffset = device_mouse_y_to_gui(0)-y
                drag = true
            }
            else {
				global.itemSelected = item[mouseOnBox_i, mouseOnBox_j]
				beforePage = page
				
				if (global.itemSelected != -1) {
					if (mouseLeft_justPressed_i != global.itemSelected.i
					or mouseLeft_justPressed_j != global.itemSelected.j) {
						mouseLeft_justPressed_i = global.itemSelected.i
						mouseLeft_justPressed_j = global.itemSelected.j
						delta_alarm(5, sec/4)
					}
					else {
						global.itemSelected = -1
						event_perform(ev_mouse, ev_global_right_press)
					}
				}
			}
            
            event_perform(ev_other, ev_user0)
        }
        else if (mouseOnBody and !mouseOnExit)
            event_perform(ev_other, ev_user0)
    }
    
    if ((global.itemSelected != -1 or multitouchClick or imaginaryClick or (mouse_check_button_pressed(mb_left) and !IS_MOBILE) or gamepad_leftpressed() or gamepad_button_check_pressed(global.gamepad, gp_shoulderl))
	and !test_upperclick_window() and !test_upperclick_tutorial(true)) {
		imaginaryClick = false
		multitouchClick = false
		
		if (mouseOnBody and !front)
			event_perform(ev_other, ev_user0)
		
        if (mouseOnPageButton1 and page != 1) {
            page = 1
			greenPage = is_page_empty_bank(page)
			audio_play_sound(sndMenuTick, 1, 0)
		}
        else if (mouseOnPageButton2 and page != 2) {
            page = 2
			greenPage = is_page_empty_bank(page)
			audio_play_sound(sndMenuTick, 1, 0)
		}
        else if (mouseOnPageButton3 and page != 3) {
            page = 3
			greenPage = is_page_empty_bank(page)
			audio_play_sound(sndMenuTick, 1, 0)
		}
        else if (mouseOnTakeButton and global.rentGold > 0) {
			change_money(global.rentGold, true)
			audio_play_sound(sndMenuTick, 1, 0)
			global.rentGold = 0
			global.anticheat_ownings = recalculate_sha_ownings()
		}
		
		if (global.itemSelected == -1)
			beforePage = page
    }
    
    if (front and drag) {
        x = device_mouse_x_to_gui(0)-dragHOffset
        y = device_mouse_y_to_gui(0)-dragVOffset
    }
}

