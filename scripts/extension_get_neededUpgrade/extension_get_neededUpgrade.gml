/// @param extensionNo
function extension_get_neededUpgrade() {

	if (argument[0] >= 900 and argument[0] <= 999 or argument[0] >= 700 and argument[0] <= 799)
		return 0
	else if (argument[0] >= 800 and argument[0] <= 899)
		return 4
	else if (argument[0] >= 500 and argument[0] <= 599)
		return 8
	else
		return 6


}
