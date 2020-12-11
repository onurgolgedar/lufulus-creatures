if (!destroy) {
	if (front)
		event_perform(ev_other, ev_user1)
		
	if (gamepad_button_check_pressed(global.gamepad, gp_stickr) or gamepad_leftpressed())
		event_perform(ev_mouse, ev_global_right_press)
		
	if (gamepad_button_check_released(global.gamepad, gp_shoulderl))
		event_perform(ev_mouse, ev_global_left_release)
	
    if ((mouse_check_button_pressed(mb_left) or gamepad_leftpressed() or gamepad_button_check_pressed(global.gamepad, gp_shoulderl))
	and !test_upperclick_window() and !test_upperclick_tutorial(true)) {
        event_perform(ev_other, ev_user1)    
        event_perform(ev_other, ev_user2)
        
        if (mouseOnBody and !mouseOnExit and !mouseOnPageButton1 and !mouseOnPageButton2
		and !mouseOnPageButton3 and !mouseOnPageButton4 and !mouseOnPageButton5) {
            if (!mouseOnBox) {
                dragHOffset = device_mouse_x_to_gui(0)-x
                dragVOffset = device_mouse_y_to_gui(0)-y
                drag = true
            }
            else if (!IS_MOBILE) {
                //global.itemSelected = item[mouseOnBox_i, mouseOnBox_j]
				
				event_perform(ev_mouse, ev_global_right_press)
			}
            
            event_perform(ev_other, ev_user0)
        }
        else if (mouseOnBody and !mouseOnExit)
            event_perform(ev_other, ev_user0)
    }
    
    if (front and (global.itemSelected != -1 or multitouchClick or imaginaryClick or (mouse_check_button_pressed(mb_left) and !IS_MOBILE) or gamepad_leftpressed() or gamepad_button_check_pressed(global.gamepad, gp_shoulderl))
	and !test_upperclick_window() and !test_upperclick_tutorial(true)) {
		imaginaryClick = false
		multitouchClick = false
		
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
        else if (mouseOnPageButton4 and page != 4) {
            page = 4
			audio_play_sound(sndMenuTick, 1, 0)
		}
        else if (mouseOnPageButton5 and page != 5) {
            page = 5
			audio_play_sound(sndMenuTick, 1, 0)
		}
    }
    
    if (front and drag) {
        x = device_mouse_x_to_gui(0)-dragHOffset
        y = device_mouse_y_to_gui(0)-dragVOffset
    }
}

