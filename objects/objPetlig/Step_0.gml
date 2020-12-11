if (target != -1 and instance_exists(target) and !target.death) {
	var tx = target.x+lengthdir_x(posDis, posDir)
	var ty = target.y+lengthdir_y(posDis, posDir)
	
	var rot = point_direction(x, y, tx, ty)
	var dis = point_distance(x, y, tx, ty)
	
	var pow = 0
	if (dis > 10) {
		pow = 0.6+min(point_distance(x, y, tx, ty), 500)/65
		physics_apply_force(phy_com_x, phy_com_y, lengthdir_x(pow, rot), lengthdir_y(pow, rot))
	}

	phy_rotation = -rot
}
else if (target != -1 and target.death) {
	instance_destroy()
}