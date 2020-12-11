/// @param object
/// @param materialUpgrade*
function item_exists_bank() {

	var materialUpgrade = 0
	if (argument_count == 2)
		materialUpgrade = argument[1]

	for (var i = 0; i < global.bagBoxCount_horizontal*global.bagMaxPage; i++)
		for (var j = 0; j < global.bagBoxCount_vertical; j++)
	        if (global.item_bank[i, j] != -1 and global.item_bank[i, j] == argument[0] and (global.item_bank[i, j] != objUpgradeMaterial or global.itemUpgrade_bank[i, j] == materialUpgrade)) {
				return true
			}
                
	return false


}
