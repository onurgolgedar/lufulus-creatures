/// @param skill
function skill_get_upgrade() {

	for (var i = 0; i < 20; i++)
	    for (var j = 0; j < 6; j++)
	        if (global.skillObject[i, j] == argument[0])
				return global.skillUpgrade[i, j]

	return -1


}
