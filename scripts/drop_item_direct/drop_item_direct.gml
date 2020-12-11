/// @param item
/// @param upgrade
/// @param extension0
/// @param extension1
/// @param count*
function drop_item_direct() {

	var count = 1
	if (argument_count == 6)
		count = argument[4]

	var item_ins = instance_create(x, y, argument[0])

	var index_of_the_same = -1
	if (item_ins.isCollectable) {
		for (var j = 0; j < ds_list_size(droppedList); j++) {
			if (item_ins.object_index == objUpgradeMaterial) {
				if (item_ins.object_index == ds_list_find_value(droppedList, j)
				and argument[1] == ds_list_find_value(droppedUpgradeList, j))
					index_of_the_same = j
			}
			else {
				if (item_ins.object_index == ds_list_find_value(droppedList, j))
					index_of_the_same = j
			}
			
			if (index_of_the_same != -1)
				count += ds_list_find_value(droppedCountList, index_of_the_same)
		}
	}

	instance_destroy(item_ins)
		
	if (index_of_the_same == -1) {
		ds_list_add(droppedList, argument[0])
		ds_list_add(droppedUpgradeList, argument[1])
		ds_list_add(droppedExtension0List, argument[2])
		ds_list_add(droppedExtension1List, argument[3])
		ds_list_add(droppedCountList, count)
	}
	else
		ds_list_replace(droppedCountList, index_of_the_same, count)


}
