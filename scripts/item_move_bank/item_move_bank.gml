/// @param i1
/// @param j1
/// @param i2
/// @param j2
function item_move_bank() {

	var i1 = argument[0]
	var j1 = argument[1]
	var i2 = argument[2]
	var j2 = argument[3]
	
	var before_item = global.item_bank[i2, j2]
	var before_upgrade = global.itemUpgrade_bank[i2, j2]
	var before_extension0 = global.itemExtension0_bank[i2, j2]
	var before_extension1 = global.itemExtension1_bank[i2, j2]
	var before_type = global.itemType_bank[i2, j2]
	var before_count = global.itemCount_bank[i2, j2]
	var before_rentTime = global.itemRentTime_bank[i2, j2]

	global.item_bank[i2, j2] = global.item_bank[i1, j1]
	global.itemUpgrade_bank[i2, j2] = global.itemUpgrade_bank[i1, j1]
	global.itemExtension0_bank[i2, j2] = global.itemExtension0_bank[i1, j1]
	global.itemExtension1_bank[i2, j2] = global.itemExtension1_bank[i1, j1]
	global.itemType_bank[i2, j2] = global.itemType_bank[i1, j1]
	global.itemCount_bank[i2, j2] = global.itemCount_bank[i1, j1]
	global.itemRentTime_bank[i2, j2] = global.itemRentTime_bank[i1, j1]

	global.item_bank[i1, j1] = before_item
	global.itemUpgrade_bank[i1, j1] = before_upgrade
	global.itemExtension0_bank[i1, j1] = before_extension0
	global.itemExtension1_bank[i1, j1] = before_extension1
	global.itemType_bank[i1, j1] = before_type
	global.itemCount_bank[i1, j1] = before_count
	global.itemRentTime_bank[i1, j1] = before_rentTime

	bankwindow_refresh()
	
	global.anticheat_ownings = recalculate_sha_ownings()


}
