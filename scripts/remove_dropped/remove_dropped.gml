/// @param item
function remove_dropped() {

	var dropIndex = ds_list_find_index(droppedList, argument[0])
	if (dropIndex != -1) {
		ds_list_delete(droppedList, dropIndex)
		ds_list_delete(droppedUpgradeList, dropIndex)
		ds_list_delete(droppedCountList, dropIndex)
		ds_list_delete(droppedExtension0List, dropIndex)
		ds_list_delete(droppedExtension1List, dropIndex)
	}

	return dropIndex != -1


}
