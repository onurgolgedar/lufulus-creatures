function drop_lists_destroy() {
	ds_list_destroy(droppedList)
	ds_list_destroy(droppedUpgradeList)
	ds_list_destroy(droppedExtension0List)
	ds_list_destroy(droppedExtension1List)
	ds_list_destroy(droppedCountList)
	
	ds_list_destroy(dropList)
	ds_list_destroy(dropUpgradeList)
	ds_list_destroy(dropExtension0List)
	ds_list_destroy(dropExtension1List)
	ds_list_destroy(dropChanceList)
	ds_list_destroy(dropCountList)

	hasDropList = false


}
