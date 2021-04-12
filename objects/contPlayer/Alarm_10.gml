if (drawSkill12) {
	var xx, yy
	if (IS_MOBILE) {
		xx = device_mouse_x(contPlayer.deviceSkill12)
		yy = device_mouse_y(contPlayer.deviceSkill12)
	}
	else {
		xx = mouse_x
		yy = mouse_y
	}
	
	canReleaseSkill12 = point_distance(xx, yy, objPlayer.x, objPlayer.y) < (193+12)*1.5*calculate_baseskill_range() and !collision_line(xx, yy, objPlayer.x, objPlayer.y, parSolid, true, false)
	
	delta_alarm(10, sec/8)
}
else
	canReleaseSkill12 = false