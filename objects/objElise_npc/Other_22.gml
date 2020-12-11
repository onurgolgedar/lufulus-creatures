if (isQuestion(1)) {
	if (isButton(0)) {
		// Asks for the first available quest
		if (ds_list_size(availableQuests) > 0) {
			var quest = ds_list_find_value(availableQuests, 0)
			var questDialogue = dialogue_progress_quest(quest, 1, id)
			
			if (questDialogue == pointer_null) {
				ask_npc(ds_list_find_value(availableQuests_desc, 0), 2,
				"Accept", "Cancel")
			}
		}
	}
}
else if (isQuestion(2)) {
	if (isButton(0)) {
		// Adds the first available quest
		add_quest(ds_list_find_value(availableQuests, 0))
		
		ds_list_delete(availableQuests, 0)
		ds_list_delete(availableQuests_desc, 0)
		event_perform(ev_other, ev_user1)
	}
}

#region FIXED FOR QUEST
if (ds_list_size(availableQuests) > 0) {
	if (is_qKey_dialogueEnd(qKey) and is_qKey_fromQuestDialogue(qKey)) {
		/*if (isButton(0))*/ {
			ask_npc(ds_list_find_value(availableQuests_desc, 0), 2,
			"Accept", "Cancel")
		}
	}
}
#endregion