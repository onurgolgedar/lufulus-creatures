if (IS_MOBILE and !global_tab)
	exit
global_tab = false

if (!isRoomOut and !global.pause) {	
	//if (!test_upperclick_window()) {
	//	if (contGUI.mouseOnMLogo)
	//		event_perform(ev_keypress, ord("M"))
	//	else if (contGUI.mouseOnSLogo)
	//		event_perform(ev_keypress, ord("Y"))
	//	else if (contGUI.mouseOnQLogo)
	//		event_perform(ev_keypress, ord("J"))
	//	else if (contGUI.mouseOnBLogo)
	//		event_perform(ev_keypress, ord("I"))
	//	else if (contGUI.mouseOnCLogo)
	//		event_perform(ev_keypress, ord("C"))
	//	else if (contGUI.mouseOnSkillBox[4] and global.selectedSkill[4] == objMainBS) {
	//		if (is_room_out() or global.consoleMode)
	//			exit
	
	//		if (global.pause)
	//			exit

	//		if (instance_exists(objSkillTable_mbs)) {
	//			with (objSkillTable_mbs)
	//				if (temporaryWindow)
	//					temporaryWindow = false
	//				else
	//					close_table()
	//		}
	//		else {
	//			instance_create_layer(display_get_gui_width()/2+95, display_get_gui_height()-430, "lyWindows", objSkillTable_mbs)
	//			audio_play_sound(sndWindowTick, 1, 0)
	//		}
	//	}
	//	else if (contGUI.mouseOnFindButton) {
	//		with (contGUI) {
	//			var alreadyExists = -1
	//			with (objMessageBox) {
	//				if (owner == other.id) {
	//					alreadyExists = id
	//					break
	//				}
	//			}
				
	//			if (alreadyExists == -1) {
	//				var messageBox = show_dialoguebox(findButtonX-60, display_get_gui_height()-222, "", eng() ? "Looking for..." : "Ne arıyorsun?", contGUI.id, 1
	//				, eng() ? "Sellers" : "Satıcılar", eng() ? "Characters" : "Kişiler", eng() ? "Bank" : "Banka", eng() ? "Doctor" : "Doktor", "Cancel")
	//				messageBox.specialDesign = true
	//				findQuestion = true
	//			}
	//			else {
	//				with (alreadyExists)
	//					close_window()
	//			}
	//		}
	//	}
	//}
}
		
if (global.selectTarget_mode and !global.pause) {
	global.selectedTarget = instance_nearest(mouse_x, mouse_y, parTarget)
	if (global.selectedTarget != noone and global.selectedTarget.death)
		global.selectedTarget = pointer_null
		
	global.selectTarget_mode = false
}