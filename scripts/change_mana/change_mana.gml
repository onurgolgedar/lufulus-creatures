/// @param value
function change_mana() {

	if (argument[0] >= 0) {
		if (mana+argument[0] < maxMana)
			mana += argument[0]
		else
			mana = maxMana
	}
	else {
		if (mana+argument[0] > 0)
			mana += argument[0]
		else
			mana = 0
	}

#region ADDITIONAL
	if (object_index == objPlayer)
		alarm[2] = 1
	else
		alarm[11] = 1
#endregion


}
