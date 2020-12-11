function strike_change() {
	if (argument[0] > 0) {
		if (strikePoints+argument[0] < 100)
			strikePoints += argument[0]
		else if (strikePoints != 100) {
			ds_list_add(moves, move_strike_begin)
			strikePoints = 100
		}
	}
	else {
		if (argument_count == 2 and argument[1] == true)
		{
			strikePoints = argument[0]
			if (strikePoints <= 0)
				strikeMode = false
		}
		else if (strikePoints+argument[0] > 0)
			strikePoints += argument[0]
		else {
			strikePoints = 0
			strikeMode = false
		}
	}


}
