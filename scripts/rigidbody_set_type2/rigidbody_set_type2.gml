function rigidbody_set_type2() {
	totalMass = phy_mass

	var angle = phy_rotation

	if (argument[0] != pointer_null) {
		body = instance_create(x+lengthdir_x(argument[1], 180-angle), y+lengthdir_y(argument[1], 180-angle), argument[0])
		body.depth = depth-10
		body.phy_rotation = angle
		//body.image_angle = -angle
		body.root = id
		body.destroyed = false
		body.image_blend = image_blend
		joint_initiate(body, id, body.x, body.y, -1)
		totalMass += body.phy_mass
	}
	else
		body = pointer_null

	leftArm[0] = instance_create(x+lengthdir_x(argument[3], 90-angle)+lengthdir_x(argument[8], 180-angle), y+lengthdir_y(argument[3], 90-angle)+lengthdir_y(argument[8], 180-angle), argument[2])
	leftArm[0].depth = depth+3
	leftArm[0].phy_rotation = angle
	leftArm[0].image_angle = -angle
	leftArm[0].root = id
	leftArm[0].image_blend = image_blend
	if (body != pointer_null)
		joint_initiate(leftArm[0], body, leftArm[0].x, leftArm[0].y, -1)
	else
		joint_initiate(leftArm[0], id, leftArm[0].x, leftArm[0].y, -1)
	totalMass += leftArm[0].phy_mass

	rightArm[0] = instance_create(x+lengthdir_x(argument[3], 270-angle)+lengthdir_x(argument[8], 180-angle), y+lengthdir_y(argument[3], 270-angle)+lengthdir_y(argument[8], 180-angle), argument[2])
	rightArm[0].depth = depth+3
	rightArm[0].phy_rotation = angle
	rightArm[0].image_angle = -angle
	rightArm[0].root = id
	rightArm[0].image_blend = image_blend
	if (body != pointer_null)
		joint_initiate(rightArm[0], body, rightArm[0].x, rightArm[0].y, 1)
	else
		joint_initiate(rightArm[0], id, rightArm[0].x, rightArm[0].y, 1)
	totalMass += rightArm[0].phy_mass

	leftArm[1] = instance_create(leftArm[0].x+lengthdir_x(argument[5], 0-angle), leftArm[0].y+lengthdir_y(argument[5], 0-angle), argument[4])
	leftArm[1].depth = depth+4
	leftArm[1].phy_rotation = angle
	leftArm[1].image_angle = -angle
	leftArm[1].root = id
	leftArm[1].image_blend = image_blend
	joint_initiate(leftArm[1], leftArm[0], leftArm[1].x, leftArm[1].y, -1)
	totalMass += leftArm[1].phy_mass

	rightArm[1] = instance_create(rightArm[0].x+lengthdir_x(argument[5], 0-angle), rightArm[0].y+lengthdir_y(argument[5], 0-angle), argument[4])
	rightArm[1].depth = depth+4
	rightArm[1].phy_rotation = angle
	rightArm[1].image_angle = -angle
	rightArm[1].root = id
	rightArm[1].image_blend = image_blend
	joint_initiate(rightArm[1], rightArm[0], rightArm[1].x, rightArm[1].y, 1)
	totalMass += rightArm[1].phy_mass

	leftHand = instance_create(leftArm[1].x+lengthdir_x(argument[7], 0-angle), leftArm[1].y+lengthdir_y(argument[7], 0-angle), argument[6])
	leftHand.depth = depth+5
	leftHand.phy_rotation = angle
	leftHand.image_angle = -angle
	leftHand.root = id
	leftHand.image_blend = image_blend
	joint_initiate(leftHand, leftArm[1], leftHand.x, leftHand.y, -1)
	totalMass += leftHand.phy_mass

	rightHand = instance_create(rightArm[1].x+lengthdir_x(argument[7], 0-angle), rightArm[1].y+lengthdir_y(argument[7], 0-angle), argument[6])
	rightHand.depth = depth+5
	rightHand.phy_rotation = angle
	rightHand.image_angle = -angle
	rightHand.root = id
	rightHand.image_blend = image_blend
	joint_initiate(rightHand, rightArm[1], rightHand.x, rightHand.y, 1)
	totalMass += rightHand.phy_mass

	rightArm[0].image_yscale = -1
	rightArm[1].image_yscale = -1
	rightHand.image_yscale = -1

	if (body != pointer_null) {
		body.image_xscale = image_xscale
		body.image_yscale = image_yscale
	}

	rigidbodyParts = ds_list_create()
	rigidbodyType = 2

	if (body != pointer_null)
		ds_list_add(rigidbodyParts, body)

	ds_list_add(rigidbodyParts, leftArm[0])
	ds_list_add(rigidbodyParts, leftArm[1])
	ds_list_add(rigidbodyParts, rightArm[0])
	ds_list_add(rigidbodyParts, rightArm[1])
	ds_list_add(rigidbodyParts, leftHand)
	ds_list_add(rigidbodyParts, rightHand)


}
