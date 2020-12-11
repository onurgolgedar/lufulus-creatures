var canCast = false
with (objPlayer)
	canCast = clickattack_basic_conditions(false, true) and global.skillBar == 0
	
if (canCast) {
	objPlayer.phy_linear_damping = 11
	maxTime = -1
	time = maxTime
	
	if (global.gamepad_active) {
		gamepad_set_vibration_ext(0.15, 0.15, sec/5)
		global.mouseControl = true
		controlled_window_set_cursor_sprite(sprCursor, 0)
		mouse_set_position(screen_point(objPlayer.x, 0), screen_point(objPlayer.y, 1))
	}
	
	with (contPlayer) {
		drawSkill12 = true
		delta_alarm(10, sec/5)
	}
}