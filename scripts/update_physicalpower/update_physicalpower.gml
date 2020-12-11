function update_physicalpower() {
	var weaponDamage = 0

	if (!global.secondaryActive) {
	    if (has_active_mweapon() and global.weaponType != wtype_shield) {
	        var tempObject = instance_create(0, 0, global.item[global.weaponI, global.weaponJ])
	        tempObject.upgrade = global.itemUpgrade[global.weaponI, global.weaponJ]
		
	        with (tempObject)
				weapon_self_calculate()
        
	        weaponDamage = tempObject.cDamage
        
	        instance_destroy(tempObject)
	    }
		else
			weaponDamage = 1
	}
	else {
	    var tempObject = instance_create(0, 0, global.item[global.sWeaponI, global.sWeaponJ])
	    tempObject.upgrade = global.itemUpgrade[global.sWeaponI, global.sWeaponJ]
	
	    with (tempObject)
			weapon_self_calculate()
    
	    weaponDamage = tempObject.cDamage
    
	    instance_destroy(tempObject)
	}

	global.physicalPower = (weaponDamage*100/100+power(global.level/(5-IS_MOBILE), 2))
	*(100+global.str*1.6)/100

	global.physicalPower += global.add_physicalPower

	if (!global.notRecalculateResultValues_sha)
		global.anticheat_resultValues = recalculate_sha_resultValues()


}
