function update_maxhealth() {
	var necklaceHp = 0
	var clothesHp = 0
	var shieldHp = 0

	if (global.necklaceI != -1) {
	    var tempObject = instance_create(0, 0, global.item[global.necklaceI, global.necklaceJ])
	    tempObject.upgrade = global.itemUpgrade[global.necklaceI, global.necklaceJ]
	    with (tempObject) necklace_self_calculate()
    
	    necklaceHp = tempObject.cHp
    
	    instance_destroy(tempObject)
	}

	if (global.clothesI != -1) {
	    var tempObject = instance_create(0, 0, global.item[global.clothesI, global.clothesJ])
	    tempObject.upgrade = global.itemUpgrade[global.clothesI, global.clothesJ]
	    with (tempObject) clothes_self_calculate()
    
	    clothesHp = tempObject.cHp
    
	    instance_destroy(tempObject)
	}

	if (has_active_mweapon() and global.weaponType == wtype_shield) {
	    var tempObject = instance_create(0, 0, global.item[global.weaponI, global.weaponJ])
	    tempObject.upgrade = global.itemUpgrade[global.weaponI, global.weaponJ]
	    with (tempObject) clothes_self_calculate()
    
	    shieldHp = tempObject.cHp
    
	    instance_destroy(tempObject)
	}

	var prev = global.maxHp
	global.maxHp = (100+(global.level-1)*(4+IS_MOBILE+global.level/(2.5-IS_MOBILE*0.2))+necklaceHp+clothesHp+shieldHp)
	*(100+global.vit*2)/100

	global.maxHp += global.add_maxHp

	with (objPlayer) {
		maxHp = global.maxHp
	
		//if (prev < global.maxHp)
			change_hp(global.maxHp-prev)
		/*else
			change_hp(0)*/
	}

	if (!global.notRecalculateResultValues_sha)
		global.anticheat_resultValues = recalculate_sha_resultValues()


}
