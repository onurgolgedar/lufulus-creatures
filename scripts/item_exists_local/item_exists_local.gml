/// @param object
/// @param materialUpgrade*
function item_exists_local() {

	var materialUpgrade = 0
	if (argument_count == 2)
		materialUpgrade = argument[1]

	for (var j = 0; j < global.tradeBoxCount_vertical; j++)
	    for (var i = 0; i < global.tradeBoxCount_horizontal*global.tradeMaxPage; i++)
	        if (item[i, j] != -1 and item[i, j] == argument[0]
			and (item[i, j] != objUpgradeMaterial or itemUpgrade[i, j] == materialUpgrade))
	            return true
                
	return false


}
