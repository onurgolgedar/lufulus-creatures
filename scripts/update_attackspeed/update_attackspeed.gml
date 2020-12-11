function update_attackspeed() {
	var weaponAttackSpeed = 0

	if (!global.secondaryActive) {
	    if (has_active_mweapon() and global.weaponType != wtype_shield) {
	        var tempObject = instance_create(0, 0, global.item[global.weaponI, global.weaponJ])
	        tempObject.upgrade = global.itemUpgrade[global.weaponI, global.weaponJ]
	        with (tempObject) weapon_self_calculate()
        
	        weaponAttackSpeed = tempObject.cAttackSpeed
        
	        instance_destroy(tempObject)
	    }
	}
	else {
	    var tempObject = instance_create(0, 0, global.item[global.sWeaponI, global.sWeaponJ])
	    tempObject.upgrade = global.itemUpgrade[global.sWeaponI, global.sWeaponJ]
	    with (tempObject) weapon_self_calculate()
    
	    weaponAttackSpeed = tempObject.cAttackSpeed
    
	    instance_destroy(tempObject)
	}

	global.attackSpeed = weaponAttackSpeed
	+global.dex*0.008

	global.attackSpeed += global.add_attackSpeed

	if (!global.notRecalculateResultValues_sha)
		global.anticheat_resultValues = recalculate_sha_resultValues()


}
