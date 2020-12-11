function rigidbody_set_type1() {
	var angle = phy_rotation

	shoulders = instance_create(x, y, argument[0])
	shoulders.depth = depth+2
	shoulders.phy_rotation = angle
	shoulders.image_angle = -angle
	shoulders.root = id
	shoulders.image_blend = image_blend
	joint_initiate(shoulders, id, shoulders.x, shoulders.y, -1)
	totalMass += shoulders.phy_mass

	leftArm[0] = instance_create(x+lengthdir_x(argument[2], 90-angle), y+lengthdir_y(argument[2], 90-angle), argument[1])
	leftArm[0].depth = depth+3
	leftArm[0].phy_rotation = angle
	leftArm[0].image_angle = -angle
	leftArm[0].root = id
	leftArm[0].image_blend = image_blend
	joint_initiate(leftArm[0], shoulders, leftArm[0].x, leftArm[0].y, -1)
	totalMass += leftArm[0].phy_mass

	rightArm[0] = instance_create(x+lengthdir_x(argument[2], 270-angle), y+lengthdir_y(argument[2], 270-angle), argument[1])
	rightArm[0].depth = depth+3
	rightArm[0].phy_rotation = angle
	rightArm[0].image_angle = -angle
	rightArm[0].root = id
	rightArm[0].image_blend = image_blend
	joint_initiate(rightArm[0], shoulders, rightArm[0].x, rightArm[0].y, 1)
	totalMass += rightArm[0].phy_mass

	leftArm[1] = instance_create(leftArm[0].x+lengthdir_x(argument[4], 0-angle), leftArm[0].y+lengthdir_y(argument[4], 0-angle), argument[3])
	leftArm[1].depth = depth+4
	leftArm[1].phy_rotation = angle
	leftArm[1].image_angle = -angle
	leftArm[1].root = id
	leftArm[1].image_blend = image_blend
	joint_initiate(leftArm[1], leftArm[0], leftArm[1].x, leftArm[1].y, -1)
	totalMass += leftArm[1].phy_mass

	rightArm[1] = instance_create(rightArm[0].x+lengthdir_x(argument[4], 0-angle), rightArm[0].y+lengthdir_y(argument[4], 0-angle), argument[3])
	rightArm[1].depth = depth+4
	rightArm[1].phy_rotation = angle
	rightArm[1].image_angle = -angle
	rightArm[1].root = id
	rightArm[1].image_blend = image_blend
	joint_initiate(rightArm[1], rightArm[0], rightArm[1].x, rightArm[1].y, 1)
	totalMass += rightArm[1].phy_mass

	leftHand = instance_create(leftArm[1].x+lengthdir_x(argument[6], 0-angle), leftArm[1].y+lengthdir_y(argument[6], 0-angle), argument[5])
	leftHand.depth = depth-1
	leftHand.phy_rotation = angle
	leftHand.image_angle = -angle
	leftHand.root = id
	leftHand.image_blend = image_blend
	joint_initiate(leftHand, leftArm[1], leftHand.x, leftHand.y, -1)
	totalMass += leftHand.phy_mass

	rightHand = instance_create(rightArm[1].x+lengthdir_x(argument[6], 0-angle), rightArm[1].y+lengthdir_y(argument[6], 0-angle), argument[5])
	rightHand.depth = depth-1
	rightHand.phy_rotation = angle
	rightHand.image_angle = -angle
	rightHand.root = id
	rightHand.image_blend = image_blend
	joint_initiate(rightHand, rightArm[1], rightHand.x, rightHand.y, 1)
	totalMass += rightHand.phy_mass

	rightArm[0].image_yscale = -1
	rightArm[1].image_yscale = -1
	rightHand.image_yscale = -1

	rigidbodyParts = ds_list_create()
	rigidbodyType = 1

	ds_list_add(rigidbodyParts, rightArm[1])
	ds_list_add(rigidbodyParts, rightArm[0])
	ds_list_add(rigidbodyParts, leftArm[1])
	ds_list_add(rigidbodyParts, leftArm[0])
	ds_list_add(rigidbodyParts, leftHand)
	ds_list_add(rigidbodyParts, rightHand)
	ds_list_add(rigidbodyParts, shoulders)


}
