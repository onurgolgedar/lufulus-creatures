/// @param value
function calculate_givenexperience() {

	if (is_cinematic())
		return 0
	
	return ceil(argument[0]*(100+global.add_expRatio)/100)


}
