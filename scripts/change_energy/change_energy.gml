/// @param value
function change_energy() {

	if (energy+argument[0] < 100) {
		if (energy+argument[0] >= 0)
			energy += argument[0]
		else
			energy = 0
	}
	else
		energy = 100
	
#region ADDITIONAL
	if (object_index == objPlayer)
		alarm[2] = 1
	else
		alarm[11] = 1
#endregion


}
