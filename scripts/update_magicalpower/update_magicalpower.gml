function update_magicalpower() {
	var weaponMagicalDamage = 0

	if (!global.secondaryActive) {
	    if (has_active_mweapon() and global.weaponType != wtype_shield) {
	        var tempObject = instance_create(0, 0, global.item[global.weaponI, global.weaponJ])
	        tempObject.upgrade = global.itemUpgrade[global.weaponI, global.weaponJ]
	        with (tempObject) weapon_self_calculate()
        
	        weaponMagicalDamage = tempObject.cMagicalDamage
        
	        instance_destroy(tempObject)
	    }
	}
	else {
	    var tempObject = instance_create(0, 0, global.item[global.sWeaponI, global.sWeaponJ])
	    tempObject.upgrade = global.itemUpgrade[global.sWeaponI, global.sWeaponJ]
	    with (tempObject) weapon_self_calculate()
    
	    weaponMagicalDamage = tempObject.cMagicalDamage
    
	    instance_destroy(tempObject)
	}

	global.magicalPower = (weaponMagicalDamage+global.level*(2+global.level/15))
	*(100+global.mp*2)/100

	global.magicalPower += global.add_magicalPower

	if (!global.notRecalculateResultValues_sha)
		global.anticheat_resultValues = recalculate_sha_resultValues()


}
