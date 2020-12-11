function item_shining_refresh() {
	with (objMWeapon) {
		if (global.weaponI != -1)
			upgrade = global.itemUpgrade[global.weaponI, global.weaponJ]
		else
			upgrade = -1
		
		shiningPower = (upgrade > 5)+(upgrade > 7)
	}

	with (objSWeapon) {
		if (global.sWeaponI != -1)
			upgrade = global.itemUpgrade[global.sWeaponI, global.sWeaponJ]
		else
			upgrade = -1
		shiningPower = (upgrade > 5)+(upgrade > 7)
	}

	with (objShieldControl) {
		if (global.weaponI != -1)
			upgrade = (owner == objPlayer.id) ? global.itemUpgrade[global.weaponI, global.weaponJ] : 0
		else
			upgrade = -1
		shiningPower = (upgrade > 5)+(upgrade > 7)
	}

	with (objCrossbowControl) {
		if (global.weaponI != -1)
			upgrade = (owner == objPlayer.id) ? global.itemUpgrade[global.weaponI, global.weaponJ] : 0
		else
			upgrade = -1
		shiningPower = (upgrade > 5)+(upgrade > 7)
	}

	with (objBowControl) {
		if (global.weaponI != -1)
			upgrade = (owner == objPlayer.id) ? global.itemUpgrade[global.weaponI, global.weaponJ] : 0
		else
			upgrade = -1
		shiningPower = (upgrade > 5)+(upgrade > 7)
	}

	with (objMWeaponControl) {
		if (global.weaponI != -1)
			upgrade = (owner == objPlayer.id) ? global.itemUpgrade[global.weaponI, global.weaponJ] : 0
		else
			upgrade = -1
		shiningPower = (upgrade > 5)+(upgrade > 7)
	}

	with (objSWeaponControl) {
		if (global.sWeaponI != -1)
			upgrade = (owner == objPlayer.id) ? global.itemUpgrade[global.sWeaponI, global.sWeaponJ] : 0
		else
			upgrade = -1
		shiningPower = (upgrade > 5)+(upgrade > 7)
	}

	with (objPlayer) {
		if (global.clothesI != -1)
			shiningPower = (global.itemUpgrade[global.clothesI, global.clothesJ] > 5)+(global.itemUpgrade[global.clothesI, global.clothesJ] > 7)
		else
			shiningPower = 0
	}


}
