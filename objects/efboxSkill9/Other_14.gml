// ? Bad Arrow Particles Management
if (effect == pointer_null or !instance_exists(effect))
	effect = instance_create(-100, -100, efSkill9)

if (instance_exists(owner) and !owner.noArms) {
	with (objBowControl)
		if (owner == other.owner and !massiveArrow) {
			massiveArrow = true
			arrowEffect = other.effect
		}
		
	with (objCrossbowControl)
		if (owner == other.owner and !massiveArrow) {
			massiveArrow = true
			arrowEffect = other.effect
			arrowEffect.target = objPlayer.id
			arrowEffect.angular_offset = 97
		}
}