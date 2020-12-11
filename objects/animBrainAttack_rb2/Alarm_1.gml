with (owner) {
	rigidbody_set_definedstance(stBrainAttack1, sec/8)
	
	combatExperience = max(0, combatExperience-7.5)
	brain = combatExperience
	
	var brainAttack = instance_create(
	rightHand.x+lengthdir_x(10, image_angle),
	rightHand.y+lengthdir_y(10, image_angle), objBrainAttack)
	
	brainAttack.target = target
	brainAttack.trueDamage = brainDamage
	brainAttack.owner = (other.owner.object_index != objLufulusWisdom) ? id : pointer_null
	brainAttack.brainColor = id.brainColor
	brainAttack.brainSize = id.brainSize
}

delta_alarm(0, sec/8+delay+sec/15)