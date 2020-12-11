#region FIXED (FOR QUEST)
ds_list_clear(availableQuests)
ds_list_clear(availableQuests_desc)
ds_list_clear(finishedQuests)
ds_list_clear(quests)
#endregion

// Quests

#region FIXED (FOR QUEST)
// Finished Quests
var v_quest
for (var i = 0; i < ds_list_size(quests); i++) {
	v_quest = ds_list_find_value(quests, i)
	var v_questNo = get_quest_number(v_quest)
	if (quest_exists(v_quest)) 
		if (global.questScore[v_questNo] == global.questMaxScore[v_questNo])
			ds_list_add(finishedQuests, v_quest)
}

// Exc Mark
excMark = -1

while (ds_list_find_index(contGUI.redDirectionArrows, id) != -1)
	ds_list_delete(contGUI.redDirectionArrows, ds_list_find_index(contGUI.redDirectionArrows, id))
while (ds_list_find_index(contGUI.greenDirectionArrows, id) != -1)
	ds_list_delete(contGUI.greenDirectionArrows, ds_list_find_index(contGUI.greenDirectionArrows, id))

if (ds_list_size(finishedQuests) > 0) {
	excMark = 2
	ds_list_add(contGUI.greenDirectionArrows, id)
}
else {
    var ds_size = ds_list_size(quests)
	for (var i = 0; i < ds_size; i++) {
		if (quest_exists(ds_list_find_value(quests, i))) {
			var v_quest = instance_create(-50, -50, ds_list_find_value(quests, i))
			with (v_quest) {
				if (!autoFinish) {
					other.excMark = 0
					break
				}
			}
			instance_destroy(v_quest)
		}
	}
	
	if (ds_list_size(availableQuests) > 0) {
		excMark = 1
		ds_list_add(contGUI.redDirectionArrows, id)
	}
}
#endregion