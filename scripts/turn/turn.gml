/// @param angle
/// @param speed
function turn() {

	var turn_ad = angle_difference(phy_rotation, -argument[0])
	if (abs(turn_ad) > 0.05)
	    physics_apply_torque(-sign(turn_ad)*clamp(abs(turn_ad), 0, 30)*argument[1]*phy_inertia)


}
