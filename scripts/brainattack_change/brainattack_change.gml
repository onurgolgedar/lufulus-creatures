function brainattack_change() {
	if (argument[0] > 0) {
		if (brainAttackPoints+argument[0] < 100)
			brainAttackPoints += argument[0]
		else if (brainAttackPoints != 100) {
			ds_list_add(moves, move_brainAttack)
			brainAttackPoints = 100
		}
	}
	else {
		if (argument_count == 2 and argument[1] == true)
			brainAttackPoints = argument[0]
		else if (brainAttackPoints+argument[0] > 0)
			brainAttackPoints += argument[0]
		else {
			brainAttackPoints = 0
		}
	}


}
