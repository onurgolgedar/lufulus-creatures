depth -= 500

if (!global.showGUI)
	controlled_window_set_cursor_sprite(sprNothingness, 0)
else
	controlled_window_set_cursor_sprite(sprCursor, 0)

delta_alarm(0, sec/4)

clickObject = pointer_null