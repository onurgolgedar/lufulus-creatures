/// @param pureDamage
/// @param isMagical
function calculate_damagetaken() {

	var damage = argument[0]
	if (death)
		return 0

	if (argument[1] == 0)
		damage = argument[0]
		*(100/(100+armor))
		*(1-0.5*(abilityTurtle and turtleMode))
	else
		damage = argument[0]
		*(100/(100+resistance))
	
	damage *= (1-0.2*is_in_shieldmode(id))
	damage *= 1-damageReduction/100

	return damage


}
