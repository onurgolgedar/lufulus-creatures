/// @param quest
function delete_quest_finished() {

	var ds_size = ds_list_size(global.questsFinished)
	var index = ds_list_find_index(global.questsFinished, argument[0])

	if (index != -1) {
		ds_list_delete(global.questsFinished, index)
	
		with (parNPC) {
			if (quests != false)
				event_perform(ev_other, ev_user1)
		}
		
		save_quests(global.saveNo)
		
		define_quest_targets()
		questtable_refresh()
	}


}
