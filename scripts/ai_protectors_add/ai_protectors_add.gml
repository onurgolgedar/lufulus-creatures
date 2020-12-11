/// @param id
function ai_protectors_add() {

	if (!ai_protectors_exists(argument[0]))
		ds_list_add(allies, argument[0])


}
