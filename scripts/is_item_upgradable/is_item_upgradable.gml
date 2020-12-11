/// @param item
function is_item_upgradable() {

	return is_item_upgradabletype(argument[0])
	and argument[0].upgrade == round(argument[0].upgrade)
	and argument[0].upgrade < 11


}
