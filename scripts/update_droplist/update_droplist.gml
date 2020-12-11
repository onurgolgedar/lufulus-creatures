/// @param item
/// @param upgrade
/// @param extension0
/// @param extension1
/// @param chance at 100
/// @param count*
/// @param chooseMax_mode*
function update_droplist() {

	var count = 1
	if (argument_count > 5)
		count = argument[5]
	
	var chooseMax_mode = false
	if (argument_count > 6)
		chooseMax_mode = argument[6]
	
	if (!chooseMax_mode or ds_list_find_index(dropList, argument[0]) == -1) {
		ds_list_add(dropList, argument[0])
		ds_list_add(dropUpgradeList, argument[1])
		ds_list_add(dropExtension0List, argument[2])
		ds_list_add(dropExtension1List, argument[3])
		ds_list_add(dropChanceList, argument[4])
		ds_list_add(dropCountList, count)
	}
	else { 
		var dropIndex = ds_list_find_index(dropList, argument[0])
		var dropChance = ds_list_find_value(dropChanceList, dropIndex)
		ds_list_set(dropList, dropIndex, argument[0])
		ds_list_add(dropUpgradeList, dropIndex, argument[1])
		ds_list_add(dropExtension0List, dropIndex, argument[2])
		ds_list_add(dropExtension1List, dropIndex, argument[3])
		ds_list_add(dropChanceList, dropIndex, max(dropChance, argument[4]))
		ds_list_add(dropCountList, dropIndex, count)
	}


}
