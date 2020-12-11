event_inherited()

#region Click Test
if (test_upperclick_window() or test_upperclick_gui())
	exit

if (death or mode == md_attack)
	exit

if (point_distance(x, y, objPlayer.x, objPlayer.y) > NPC_CLICKDISTANCE
or collision_line(x, y, objPlayer.x, objPlayer.y, parSolid, 1, 1)) {
	instance_create_layer(x, y, "lyBelowGUI", objNPCDistanceCircle)
	show_messagebox(250, 250, eng() ? "You must be near and there\nmust be no obstacles between you." : "Yakınında olmalısın.\nAranızda engel olmamalı.", eng() ? "Not Allowed" : "İşlem Gerçekleştirilemedi", 1.5*sec)
	exit
}
#endregion

targetAngle = point_direction(x, y, objPlayer.x, objPlayer.y)

fm_activate(3)

ai_set_lastseen_point(x, y)
ai_goto_lastseen_point(1)

#region FIXED (FOR QUEST)
if (ds_list_size(finishedQuests) > 0) {
	// Finishes the top completed quest
	var quest = instance_create(-50, -50, ds_list_find_value(finishedQuests, 0))
	with (quest) {
		event_perform(ev_other, ev_user2)
		other.finishText = finishText
	}
	
	if (finishText != "")
		show_messagebox(400, 400, finishText, name+":", sec*3)
	
	ds_list_delete(finishedQuests, 0)
	
	exit
}
#endregion

// Asks for the first available quest
if (ds_list_size(availableQuests) > 0) {
	var quest = ds_list_find_value(availableQuests, 0)
	var questDialogue = dialogue_progress_quest(quest, 1, id)
			
	if (questDialogue == pointer_null) {
		ask_npc(ds_list_find_value(availableQuests_desc, 0), 1,
		"Accept", "Cancel")
	}
}