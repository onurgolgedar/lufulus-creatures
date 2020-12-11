/// @param target
function ai_protectors_call() {

	var ds_size = ai_protectors_size()
	for (var i = 0; i < ds_size; i++) {
		with (ai_protectors_get(i)) {
			if (!death and (target == pointer_null or !canSee) and !are_they_friends(id, argument[0]))
				ai_reaction(argument[0], true)
		}
	}


}
