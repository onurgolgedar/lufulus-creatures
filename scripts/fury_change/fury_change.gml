function fury_change() {
	if (argument[0] > 0) {
		if (fury+argument[0] < 100)
			fury += argument[0]
		else {
			fury = 100
		
			if !(abilitySoul and soulMode or furious) {
				furious = true
				slide_text(x, y, eng() ? "fury" : "öfke", c_nicepurple, false, true)
				healthBar_blend = c_red
				
				physics_apply_impulse(phy_com_x, phy_com_y,
				lengthdir_x(dashPower*forceFactor, targetPointDir), lengthdir_y(dashPower*forceFactor, targetPointDir))
			
				if (abilityTurtle)
					turtle_change(-33)
			}
		}
	}
	else {
		if (argument_count == 2 and argument[1] == true)
		{
			fury = argument[0]
			if (fury <= 0)
				furious = false
		}
		else if (fury+argument[0] > 0)
			fury += argument[0]
		else {
			fury = 0
			furious = false
		}
	}


}
