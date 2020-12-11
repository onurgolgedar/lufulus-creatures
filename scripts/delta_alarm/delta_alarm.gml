/// @param alarm
/// @param time
/// @param owner*
/// @param onlyIncrease*
function delta_alarm() {

	var owner = id
	if (argument_count > 2)
		owner = argument[2]
	
	var onlyIncrease = false
	if (argument_count > 3)
		onlyIncrease = argument[3]

	var value
	if (argument[1] == 0)
		value = 0
	else if (argument[1] == -1)
		value = -1
	else {
		value = min(max(round(argument[1]/delta()), 1), ceil(argument[1]*global.averageFPS/60*1.5))
		if (value < 1)
			value = 1
	}

	with (owner)
		if (!onlyIncrease or value > alarm[argument[0]])
			alarm[argument[0]] = value
	
	return alarm[argument[0]]


}
