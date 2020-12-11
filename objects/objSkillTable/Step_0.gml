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
        
        if (mouseOnBody and !mouseOnExit and !mouseOnPageButton1 and !mouseOnPageButton2 and !mouseOnPageButton3) {
            if (!mouseOnBox) {
                dragHOffset = device_mouse_x_to_gui(0)-x
                dragVOffset = device_mouse_y_to_gui(0)-y
                drag = true
            }
            else {
				if (!mouseOnBox_forUpgrade and item[mouseOnBox_i, mouseOnBox_j].upgrade > 0 and !item[mouseOnBox_i, mouseOnBox_j].passive) {
					global.itemSelected = item[mouseOnBox_i, mouseOnBox_j]
					contGUI.tab_index = 2
					contMain.gamepad_leftarrow_virtual = true
				
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
				else if (mouseOnBox_forUpgrade and global.skillPoints >= item[mouseOnBox_i, mouseOnBox_j].neededPoints) {
					item[mouseOnBox_i, mouseOnBox_j].upgrade++
					global.skillPoints -= item[mouseOnBox_i, mouseOnBox_j].neededPoints
					global.givenSkillPoints += item[mouseOnBox_i, mouseOnBox_j].neededPoints
					
					greenForeground_alpha = 0.9
					audio_play_sound(sndMenuTick, 1, 0)
					
					if (item[mouseOnBox_i, mouseOnBox_j].upgrade == 1 and !item[mouseOnBox_i, mouseOnBox_j].passive) {
						for (var i = 0; i < 4; i++) {
							if (global.selectedSkill[i] == -1) {
								global.selectedSkill[i] = item[mouseOnBox_i, mouseOnBox_j].object_index
								with (contGUI) event_perform(ev_other, ev_user0)
								break
							}
						}
					}
					
					global.anticheat_skillPoints = recalculate_sha_skillPoints()
					
					event_perform(ev_other, ev_user5)
					
					with (contGUI)
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
    
    if (front and (global.itemSelected != -1 or imaginaryClick or multitouchClick or gamepad_leftpressed()
	or (mouse_check_button_pressed(mb_left) and !IS_MOBILE) or gamepad_button_check_pressed(global.gamepad, gp_shoulderl))
	and !test_upperclick_window() and !test_upperclick_tutorial(true)) {
		imaginaryClick = false
		multitouchClick = false
		
        if (mouseOnPageButton1 and page != 1) {
            page = 1
			audio_play_sound(sndMenuTick, 1, 0)
			
			with (objSkillTable_mbs)
				if (temporaryWindow)
					close_window()
		}
        else if (mouseOnPageButton2 and page != 2) {
            page = 2
			audio_play_sound(sndMenuTick, 1, 0)
			
			with (objSkillTable_mbs)
				if (temporaryWindow)
					close_window()
		}
        else if (mouseOnPageButton3 and page != 3) {
            page = 3
			
			if (!instance_exists(objSkillTable_mbs)) {
				var skillTable_mbs = instance_create_layer(x+540, y, "lyWindows", objSkillTable_mbs)
				skillTable_mbs.temporaryWindow = true
				audio_play_sound(sndWindowTick, 1, 0)
				
				event_perform(ev_other, ev_user0)
			}
			
			//audio_play_sound(sndMenuTick, 1, 0)
		}
    }
    
    if (front and drag) {
        x = device_mouse_x_to_gui(0)-dragHOffset
        y = device_mouse_y_to_gui(0)-dragVOffset
    }
}