/// @param i
/// @param j
function delete_item_bank() {

	global.item_bank[argument[0], argument[1]] = -1
	global.itemUpgrade_bank[argument[0], argument[1]] = -1
	global.itemExtension0_bank[argument[0], argument[1]] = -1
	global.itemExtension1_bank[argument[0], argument[1]] = -1
	global.itemType_bank[argument[0], argument[1]] = pointer_null
	global.itemCount_bank[argument[0], argument[1]] = -1

	bankwindow_refresh()
	save_bank(global.saveNo)
	global.anticheat_ownings = recalculate_sha_ownings()


}
