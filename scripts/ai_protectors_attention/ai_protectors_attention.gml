function ai_protectors_attention() {
	var ds_size = ai_protectors_size()
	for (var i = 0; i < ds_size; i++) {
		var friend = ai_protectors_get(i)
		var _target = pointer_null
	
		if (friend.target == pointer_null) {
			with (parAI) {
				if (object_index != objLufulusWisdom) {
					if (_target != pointer_null and irandom(3) == 0)
						break
			
					if (target == other.id)
						_target = id
				}
			}
		
			if (_target != pointer_null) {
				with (friend)
					ai_reaction(_target, true)
			}
		}
	}


}
