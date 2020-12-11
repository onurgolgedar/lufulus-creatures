function earthmove_change() {
	if (argument[0] > 0) {
		if (earthMovePoints+argument[0] < 100)
			earthMovePoints += argument[0]
		else if (earthMovePoints != 100) {
			ds_list_add(moves, move_earthmove_1)
			earthMovePoints = 100
		}
	}
	else {
		if (argument_count == 2 and argument[1] == true)
			earthMovePoints = argument[0]
		else if (earthMovePoints+argument[0] > 0)
			earthMovePoints += argument[0]
		else
			earthMovePoints = 0
	}


}
