function drop_items() {
	if (isDrop_needed == -1)
		isDrop_needed = true

	if (isDropEnrichment_needed == true and object_index != objLootbox)
		exit
	
	isDrop_needed = false

	var ds_size = ds_list_size(dropList)
	for (var di_i = 0; di_i < ds_size; di_i++) {
		if (chance(ds_list_find_value(dropChanceList, di_i), 1000)) {
			var item_ins = instance_create(x, y, ds_list_find_value(dropList, di_i))
		
			var count = 1
			var index_of_the_same = -1
			if (item_ins.isCollectable) {
				for (var j = 0; j < ds_list_size(droppedList); j++) {
					if (item_ins.object_index == objUpgradeMaterial) {
						if (item_ins.object_index == ds_list_find_value(droppedList, j)
						and ds_list_find_value(dropUpgradeList, di_i) == ds_list_find_value(droppedUpgradeList, j))
							index_of_the_same = j
					}
					else {
						if (item_ins.object_index == ds_list_find_value(droppedList, j))
							index_of_the_same = j
					}
			
					if (index_of_the_same != -1)
						count = ds_list_find_value(droppedCountList, index_of_the_same)+ds_list_find_value(dropCountList, di_i)
				}
			}
		
			if (index_of_the_same == -1) {
				ds_list_add(droppedList, ds_list_find_value(dropList, di_i))
				ds_list_add(droppedUpgradeList, ds_list_find_value(dropUpgradeList, di_i))
				ds_list_add(droppedCountList, ds_list_find_value(dropCountList, di_i))
		
				ds_list_add(droppedExtension0List, ds_list_find_value(dropExtension0List, di_i))
				ds_list_add(droppedExtension1List, ds_list_find_value(dropExtension1List, di_i))
			}
			else
				ds_list_replace(droppedCountList, index_of_the_same, count)
		
			instance_destroy(item_ins)
		}
	}


}
