function controlled_window_set_cursor_sprite_ext() {
	if (!global.useHardwareCursor) {
		window_set_cursor_sprite_ext(argument[0], argument[1], argument[2], argument[3], argument[4], argument[5])
		global.cursorSprite = argument[0]
		global.cursorIndex = argument[1]
	}
	else {
		window_set_cursor_normal()
		global.cursorSprite = sprCursor
	}
}