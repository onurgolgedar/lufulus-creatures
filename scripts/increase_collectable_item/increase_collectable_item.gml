/// @param item
/// @param count
/// @param materialUpgrade
function increase_collectable_item() {

	// ? can be together with decrease_collectable_item

	var ai_instanceOfItem = instance_create(0, 0, argument[0])
	var materialUpgrade = (argument_count > 2) ? argument[2] : -1

	if (argument[1] == 0) {
		instance_destroy(ai_instanceOfItem)
		global.anticheat_ownings = recalculate_sha_ownings()
		return true
	}

	if (ai_instanceOfItem.isCollectable)
		for (var i = 0; i < global.bagBoxCount_horizontal*global.bagMaxPage; i++)
			for (var j = 0; j < global.bagBoxCount_vertical+5*(i == 0); j++)
	            if (global.item[i, j] != -1 and global.item[i, j] == ai_instanceOfItem.object_index and (ai_instanceOfItem.object_index != objUpgradeMaterial or materialUpgrade == global.itemUpgrade[i, j])) {
	                global.itemCount[i, j] += argument[1]
				
					with (objItemBag) {
						page = (i div global.bagBoxCount_horizontal)+1
						beforePage = page
					}
				
				#region END TRUE
					if (ai_instanceOfItem.isForQuest != false and ai_instanceOfItem.isForQuest_directMode)
						quest_progress(ai_instanceOfItem.isForQuest, argument[1])
				
	                instance_destroy(ai_instanceOfItem)
	                itembag_refresh()
					save_bag(global.saveNo)
					global.anticheat_ownings = recalculate_sha_ownings()
	                return true
				#endregion
	            }
			

	// ?
	var anyAdded_bank = false
	repeat (argument[1])
		if (add_item_bank(argument[0], argument[1]))
			anyAdded_bank = true
			
#region END TRUE
	if (anyAdded_bank) {	
		instance_destroy(ai_instanceOfItem)
		global.anticheat_ownings = recalculate_sha_ownings()
		return true
	}
#endregion

#region END FALSE
	instance_destroy(ai_instanceOfItem)
	save_bag(global.saveNo)
	global.anticheat_ownings = recalculate_sha_ownings()
	return false
#endregion


}
