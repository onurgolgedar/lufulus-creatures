/// @param item
/// @param count
/// @param materialUpgrade
function decrease_collectable_item_bank() {

	var ai_instanceOfItem = instance_create(0, 0, argument[0])
	var materialUpgrade = (argument_count > 2) ? argument[2] : -1

	if (ai_instanceOfItem.isCollectable)
		for (var i = 0; i < global.bagBoxCount_horizontal*global.bagMaxPage; i++)
			for (var j = 0; j < global.bagBoxCount_vertical; j++)
	            if (global.item_bank[i, j] != -1 and global.item_bank[i, j] == ai_instanceOfItem.object_index and (ai_instanceOfItem.object_index != objUpgradeMaterial or materialUpgrade == global.itemUpgrade_bank[i, j])) {
	                if (global.itemCount_bank[i, j] > 1) {
	                    global.itemCount_bank[i, j] -= argument[1]
					
						if (global.itemCount_bank[i, j] <= 0)
							delete_item(i, j)
					
					#region END TRUE
	                    instance_destroy(ai_instanceOfItem)
	                    bankwindow_refresh()
						save_bank(global.saveNo)
						global.anticheat_ownings = recalculate_sha_ownings()
	                    return true
					#endregion
	                }
	                else {
						delete_item_bank(i, j)
					
					#region END TRUE
	                    instance_destroy(ai_instanceOfItem)
						save_bank(global.saveNo)
						global.anticheat_ownings = recalculate_sha_ownings()
	                    return true
					#endregion
	                }
	            }

#region END FALSE
	instance_destroy(ai_instanceOfItem)
	save_bank(global.saveNo)
	global.anticheat_ownings = recalculate_sha_ownings()
	return false
#endregion


}
