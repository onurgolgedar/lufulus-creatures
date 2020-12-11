/// @param stance
function player_set_stance() {

	with (objPlayer) {	
		if (argument_count > 1)
			rigidbody_set_definedstance_type1(argument[0], argument[1])
		else
			rigidbody_set_definedstance_type1(argument[0])
	}


}
