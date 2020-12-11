function pull_change() {
	if (argument[0] > 0) {
		if (pullPoints+argument[0] < 100)
			pullPoints += argument[0]
		else if (pullPoints != 100) {
			ds_list_add(moves, move_pull)
		
			if (hp > maxHp/2) {
				with (object_index) {
					if (id != other.id and abilityPull and target == other.target)
						pull_change(-100)
				}
			}
		
			pullPoints = 100
		}
	}
	else {
		if (argument_count == 2 and argument[1] == true) {
			pullPoints = argument[0]
		}
		else if (pullPoints+argument[0] > 0)
			pullPoints += argument[0]
		else {
			pullPoints = 0
		}
	}


}
