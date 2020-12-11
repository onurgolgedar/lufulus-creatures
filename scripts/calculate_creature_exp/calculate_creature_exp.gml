/// @param level
function calculate_creature_exp() {

	/*if (argument[0] == 1) return 1
	else if (argument[0] == 2) return 1.5
	else if (argument[0] == 3) return 2
	else if (argument[0] == 4) return 2.5
	else if (argument[0] == 5) return 3
	else if (argument[0] == 6) return 3.5
	else return calculate_creature_exp(argument[0]-6)*4

	// {8, 14, 20, 26, 32, 38, 44, 50} these speacial creatures have more increase than normal.
	*/

	return power(2, 1/3*argument[0])


}
