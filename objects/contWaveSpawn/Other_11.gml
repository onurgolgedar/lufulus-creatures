if (isBreak) {
	var mx = device_mouse_x_to_gui(0)
	var my = device_mouse_y_to_gui(0)

	if (mx > 0 and mx < 22+tW and my > 245 and my < 252+tH+20)
		mouseOn = !test_upperclick_window()
	else
		mouseOn = false
}
else
	mouseOn = false