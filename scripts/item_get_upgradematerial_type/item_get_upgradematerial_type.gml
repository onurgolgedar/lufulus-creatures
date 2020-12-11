/// @param itemDropLevel
/// @param itemSpecialty
function item_get_upgradematerial_type() {

	return min((argument[0] div 7)+(argument[1] >= ITEM_UNIQUE_SPECIALTY), 4)


}
