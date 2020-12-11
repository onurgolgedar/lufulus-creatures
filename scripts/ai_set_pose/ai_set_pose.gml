/// @param hasPriority*
function ai_set_pose() {

	// ? Can be better
	if (target != pointer_null and !isRanged and point_distance(x, y, target.x, target.y) < activeRange*5) {
		if (argument_count == 0)
			var priority = false
		else
			var priority = argument[0]
		
		var angle = point_direction(target.x, target.y, x, y)

		if (myPose == -1 or abs(angle_difference(angle, myPose*60)) > 50) { // ? "50" can be minimum "30"
			var myWantedPose = -1

			for (var j = 0; j < 6; j++) {
				if (abs(angle_difference(angle, j*60)) <= 30) {
					myWantedPose = j
	
					if (target.pose[myWantedPose] == false) {
						target.pose[myWantedPose] = id
						myPose = myWantedPose
					} else if (priority) {
						target.pose[myWantedPose].myPose = -1
				
						target.pose[myWantedPose] = id
						myPose = myWantedPose
					}
		
					break			
				}
			}

			if (myPose == -1) {
				var searchingDir = sign(angle_difference(angle, myWantedPose*60))
				if (searchingDir == 0) searchingDir = -1
		
				var searchingLimit = 5
				for (j = myWantedPose+searchingDir;
				searchingLimit > 0;) {
					if (j < 0) j += 6
					else if (j > 5) j -= 6
		
					if (target.pose[j] == false) {
						target.pose[j] = id
						myPose = j
			
						break
					}
			
					searchingLimit--
					j += searchingDir
				}
			}
	
			if (myPose == -1 and !priority and 
		
			// Priority List
			isLeader) // or...)
				ai_set_pose(true)
		}
	}
	else if (myPose != -1) // ?
		ai_delete_mypose()


}
