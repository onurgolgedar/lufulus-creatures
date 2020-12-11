/// @param i1
/// @param j1
/// @param i2
/// @param j2
function item_move() {

	var i1 = argument[0]
	var j1 = argument[1]
	var i2 = argument[2]
	var j2 = argument[3]

	var change1 = false
	var change2 = false

	if (is_active(i1, j1)) {
		change_active(global.itemType[i1, j1], -1, -1, false, true)
		change1 = true
	} else if (is_active(i2, j2)) {
		change_active(global.itemType[i2, j2], -1, -1, false, true)
		change2 = true
	}
	
	var before_item = global.item[i2, j2]
	var before_upgrade = global.itemUpgrade[i2, j2]
	var before_extension0 = global.itemExtension0[i2, j2]
	var before_extension1 = global.itemExtension1[i2, j2]
	var before_type = global.itemType[i2, j2]
	var before_count = global.itemCount[i2, j2]

	global.item[i2, j2] = global.item[i1, j1]
	global.itemUpgrade[i2, j2] = global.itemUpgrade[i1, j1]
	global.itemExtension0[i2, j2] = global.itemExtension0[i1, j1]
	global.itemExtension1[i2, j2] = global.itemExtension1[i1, j1]
	global.itemType[i2, j2] = global.itemType[i1, j1]
	global.itemCount[i2, j2] = global.itemCount[i1, j1]

	global.item[i1, j1] = before_item
	global.itemUpgrade[i1, j1] = before_upgrade
	global.itemExtension0[i1, j1] = before_extension0
	global.itemExtension1[i1, j1] = before_extension1
	global.itemType[i1, j1] = before_type
	global.itemCount[i1, j1] = before_count

	itembag_refresh()

	if (change1)
		change_active(global.itemType[i2, j2], i2, j2, false, true)

	if (change2)
		change_active(global.itemType[i1, j1], i1, j1, false, true)
	
	global.anticheat_ownings = recalculate_sha_ownings()


}
