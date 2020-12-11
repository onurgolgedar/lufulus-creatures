function turtle_change() {
	if (argument[0] > 0) {
		if (turtlePoints+argument[0] < 100)
			turtlePoints += argument[0]
		else if (turtlePoints != 100) {
			if (turtlePermit) {
				ds_list_add(moves, move_turtle)
				turtlePoints = 100
				turtlePermit = false
			}
			else {
				turtlePoints = 0
				turtlePermit = true
			}	
		}
	}
	else {
		if (argument_count == 2 and argument[1] == true)
		{
			turtlePoints = argument[0]
			if (turtlePoints <= 0)
				turtleMode = false
		}
		else if (turtlePoints+argument[0] > 0)
			turtlePoints += argument[0]
		else {
			if (turtleMode)
				rigidbody_set_baBase()
	
			turtlePoints = 0
			turtleMode = false
		}
	}


}
