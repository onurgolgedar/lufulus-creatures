ds_list_clear(redDirectionArrows)
ds_list_clear(greenDirectionArrows)
ds_list_clear(yellowDirectionArrows)
ds_list_clear(blueDirectionArrows)

if (findPath != pointer_null) {
	path_delete(findPath)
	findPath = pointer_null
	findPath_alpha = 0
	findPath_x = 0
	findPath_y = 0
}

if (arrowPath != pointer_null) {
	path_delete(arrowPath)
	arrowPath = pointer_null
	arrowPath_alpha = 0
	arrowPath_x = 0
	arrowPath_y = 0
	arrowPath_color = c_red
}

/*joystick_hold = false
joystick_hold_device = -1

joystick2_hold = false
joystick2_hold_device = -1*/