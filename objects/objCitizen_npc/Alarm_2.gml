if (pathFollower.pathEnd and irandom(1)) {
	var brownFlag_count = instance_number(objFlag_brown)
	if (brownFlag_count == 0)
		exit

	repeat(2) {
		var chosenFlag = irandom_range(1, brownFlag_count)

		var count = 1
		with (objFlag_brown) {
			if (count == chosenFlag) {
				chosenFlag = id
				break
			}
	
			count++
		}
		
		if (!chosenFlag.captured)
			break
	}

	if (!chosenFlag.captured) {
		if (chosenFlag_real != pointer_null) {
			chosenFlag_real.captured = false
			chosenFlag_real = pointer_null
		}
		
		chosenFlag.captured = true
		chosenFlag_real = chosenFlag
		ai_set_lastseen_point(chosenFlag.x, chosenFlag.y)
		ai_goto_lastseen_point()
	}
}

alarm[2] = irandom_range(3*sec, 4*sec)