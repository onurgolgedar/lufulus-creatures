function test_quest_target() {
	isQuestTarget = ds_list_find_index(global.questTargetObjects, name) != -1
	/*if (!isQuestTarget) {
		var ds_size = ds_list_size(global.questTargetObjects)
		for (var i = 0; i < ds_size; i++) {
			if ((leader_text+ds_list_find_value(global.questTargetObjects, i)) == name) {
				isQuestTarget = true
				break
			}
		}
	}*/

	if (type == type_npc and isQuestTarget) {
		while (ds_list_find_index(contGUi.yellowDirectionArrows, id) != -1)
			ds_list_delete(contGUi.yellowDirectionArrows, ds_list_find_index(contGUi.yellowDirectionArrows, id))
		
		ds_list_add(contGUi.yellowDirectionArrows, id)
	}


}
