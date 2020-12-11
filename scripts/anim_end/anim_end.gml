/// @param id*
function anim_end() {

	if (argument_count == 0)
		var ae_obj = id
	else
		var ae_obj = argument[0]

	with (ae_obj) {
		if (animationController != pointer_null)
			return false
		
		if (rigidbodyParts == pointer_null)
			return true
	
		var ds_size = ds_list_size(rigidbodyParts)
		for (var i = 0; i < ds_size; i++) {
			with (ds_list_find_value(rigidbodyParts, i)) {
				if (animTarget != unique_number) {
				
					if (object_index == objPlayer)
						sound_play_at(sndArrow, -1000, -1000, false)
					return false
				}
			}
		}

		return true
	}

	return false


}
