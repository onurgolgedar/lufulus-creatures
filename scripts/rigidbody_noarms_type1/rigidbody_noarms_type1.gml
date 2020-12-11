function rigidbody_noarms_type1() {
	if (rigidbodyParts != pointer_null) {
		if (stance == pointer_null) {
			/*var ds_size = ds_list_size(rigidbodyParts)
			for (var rb = 0; rb < ds_size; rb++)
				with (ds_list_find_value(rigidbodyParts, rb)) {
					if (id != other.shoulders)
						image_alpha = 0
				}*/
		}

		alarm[0] = 1
		alarm[1] = -1
	
		if (leftArm[0] != pointer_null) {
			with (leftArm[0]) {
				image_xscale = -0.8
				image_yscale = 1.65
			}
		}
		if (leftArm[1] != pointer_null)
			with (leftArm[1]) image_yscale = 0
		if (rightArm[0] != pointer_null) {
			with (rightArm[0]) {
				image_xscale = -0.8
				image_yscale = -1.65
			}
		}
		if (rightArm[1] != pointer_null)
			with (rightArm[1])
				image_yscale = 0
		if (leftHand != pointer_null)
			with (leftHand)
				image_yscale = 0
		if (rightHand != pointer_null)
			with (rightHand)
				image_yscale = 0
			
		noArms = true
	
		if (type == type_npc) {
			if (tLight != pointer_null and tFire != pointer_null) {
				with (tLight)
					sl_light_active = false
					
				with (tFire) {
					target = pointer_null
					stop = true
					part_system_position(ps, -250, -250)
				}
			}
		}
		else if (type == type_player) {
			with (contPlayer)
				event_user(4)
		
			update_movementspeed()
		
			with (objCrossbowControl) {
				if (owner.type == type_player and arrowEffect != pointer_null and instance_exists(arrowEffect))
					instance_destroy(arrowEffect)
			}
		
			with (objBowControl) {
				if (owner.type == type_player and arrowEffect != pointer_null and instance_exists(arrowEffect))
					instance_destroy(arrowEffect)
			}
		
			with (objShieldControl) {
				if (owner.type == type_player and tLight != pointer_null and tFire != pointer_null) {
					with (tLight)
						sl_light_active = false
					
					with (tFire) {
						target = pointer_null
						stop = true
						part_system_position(ps, -250, -250)
					}
				}
			}

		}
	}


}
