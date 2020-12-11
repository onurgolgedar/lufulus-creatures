/// @param indicator
/// @param level*
/// @param time*
function add_effectbox() {

	var ae_alreadyCreated = false

	with (argument[0]) {
		if (owner == other.id and !separate)
			ae_alreadyCreated = id
	}

	if (ae_alreadyCreated != false) {
		if (argument_count > 1 and ae_alreadyCreated.level != argument[1])
			ae_alreadyCreated = false
	}

	if (ae_alreadyCreated == false) {
	    ae_effectBox = instance_create_layer(-50, -50, "lyGUI2", argument[0])
	
	    ae_effectBox.order = 1
	
		with (parEffectBox)
			if (id != other.ae_effectBox.id and owner == other.id)
				other.ae_effectBox.order += 1
			
		ae_effectBox.owner = id
    
	    if (argument_count == 3) {
	        ae_effectBox.level = argument[1]
		
			// ?
			if (ae_effectBox.permanent)
				show_debug_message("Permanent efboxes cannot have levels.")
		
			ae_effectBox.maxTime = argument[2]
			ae_effectBox.time = ae_effectBox.maxTime
		}
	    else if (argument_count == 2)
	        ae_effectBox.level = argument[1]
		
		return ae_effectBox
	}
	else {
		if (argument_count == 3)
			ae_alreadyCreated.maxTime = max(ae_alreadyCreated.maxTime, argument[2])

		// 50% reduction is special for stun effect
		if (ae_alreadyCreated.object_index == efboxStun) {
			ae_alreadyCreated.time = max(ae_alreadyCreated.maxTime/2, ae_alreadyCreated.time)
		
			if (freezed) {
				var sizeFactor = 1
				with (efboxFreeze) {
					if (time > 10)
						time = 10
					
					if (owner == other.id)
						sizeFactor = iceSize
				}
					
				var effect = instance_create(x, y, efSkill10_burst_single)
				effect.sizeFactor = sizeFactor
				effect.target = id
			
				var damage = calculate_damagetaken(skill_get_value(objSkill_10, -1, type_physicaldamage), 0)
				damage += calculate_damagetaken(skill_get_value(objSkill_10, -1, type_magicaldamage), 1)
				attacked(damage, objPlayer.id, false)
			}
		}
		else if (argument_count == 3)
			ae_alreadyCreated.time = max(argument[2], ae_alreadyCreated.time)
		else 
			ae_alreadyCreated.time = ae_alreadyCreated.maxTime
			
		// Stack
	    if (ae_alreadyCreated.stackable and ae_alreadyCreated.stack < ae_alreadyCreated.maxStack)
	        ae_alreadyCreated.stack += 1 // ?
	}

	return ae_alreadyCreated
}