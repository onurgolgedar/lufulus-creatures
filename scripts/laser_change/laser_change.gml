function laser_change() {
	if (argument[0] > 0) {
		if (laserPoints+argument[0] < 100)
			laserPoints += argument[0]
		else if (target != pointer_null and point_distance(x, y, target.x, target.y) < 210) {
			laserPoints = -irandom_range(15, 35)
		
			var efbox = add_effectbox(efboxLaser, -1, laserDuration)
			efbox.target = target
			efbox.damage = laserDamage
		}
	}
	else {
		if (argument_count == 2 and argument[1] == true)
			rofuxPoints = argument[0]
		else if (rofuxPoints+argument[0] > 0)
			rofuxPoints += argument[0]
		else
			rofuxPoints = 0
	}


}
