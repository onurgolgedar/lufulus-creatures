/// @param type
/// @param isJ
function get_active_item_ij() {

	if (argument[1] == 0) {
	    if (argument[0] == type_medallion)
	        return global.medallionI
	    else if (argument[0] == type_mweapon)
	        return global.weaponI
	    else if (argument[0] == type_sweapon)
	        return global.sWeaponI
	    else if (argument[0] == type_necklace)
	        return global.necklaceI
	    else if (argument[0] == type_clothes)
	        return global.clothesI
	}
	else if (argument[1] == 1) {
	    if (argument[0] == type_medallion)
	        return global.medallionJ
	    else if (argument[0] == type_mweapon)
	        return global.weaponJ
	    else if (argument[0] == type_sweapon)
	        return global.sWeaponJ
	    else if (argument[0] == type_necklace)
	        return global.necklaceJ
	    else if (argument[0] == type_clothes)
	        return global.clothesJ
	}

	return -1


}
