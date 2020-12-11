function rofux_change() {
	if (argument[0] > 0) {
		if (rofuxPoints+argument[0] < 100)
			rofuxPoints += argument[0]
		else if (rofuxPoints != 100) {
			rofuxPoints = -irandom_range(15, 35)
		
			repeat(5) {
				var rofuxBurst = instance_create(x, y, efRofuxBurst)
				if (object_index == objB2)
					rofuxBurst.isRed = true
				else if (object_index == objLufulus) {
					rofuxBurst.isBig = true
					rofuxBurst.isPurple = true
				}
			
				slide_text(x, y, "rofux", c_nicepurple, false, true)
				healthBar_blend = c_fuchsia
			
				var rofuxInstance = instance_create(x, y, objRofux)
				rofuxInstance.target = target
				rofuxInstance.trueDamage = rofuxDamage
				rofuxInstance.owner = id
		
				var pow = random_range(0.2, 0.3)
				var addAngle = irandom_range(-90, 90)
				with (rofuxInstance)
					physics_apply_impulse(phy_com_x, phy_com_y
					, lengthdir_x(pow, other.image_angle+180+addAngle)
					, lengthdir_y(pow, other.image_angle+180+addAngle))
			}
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
