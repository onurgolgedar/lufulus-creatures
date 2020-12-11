function ai_delete_mypose() {
	if (target != pointer_null)
		for (var __i = 0; __i < 6; __i++) {
			if (target.pose[__i] == id)
				target.pose[__i] = false
		}

	myPose = -1


}
