/// @param indicator
/// @param owner*
/// @param level*
function test_effectbox() {

	var efboxOwner = id
	if (argument_count > 1)
		efboxOwner = argument[1]
	
	with (argument[0]) {
		if (owner == efboxOwner and (argument_count < 3 or argument[2] <= level))
			return true
	}

	return false


}
