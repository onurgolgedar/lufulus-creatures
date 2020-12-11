/// @param color
/// @param damage
/// @param brainSize*
/// @param brainSprite*
function brainattack_initiate() {

	abilityBrainAttack = true
	brainAttackPoints = 40+irandom(40)
	brain = 100
	brainColor = argument[0]
	brainDamage = argument[1]

	if (argument_count > 2)
		brainSize = argument[2]
	else
		brainSize = 0.5
	
	if (argument_count > 3)
		brainSprite = argument[3]
	else
		brainSprite = pointer_null
	


}
