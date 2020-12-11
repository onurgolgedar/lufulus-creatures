/// @param item
/// @param count
/// @param materialUpgrade
function decrease_collectable_item() {

	var ai_instanceOfItem = instance_create(0, 0, argument[0])
	var materialUpgrade = (argument_count > 2) ? argument[2] : -1

	if (ai_instanceOfItem.isCollectable)
		for (var i = 0; i < global.bagBoxCount_horizontal*global.bagMaxPage; i++)
			for (var j = 0; j < global.bagBoxCount_vertical+5*(i == 0); j++)
	            if (global.item[i, j] != -1 and global.item[i, j] == ai_instanceOfItem.object_index and (ai_instanceOfItem.object_index != objUpgradeMaterial or materialUpgrade == global.itemUpgrade[i, j])) {
	                if (global.itemCount[i, j] > 1) {
	                    global.itemCount[i, j] -= argument[1]
					
						if (global.itemCount[i, j] <= 0)
							delete_item(i, j)
					
					#region END TRUE
	                    instance_destroy(ai_instanceOfItem)
						save_bag(global.saveNo)
	                    itembag_refresh()
						global.anticheat_ownings = recalculate_sha_ownings()
	                    return true
					#endregion
	                }
	                else {
						delete_item(i, j)
					
					#region END TRUE
	                    instance_destroy(ai_instanceOfItem)
						save_bag(global.saveNo)
						global.anticheat_ownings = recalculate_sha_ownings()
	                    return true
					#endregion
	                }
	            }

#region END FALSE
	instance_destroy(ai_instanceOfItem)
	save_bag(global.saveNo)
	global.anticheat_ownings = recalculate_sha_ownings()
	return false
#endregion


}
