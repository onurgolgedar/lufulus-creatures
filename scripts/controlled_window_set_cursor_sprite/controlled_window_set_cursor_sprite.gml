function controlled_window_set_cursor_sprite() {
	if (!global.useHardwareCursor) {
		window_set_cursor_sprite(argument[0], argument[1])
		
		global.cursorSprite = argument[0]
		global.cursorIndex = argument[1]
	}
	else {
		window_set_cursor_normal()
		global.cursorSprite = sprCursor
	}
}
