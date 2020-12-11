/// @param object
/// @param materialUpgrade*
/// @param count*
function item_exists() {

	var materialUpgrade = -1
	var count = -1
	if (argument_count > 1)
		materialUpgrade = argument[1]
	if (argument_count > 2)
		count = argument[2]

	for (var i = 0; i < global.bagBoxCount_horizontal*global.bagMaxPage; i++)
		for (var j = 0; j < global.bagBoxCount_vertical+5*(i == 0); j++)
	        if (global.item[i, j] != -1 and (count == -1 or global.itemCount[i, j] >= count) and global.item[i, j] == argument[0] and (materialUpgrade == -1 or global.item[i, j] != objUpgradeMaterial or global.itemUpgrade[i, j] == materialUpgrade))
				return true
                
	return false


}
