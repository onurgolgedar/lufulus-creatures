/// @param type
/// @param uniqueValue
function set_lootbox() {

	type = argument[0]
	lootNo = calculate_lootNo(argument[1])
	if (type != 0 and ds_list_find_index(global.takenLootboxes, lootNo) != -1) {
		instance_destroy()
		return false
	}

	return true


}
