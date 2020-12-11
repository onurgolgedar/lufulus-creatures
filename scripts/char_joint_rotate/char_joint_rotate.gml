/// @param angle
/// @param elasticity
function char_joint_rotate() {

	target = argument[0]

	if (joint != pointer_null) {
		physics_joint_set_value(joint, phy_joint_lower_angle_limit, target*side-argument[1])
		physics_joint_set_value(joint, phy_joint_upper_angle_limit, target*side+argument[1])
	}


}
