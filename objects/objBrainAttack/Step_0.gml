if (target != -1 and instance_exists(target) and !target.death) {
	var rot = point_direction(x, y, target.x, target.y)
	phy_rotation = -rot
	
	physics_apply_force(phy_com_x, phy_com_y, lengthdir_x(3.5, rot), lengthdir_y(3.5, rot))
}
else if (target != -1 and target.death) {
	instance_destroy()
}

