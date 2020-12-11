if (target != -1 and instance_exists(target) and !target.death) {
	var rot = point_direction(x, y, target.x, target.y)+irandom_range(-4, 4)
	var pow = random_range(2.5, 3)
	
	physics_apply_impulse(phy_com_x, phy_com_y, lengthdir_x(pow, rot), lengthdir_y(pow, rot))
}

delta_alarm(1, 2*sec)