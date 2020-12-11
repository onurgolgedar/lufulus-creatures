/// @description Damage Trigger

var ow = owner
with (owner) {
	var magicCount = 1+chance(1, 3)
	angle = irandom_range(-3, 3)*(1+2*(irandom(5) == 0))
	
	var isMovingShot = abilityMovingShot and chance(movingShot_chance, 100)
	repeat(magicCount+isMovingShot) {
		if (target != pointer_null) {
			var basicMagic = instance_create_layer(isRightHanded ? rightHand.x : leftHand.x, isRightHanded ? rightHand.y : leftHand.y, "lyAir", isMovingShot ? objCreatureBasicMagic_moving : objCreatureBasicMagic)
			
			var addAngle
			if (irandom(1) == 0)
				addAngle = choose(-7, -5, -3, 3, 5, 7)
			else
				addAngle = 0
			var dir = point_direction(basicMagic.x, basicMagic.y, target.x+target.phy_speed_x*5, target.y+target.phy_speed_y*5)+addAngle+angle
			
			sound_play_at(sndMagicBall, x, y, false)

			with (basicMagic) {
				owner = other.id
				target = other.target
				sprite_index = other.basicMagicSprite
				
				if (isMovingShot) {
					alarm[0] *= 2
					startDir = point_direction(basicMagic.x, basicMagic.y, target.x, target.y)
					trueDamage = ow.movingShot_damage
					image_xscale = 1.5
					image_yscale = image_xscale
				}
				else {
					trueDamage = other.physicalPower/((magicCount+1)/2)*other.physicalPower_rangedFactor
					image_xscale = (2-magicCount*0.5)
					image_yscale = image_xscale
				}
				
				var impulse = 0.65+ow.boss*0.13
				if (isMovingShot)
					impulse *= ow.movingShot_speedFactor
				
				physics_apply_impulse(phy_com_x, phy_com_y,
				lengthdir_x(impulse, dir),
				lengthdir_y(impulse, dir))
				phy_rotation = -point_direction(0, 0, phy_speed_x, phy_speed_y)
			}
		}
		
		isMovingShot = false
	}
}