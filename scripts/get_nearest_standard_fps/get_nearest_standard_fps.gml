/// @param fps
function get_nearest_standard_fps() {

	if (argument[0] < 30)
		return 30
	else if (abs(argument[0]-30) < 5)
		return 30
	else if (abs(argument[0]-50) < 5)	
		return 50
	else if (abs(argument[0]-60) < 5)	
		return 60
	else if (abs(argument[0]-75) < 7)	
		return 75
	else if (abs(argument[0]-120) < 7)	
		return 120
	else if (abs(argument[0]-144) < 7)	
		return 144
	else if (abs(argument[0]-240) < 10)	
		return 240
	else if (abs(argument[0]-300) < 10)	
		return 300
	else
		return argument[0]


}
