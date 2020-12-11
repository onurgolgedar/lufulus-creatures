/// @param i
/// @param j
function delete_item() {

	if (is_active(argument[0], argument[1]))
		deactive_item(global.itemType[argument[0], argument[1]])

	global.item[argument[0], argument[1]] = -1
	global.itemUpgrade[argument[0], argument[1]] = -1
	global.itemExtension0[argument[0], argument[1]] = -1
	global.itemExtension1[argument[0], argument[1]] = -1
	global.itemType[argument[0], argument[1]] = pointer_null
	global.itemCount[argument[0], argument[1]] = -1

	itembag_refresh()
	save_bag(global.saveNo)
	global.anticheat_ownings = recalculate_sha_ownings()


}
