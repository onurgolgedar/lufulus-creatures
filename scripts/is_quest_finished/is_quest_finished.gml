/// @param quest_object
function is_quest_finished() {

	return ds_list_find_index(global.questsFinished, argument[0]) != -1


}
