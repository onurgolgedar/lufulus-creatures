/// @param noAutoTarget
function ai_target_destroy() {

	target = pointer_null
	mode = defaultMode

	targetLock = 0

	myPose = -1
	freePoseMode = false

	extraBasicTry = false

	bonusExperienceRate = baseBonusExperienceRate
	recalculate_creature_experience_values()

#region STOP PASSIVES AND SEARCH ALARMS
	alarm[8] = -1
	alarm[10] = -1
#endregion

	if (!death) {
		// ?
		ai_reset_passives()
		ai_reset_skills()
		stop_animations()

		if (type == type_npc) {
			rigidbody_set_definedstance_type1(stNormal)
		
			if (isRanged) {
				with (objCrossbowControl) {
					if (owner == other.id) {
						alarm[1] = -1
						image_alpha = 0
					}
				}
			}
		}
		else
			rigidbody_set_definedstance_type2(stBase)
		
		if (argument_count < 1 or !argument[0])
			ai_set_target_auto()

		if (mode != md_attack) {
			ai_set_lastseen_point(startX, startY)
			ai_goto_lastseen_point()
		}
	}


}
