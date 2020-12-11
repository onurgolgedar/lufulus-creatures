var hPort = display_get_gui_height()
var my = device_mouse_y_to_gui(0)

if (my <= hPort-200) {
	mouseOnSkillBox[0] = false
	mouseOnSkillBox[1] = false
	mouseOnSkillBox[2] = false
	mouseOnSkillBox[3] = false
	mouseOnSkillBox[4] = false
}

delta_alarm(6, sec/2)
