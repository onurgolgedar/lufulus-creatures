/// @param extensionNo
function is_extension_active() {

	var mWeapon = has_active_mweapon() and is_mweapon_onhand()
	var sWeapon = has_active_sweapon() and is_sweapon_onhand()

	var neededUpgrade = extension_get_neededUpgrade(argument[0])
	
	if (global.medallionI != -1 and (global.itemExtension0[global.medallionI, global.medallionJ] == argument[0] or global.itemExtension1[global.medallionI, global.medallionJ] == argument[0]))
		return true

	if (mWeapon) {
		var mWeapon_ext0 = global.itemExtension0[global.weaponI, global.weaponJ]
		var mWeapon_ext1 = global.itemExtension1[global.weaponI, global.weaponJ]
	
		if (mWeapon_ext0 == argument[0] or mWeapon_ext1 == argument[0]) {
			var mWeapon_upgrade = global.itemUpgrade[global.weaponI, global.weaponJ]
		
			if (mWeapon_upgrade >= neededUpgrade)
				return true
		}
	}

	if (sWeapon) {
		var sWeapon_ext0 = global.itemExtension0[global.sWeaponI, global.sWeaponJ]
		var sWeapon_ext1 = global.itemExtension1[global.sWeaponI, global.sWeaponJ]
	
		if (sWeapon_ext0 == argument[0] or sWeapon_ext1 == argument[0]) {
			var sWeapon_upgrade = global.itemUpgrade[global.sWeaponI, global.sWeaponJ]
		
			if (sWeapon_upgrade >= neededUpgrade)
				return true
		}
	}
	
	if (global.clothesI != -1) {
		var clothes_ext0 = global.itemExtension0[global.clothesI, global.clothesJ]
		var clothes_ext1 = global.itemExtension1[global.clothesI, global.clothesJ]
	
		if (clothes_ext0 == argument[0] or clothes_ext1 == argument[0]) {
			var clothes_upgrade = global.itemUpgrade[global.clothesI, global.clothesJ]
		
			if (clothes_upgrade >= neededUpgrade)
				return true
		}
	}
	
	if (global.necklaceI != -1) {
		var necklace_ext0 = global.itemExtension0[global.necklaceI, global.necklaceJ]
		var necklace_ext1 = global.itemExtension1[global.necklaceI, global.necklaceJ]
	
		if (necklace_ext0 == argument[0] or necklace_ext1 == argument[0]) {
			var necklace_upgrade = global.itemUpgrade[global.necklaceI, global.necklaceJ]
		
			if (necklace_upgrade >= neededUpgrade)
				return true
		}
	}
	
	return false


}
