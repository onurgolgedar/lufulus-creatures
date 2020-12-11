if (phy_speed < 3*60/room_speed and !stopMoving) {
	var dir = point_direction(other.x, other.y, x, y)
	physics_apply_impulse(phy_com_x, phy_com_y, lengthdir_x(4, dir), lengthdir_y(4, dir))
}

stop_moving(sec*2)