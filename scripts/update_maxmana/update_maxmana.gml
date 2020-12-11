function update_maxmana() {
	var weaponMana = 0
	var sWeaponMana = 0
	var necklaceMana = 0
	var clothesMana = 0
	var shieldMana = 0

	if (has_active_mweapon()) {
	    var tempObject = instance_create(0, 0, global.item[global.weaponI, global.weaponJ])
	    tempObject.upgrade = global.itemUpgrade[global.weaponI, global.weaponJ]
	    with (tempObject) weapon_self_calculate()
        
	    weaponMana = tempObject.cMana
        
	    instance_destroy(tempObject)
	}

	if (global.necklaceI != -1) {
		var tempObject = instance_create(0, 0, global.item[global.necklaceI, global.necklaceJ])
	    tempObject.upgrade = global.itemUpgrade[global.necklaceI, global.necklaceJ]
	    with (tempObject) necklace_self_calculate()
    
	    necklaceMana = tempObject.cMana
    
	    instance_destroy(tempObject)
	}

	if (global.clothesI != -1) {
	    var tempObject = instance_create(0, 0, global.item[global.clothesI, global.clothesJ])
	    tempObject.upgrade = global.itemUpgrade[global.clothesI, global.clothesJ]
	    with (tempObject) clothes_self_calculate()
    
	    clothesMana = tempObject.cMana
    
	    instance_destroy(tempObject)
	}

	if (has_active_sweapon() and global.secondaryActive) {
	    var tempObject = instance_create(0, 0, global.item[global.sWeaponI, global.sWeaponJ])
	    tempObject.upgrade = global.itemUpgrade[global.sWeaponI, global.sWeaponJ]
	    with (tempObject) weapon_self_calculate()
    
	    sWeaponMana = tempObject.cMana
    
	    instance_destroy(tempObject)
	}

	var prev = global.maxMana
	global.maxMana = (100+weaponMana+necklaceMana+clothesMana+shieldMana+sWeaponMana)
	*(100+global.sta*2)/100

	global.maxMana += global.add_maxMana

	with (objPlayer) {
		maxMana = global.maxMana
	
		//if (prev < global.maxMana)
			change_mana(global.maxMana-prev)
		/*else
			change_mana(0)*/
	}

	if (!global.notRecalculateResultValues_sha)
		global.anticheat_resultValues = recalculate_sha_resultValues()


}
