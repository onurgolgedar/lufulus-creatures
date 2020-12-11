if (pull and isNeeded) {
	var dir = point_direction(x, y, objPlayer.x, objPlayer.y)

	physics_apply_force(phy_com_x, phy_com_y, lengthdir_x(8, dir), lengthdir_y(8, dir))
}