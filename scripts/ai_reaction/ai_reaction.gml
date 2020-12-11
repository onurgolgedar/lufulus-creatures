/// @param target
/// @param isSingle*
function ai_reaction() {

	var isSingle = argument_count >= 2 and argument[1]

	if (argument[0] != pointer_null and instance_exists(argument[0]) and !argument[0].death and (targetLock == 0 or target == pointer_null)) {
	#region START PASSIVES' ALARM
		if (alarm[8] == -1)
			delta_alarm(8, sec/10)
	#endregion

		ai_set_target(argument[0])
		if (!isSingle)
			targetLock = 50
		ai_set_lastseen_point(argument[0].x, argument[0].y)
	
		if (mode != md_attack) {
			speedFactor = 1
		
			if (type == type_npc) {
				rigidbody_set_baBase()
		
				if (isRanged) {
					with (objCrossbowControl) {
						if (owner == other.id)
							alarm[1] = 1
					}
				}
			}
		}
	
		mode = md_attack

		if (!canSee)
			ai_goto_lastseen_point()
	
		targetPointDir = point_direction(x, y, argument[0].x, argument[0].y)
	
	#region SEARCHING SET
		searchingSpeed = 10
		delta_alarm(10, sec*1.5)
	#endregion
	
		if (!isSingle and argument[0].object_index != objLufulusWisdom)
			ai_protectors_call(argument[0])
	
		return true
	}
	else
		return false


}
