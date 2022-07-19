if (!destroy) {
	if (front)
		event_perform(ev_other, ev_user1)
		
	if (gamepad_button_check_released(global.gamepad, gp_shoulderl))
		event_perform(ev_mouse, ev_global_left_release)
		
	if (greenForeground_alpha > 0)
		greenForeground_alpha -= 0.05
	
    if ((mouse_check_button_pressed(mb_left) or gamepad_leftpressed() or gamepad_button_check_pressed(global.gamepad, gp_shoulderl))
	and !test_upperclick_window() and !test_upperclick_tutorial(true)) {
		
        event_perform(ev_other, ev_user1)    
        event_perform(ev_other, ev_user2)
        
        if (mouseOnBody and !mouseOnExit) {
            if (!mouseOnBox) {
                dragHOffset = device_mouse_x_to_gui(0)-x
                dragVOffset = device_mouse_y_to_gui(0)-y
                drag = true
            }
            else {
				if (mouseOnBox_forUpgrade and global.skillPoints >= item[mouseOnBox_i, mouseOnBox_j].neededPoints) {
					item[mouseOnBox_i, mouseOnBox_j].upgrade++
					global.skillPoints -= item[mouseOnBox_i, mouseOnBox_j].neededPoints
					global.givenSkillPoints += item[mouseOnBox_i, mouseOnBox_j].neededPoints
					
					greenForeground_alpha = 0.9
					audio_play_sound(sndMenuTick, 1, 0)
					
					if (item[mouseOnBox_i, mouseOnBox_j].upgrade == 1 and !item[mouseOnBox_i, mouseOnBox_j].passive) {
						for (var i = 0; i < 4; i++) {
							if (global.selectedSkill[i] == -1) {
								global.selectedSkill[i] = item[mouseOnBox_i, mouseOnBox_j].object_index
								with (contGUi) event_perform(ev_other, ev_user0)
								break
							}
						}
					}
					
					event_perform(ev_other, ev_user5)
					
					with (contGUi)
						event_perform(ev_other, ev_user0)
						
					with (contPlayer)
						event_perform(ev_other, ev_user1)
						
					localbag_refresh()
				}
			}
            
            event_perform(ev_other, ev_user0)
        }
        else if (mouseOnBody and !mouseOnExit) {
            event_perform(ev_other, ev_user0)
		}
    }
    
    if (front and drag) {
        x = device_mouse_x_to_gui(0)-dragHOffset
        y = device_mouse_y_to_gui(0)-dragVOffset
    }
}