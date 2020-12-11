if (active) {
	if (hold)
		animTarget = round(target+5*holdDir)
	else if (animTarget != unique_number) {
		var minDiff = angle_difference(target, animTarget)
	    if (abs(minDiff) > animSpeed*delta())	
			char_joint_rotate(target-animSpeed*sign(minDiff)*delta(), 0)
	    else {   
	        char_joint_rotate(animTarget, elasticity)
	        animTarget = unique_number
	    }
	}
	/*else
		joint_turn(-target*side-owner.phy_rotation)*/
}