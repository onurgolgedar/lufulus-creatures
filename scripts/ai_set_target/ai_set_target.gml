/// @param target
function ai_set_target() {

	if (target != argument[0]) {
		ai_delete_mypose()
		target = argument[0]

		if (abilityGrouping and combatExperience > 18)
			ai_set_pose()

		var attacker = id
		with (target) {
			if (type != type_player and target == pointer_null) 			
				ai_reaction(attacker/*, true*/)
			else if (type == type_player and attacker.object_index != objLufulusWisdom)
				ai_protectors_call(attacker)
		}
	}


}
