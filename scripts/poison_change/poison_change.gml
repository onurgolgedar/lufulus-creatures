function poison_change() {
	if (argument[0] > 0) {
		if (poisonPoints+argument[0] < 100)
			poisonPoints += argument[0]
		else if (poisonPoints != 100) {
			poisonPoints = 100
		
			ds_list_add(moves, move_sprayPoison)
		}
	}
	else {
		if (argument_count == 2 and argument[1] == true)
			poisonPoints = argument[0]
		else if (poisonPoints+argument[0] > 0)
			poisonPoints += argument[0]
		else
			poisonPoints = 0
	}


}
