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
	else if (isButton(1)) {
		ai_set_lastseen_point(objLordDamph_npc.x+60, objLordDamph_npc.y-30)
		ai_goto_lastseen_point(1, objPlayer, eng() ? "Follow me." : "Takip et.")
	}
}
else if (isQuestion(2)) {
	if (isButton(0)) {
		var lastQuest = ds_list_find_value(availableQuests, 0)
		
		#region // ? NEW // ? DUPLICATION Code: 18
		if (lastQuest == objQuest_blacksmith2) {
			var materialsCount_bag = 0
			for (var i = 0; i < global.bagBoxCount_horizontal*global.bagMaxPage; i++) {
				for (var j = 0; j < global.bagBoxCount_vertical; j++) {
					if (global.item[i, j] == objUpgradeMaterial and global.itemUpgrade[i, j] == 2)
						materialsCount_bag += global.itemCount[i, j]
				}
			}
	
			var materialsCount_bank = 0
			for (var i = 0; i < global.bagBoxCount_horizontal*global.bagMaxPage; i++) {
				for (var j = 0; j < global.bagBoxCount_vertical; j++) {
					if (global.item_bank[i, j] == objUpgradeMaterial and global.itemUpgrade_bank[i, j] == 2)
						materialsCount_bank += global.itemCount_bank[i, j]
				}
			}
			
			fm_add(10)
			
			if (materialsCount_bag+materialsCount_bank == 0)
				dialogue_progress(2, 1, id)
		}
		#endregion
		
		// Adds the first available quest
		add_quest(lastQuest)
		
		ds_list_delete(availableQuests, 0)
		ds_list_delete(availableQuests_desc, 0)
		event_perform(ev_other, ev_user1)
	}
}

#region FIXED FOR QUEST
if (is_qKey_dialogueEnd(qKey) and is_qKey_fromQuestDialogue(qKey)) {
	/*if (isButton(0))*/ {
		ask_npc(ds_list_find_value(availableQuests_desc, 0), 2,
		"Accept", "Cancel")
	}
}
#endregion