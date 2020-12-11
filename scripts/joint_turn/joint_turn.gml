/// @param angle
function joint_turn() {

	var turn_ad = angle_difference(phy_rotation, -argument[0])
	if (abs(turn_ad) >= 2)
	    phy_angular_velocity = -100*sign(turn_ad)


}
