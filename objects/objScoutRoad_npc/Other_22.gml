if (isQuestion(1)) {
	if (isButton(0)) {
		// Adds the first available quest
		var _quest = ds_list_find_value(availableQuests, 0)
		
		add_quest(_quest)
	
		#region ADDITIONAL
		if (_quest == objQuestRoad_scout2)
			add_item(objTheLetter)
		
		if (_quest != objQuestRoad_scout) {
			with (objinvisibleWall)
				if (no == 3)
					instance_destroy()
				
			with (objRoomChanger)
				set_special_quest_target()
				
			fm_add(1)
			
			delta_alarm(3, sec)
		}
		else
			fm_add(0, true)
		#endregion
	
		ds_list_delete(availableQuests, 0)
		ds_list_delete(availableQuests_desc, 0)
		event_perform(ev_other, ev_user1)
		
		rigidbody_noarms_type1()
	}
}

#region FIXED FOR QUEST
if (ds_list_size(availableQuests) > 0) {
	if (is_qKey_dialogueEnd(qKey) and is_qKey_fromQuestDialogue(qKey)) {
		/*if (isButton(0))*/ {
			ask_npc(ds_list_find_value(availableQuests_desc, 0), 1,
			"Accept", "Cancel")
		}
	}
}
#endregion