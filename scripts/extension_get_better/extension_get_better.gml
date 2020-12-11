/// @param itemType
/// @param extension
function extension_get_better() {

	// Here, you can add non-generalized upgradable extensions
	if (argument[1] == ext_ctrl_dmg12)
		return ext_ctrl_dmg24
	else if (argument[1] == ext_poison500)
		return ext_poison900
	else if (argument[1] == ext_poison900)
		return ext_poison1600
	else if (argument[1] == ext_arrow_dmg12)
		return ext_arrow_dmg20
	else if (argument[1] == ext_basicMagical20)
		return ext_basicMagical30
	else if (argument[1] == ext_basicMagical30)
		return ext_basicMagical40
	else if (argument[1] == ext_basicLifeSteal3)
		return ext_basicLifeSteal6
	else if (argument[1] == ext_resistance10)
		return ext_resistance18
	else if (argument[1] == ext_resistance18)
		return ext_resistance26

	// These are basic upgradable extensions
	else if (argument[0] == wtype_bow or argument[0] == wtype_crossbow) {
		if (argument[1] == -1)
			return ext_arrowSpeed10
		else if (argument[1] == ext_arrowSpeed10)
			return ext_arrowSpeed18
		else if (argument[1] == ext_arrowSpeed18)
			return ext_arrowSpeed26
	}
	else if (argument[0] == wtype_ohsword) {
		if (argument[1] == -1)
			return ext_basicDamage10
		else if (argument[1] == ext_basicDamage10)
			return ext_basicDamage18
		else if (argument[1] == ext_basicDamage18)
			return ext_basicDamage26
	}

	return argument[1]


}
