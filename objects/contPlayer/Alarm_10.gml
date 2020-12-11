if (drawSkill12) {
	canReleaseSkill12 = point_distance(device_mouse_x(deviceSkill12), device_mouse_y(deviceSkill12), objPlayer.x, objPlayer.y) < (193+12)*1.5*calculate_baseskill_range() and !collision_line(device_mouse_x(deviceSkill12), device_mouse_y(deviceSkill12), objPlayer.x, objPlayer.y, parSolid, true, false)
	
	delta_alarm(10, sec/8)
}
else
	canReleaseSkill12 = false