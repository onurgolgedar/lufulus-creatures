/// @param type
function get_upgradematerial_name() {

	if (argument[0] == 0)
		return "D"//"1-6 lv"
	else if (argument[0] == 1)
		return "C"//"7-12 lv"
	else if (argument[0] == 2)
		return "B"//"13-18 lv"
	else if (argument[0] == 3)
		return "A"//"19-24 lv"
	else if (argument[0] == 4)
		return "A+"//"25-30 lv"
	else
		return "X"


}
