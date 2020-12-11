if (!IS_MOBILE or alarm[2] != -1)
	exit

if (location_lastSelected != pointer_null and device_mouse_x_to_gui(0) > travelX
and device_mouse_x_to_gui(0) < travelX2 and device_mouse_y_to_gui(0) > travelY
and device_mouse_y_to_gui(0) < travelY2) {
	with (location_lastSelected) {
		if (global.locationName != name) {
			mouseOn = true
			event_perform(ev_gesture, ev_global_gesture_double_tap)
		}
	}
}
else if (point_distance(x, y, device_mouse_x_to_gui(0), device_mouse_y_to_gui(0)) > 400 and !test_upperclick_tutorial(true))
	event_perform(ev_keypress, vk_escape)