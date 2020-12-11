function update_stats() {
	var necklaceStr = 0
	var necklaceVit = 0
	var necklaceDex = 0
	var necklaceMp = 0
	var necklaceSta = 0

	if (global.necklaceI != -1) {
	    var tempObject = instance_create(0, 0, global.item[global.necklaceI, global.necklaceJ])
	    tempObject.upgrade = global.itemUpgrade[global.necklaceI, global.necklaceJ]
	    with (tempObject) necklace_self_calculate()
	
	    necklaceStr = tempObject.cStr
	    necklaceVit = tempObject.cVit
	    necklaceDex = tempObject.cDex
	    necklaceMp = tempObject.cMp
	    necklaceSta = tempObject.cSta
    
	    instance_destroy(tempObject)
	}

	var efboxStr = instance_exists(objPlayer) ? test_effectbox(efboxPower, objPlayer.id)*8 : 0

	var extensionStats_exists = extension_exists(ext_stats)
	var extensionMP = extensionStats_exists*3
	var extensionDEX = extensionStats_exists*3
	var extensionSTR = extensionStats_exists*3
	var extensionVIT = extensionStats_exists*3
	var extensionSTA = extensionStats_exists*3

	// Calculations
	global.str = necklaceStr+global.givenStr+global.virtual_str+efboxStr+extensionSTR
	global.vit = necklaceVit+global.givenVit+global.virtual_vit+extensionVIT
	global.dex = necklaceDex+global.givenDex+global.virtual_dex+extensionDEX
	global.mp = necklaceMp+global.givenMp+global.virtual_mp+extensionMP
	global.sta = necklaceSta+global.givenSta+global.virtual_sta+extensionSTA

	if (!global.notRecalculateResultValues_sha)
		global.anticheat_resultValues = recalculate_sha_resultValues()


}
