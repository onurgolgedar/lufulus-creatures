function slowstone_change() {
	if (argument[0] > 0) {
		if (slowStonePoints+argument[0] < 100)
			slowStonePoints += argument[0]
		else if (slowStonePoints != 100) {
			slowStonePoints = 100
		
			ds_list_add(moves, move_slowstone)
		}
	}
	else {
		if (argument_count == 2 and argument[1] == true)
			slowStonePoints = argument[0]
		else if (slowStonePoints+argument[0] > 0)
			slowStonePoints += argument[0]
		else
			slowStonePoints = 0
	}


}
