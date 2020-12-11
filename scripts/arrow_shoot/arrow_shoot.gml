/// @param speed
/// @param weaponControl
/// @param powerRatio*
function arrow_shoot() {

	var efboxSkill8_exists = test_effectbox(efboxSkill8, objPlayer.id)
	var efboxSkill9_exists = test_effectbox(efboxSkill9, objPlayer.id)
	var efboxSkill10_exists = test_effectbox(efboxSkill10, objPlayer.id)
	var addAngle = efboxSkill8_exists ? -8 : 0
	var powerRatio = argument_count > 2 ? argument[2] : 0.5
				
	repeat (1+4*efboxSkill8_exists) {
	#region Arrow Creation
		var arrow = instance_create_layer(argument[1].arrowX, argument[1].arrowY, "lyBelowPlayer", objArrow)
		arrow.depth += 5
		arrow.phy_rotation = -image_angle+addAngle
		arrow.damageLock = (addAngle != 0) and global.defenseLock
								
		with (arrow) {
			var extraSpeed = 0.1*extension_exists(ext_arrowSpeed10)
			+0.18*extension_exists(ext_arrowSpeed18)
			+0.26*extension_exists(ext_arrowSpeed26)
			phy_speed_x = (lengthdir_x(argument[0]*(1+extraSpeed), -phy_rotation)+phy_speed_x/2)*delta()
			phy_speed_y = (lengthdir_y(argument[0]*(1+extraSpeed), -phy_rotation)+phy_speed_y/2)*delta()
		
			owner = other.id
			target = unique_number
			pwr = powerRatio
				
			if (efboxSkill8_exists and addAngle != 0)
				isPentaArrow = true
			else if (addAngle == 0) {
				if (efboxSkill9_exists)
					isMassiveArrow = true
				else if (efboxSkill10_exists)
					isGlacialArrow = true
			}
						
			if (isMassiveArrow) {
				effect = instance_create(x, y, efSkill9)
				effect.target = id
				effect.angular_offset = 34
			}
		}
	#endregion
					
		addAngle += 4
					
		instance_destroy(efboxSkill8)
		instance_destroy(efboxSkill9)
		instance_destroy(efboxSkill10)
	}


}
