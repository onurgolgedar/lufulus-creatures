/// @description Pose

if (!stunned and target != pointer_null and inView) {
	if (abilityGrouping and combatExperience > 18)
		ai_renew_pose()
	else if (myPose != -1)
		ai_delete_mypose()
}
	
delta_alarm(6, 3*sec)