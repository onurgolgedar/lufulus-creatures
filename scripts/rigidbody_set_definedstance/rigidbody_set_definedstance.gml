/// @param stance
function rigidbody_set_definedstance() {

	var duration_rs
	if (argument_count == 2)
		duration_rs = argument[1]
	else
		duration_rs = sec/4

	if (rigidbodyType == 1)
		rigidbody_set_definedstance_type1(argument[0], duration_rs/delta())
	else if (rigidbodyType == 2)
		rigidbody_set_definedstance_type2(argument[0], duration_rs/delta())


}
