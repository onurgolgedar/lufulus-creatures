/// @param angle
/// @param speed
/// @param elasticity
function joint_animate() {

	animTarget = argument[0]

	animSpeed = abs(angle_difference(target, animTarget))/max(argument[1], 0.0001)
	elasticity = argument[2]


}
