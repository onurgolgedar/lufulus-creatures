function update_armor() {
	var clothesAR = 0
	var shieldAR = 0

	if (global.clothesI != -1) {
	    var tempObject = instance_create(0, 0, global.item[global.clothesI, global.clothesJ]);
	    tempObject.upgrade = global.itemUpgrade[global.clothesI, global.clothesJ]
	    with (tempObject) clothes_self_calculate()
        
	    clothesAR = tempObject.cArmor
        
	    instance_destroy(tempObject)
	}

	if (has_active_mweapon() and global.weaponType == wtype_shield) {
	    var tempObject = instance_create(0, 0, global.item[global.weaponI, global.weaponJ]);
	    tempObject.upgrade = global.itemUpgrade[global.weaponI, global.weaponJ]
	    with (tempObject) weapon_self_calculate()
        
	    shieldAR = tempObject.cArmor
        
	    instance_destroy(tempObject)
	}

	global.armor = clothesAR+shieldAR

	if (!global.notRecalculateResultValues_sha)
		global.anticheat_resultValues = recalculate_sha_resultValues()


}
