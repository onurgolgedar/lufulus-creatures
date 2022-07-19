if (!IS_MOBILE)
	exit

if (global.pause) {
	if (device_mouse_y_to_gui(0) > 185+IS_MOBILE*15)
		event_perform(ev_keypress, vk_escape)
}
else
	with (contGUi)
		alarm[7] = 2