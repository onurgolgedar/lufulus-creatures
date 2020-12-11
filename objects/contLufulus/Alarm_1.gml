if (instance_exists(objLufulus) and !objLufulus.death) {
	with (parTarget) {
		if (object_index != objLufulus) {
			var dis = point_distance(x, y, objLufulus.x, objLufulus.y)
			if (dis < 250) {
				var dir = point_direction(x, y, objLufulus.x, objLufulus.y)
			
				if (type == type_player)
					dis /= 2
				
				physics_apply_force(phy_com_x, phy_com_y, lengthdir_x(300-dis*0.9, dir+180), lengthdir_y(300-dis*0.9, dir+180))
			}
		}
	}
}

delta_alarm(1, sec/10)