if (is_room_out())
	controlled_window_set_cursor_sprite(sprCursor, 0)
else {
	controlled_window_set_cursor_sprite(sprCursor, 0)
	global.mouseControl = true
}

visible = true

clickObject = pointer_null