/// @description rigidbody_set_stance_type2
/// @param bd
/// @param -
/// @param al
/// @param -
/// @param fal
/// @param -
/// @param hl
/// @param -
/// @param ar
/// @param -
/// @param far
/// @param -
/// @param hr
/// @param -
/// @param elasticity*
function rigidbody_set_stance_type2() {

	if (rigidbodyParts != pointer_null) {
		var __elasticity = 0
		if (argument_count == 15)
			__elasticity = argument[14]
	
		if (body != pointer_null)
			with (body)
			    joint_animate(argument[0], argument[1], 0)
    
		if (leftArm[0] != pointer_null)
			with (leftArm[0])
			    joint_animate(argument[2], argument[3], __elasticity)
       
		if (leftArm[1] != pointer_null)
			with (leftArm[1])
			    joint_animate(argument[4], argument[5], __elasticity)
            
		if (leftHand != pointer_null)
			with (leftHand)
			    joint_animate(argument[6], argument[7], 0)
            
		if (rightArm[0] != pointer_null)
			with (rightArm[0])
			    joint_animate(argument[8], argument[9], __elasticity)
    
		if (rightArm[1] != pointer_null)
			with (rightArm[1])
			    joint_animate(argument[10], argument[11], __elasticity)
      
		if (rightHand != pointer_null)
			with (rightHand)
			    joint_animate(argument[12], argument[13], 0)
	}


}
