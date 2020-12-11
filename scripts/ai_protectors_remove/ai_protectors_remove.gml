/// @param id
function ai_protectors_remove() {

	var index = ds_list_find_index(allies, argument[0])

	if (index != -1)
		ds_list_delete(allies, index)


}
