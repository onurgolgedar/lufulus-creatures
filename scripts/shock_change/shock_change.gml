function shock_change() {
	if (argument[0] > 0) {
		if (shockPoints+argument[0] < 100)
			shockPoints += argument[0]
		else if (shockPoints != 100) {
			shockPoints = 100
		
			// 0 means start -1 means stop
			shockLoad = 0
		}
	}
	else {
		if (argument_count == 2 and argument[1] == true)
			shockPoints = argument[0]
		else if (shockPoints+argument[0] > 0)
			shockPoints += argument[0]
		else
			shockPoints = 0
	}


}
