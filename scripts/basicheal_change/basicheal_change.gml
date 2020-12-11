function basicheal_change() {
	if (argument[0] > 0) {
		if (basicHealPoints+argument[0] < 100)
			basicHealPoints += argument[0]
		else if (basicHealPoints != 100) {
			basicHealPoints = 100
		
			ds_list_add(moves, move_basicHeal)
		}
	}
	else {
		if (argument_count == 2 and argument[1] == true) {
			basicHealPoints = argument[0]
		}
		else if (basicHealPoints+argument[0] > 0)
			basicHealPoints += argument[0]
		else {
			basicHealPoints = 0
		}
	}


}
