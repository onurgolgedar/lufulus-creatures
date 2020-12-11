/// @param item
function is_item_upgradabletype() {

	return argument[0].type == type_sweapon or
	argument[0].type == type_necklace or
	argument[0].type == type_clothes or
	(argument[0].type == type_mweapon and argument[0].object_index != objTorch)


}
