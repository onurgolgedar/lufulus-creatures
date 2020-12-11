function update_criticalchance() {
	var weaponCC = 0

	if (!global.secondaryActive) {
	    if (has_active_mweapon() and global.weaponType != wtype_shield) {
	        var tempObject = instance_create(0, 0, global.item[global.weaponI, global.weaponJ])
	        tempObject.upgrade = global.itemUpgrade[global.weaponI, global.weaponJ]
	        with (tempObject) weapon_self_calculate()
        
	        weaponCC = tempObject.cCriticalChance
        
	        instance_destroy(tempObject)
	    }
	}
	else {
	    var tempObject = instance_create(0, 0, global.item[global.sWeaponI, global.sWeaponJ])
	    tempObject.upgrade = global.itemUpgrade[global.sWeaponI, global.sWeaponJ]
	    with (tempObject) weapon_self_calculate()
    
	    weaponCC = tempObject.cCriticalChance
    
	    instance_destroy(tempObject)
	}

	global.criticalChance = weaponCC+extension_exists(ext_criticalChance10)*10

	global.criticalChance += global.add_criticalChance

	if (!global.notRecalculateResultValues_sha)
		global.anticheat_resultValues = recalculate_sha_resultValues()


}
