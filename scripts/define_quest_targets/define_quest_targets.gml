function define_quest_targets() {
	add_auto_quests()

	if (!contMain.isRoomOut) {
		ds_list_destroy(global.questTargetObjects)
		global.questTargetObjects = ds_list_create()
		global.activeQuestCount = 0

		ds_list_clear(contGUI.yellowDirectionArrows)

		for (var i = 0; i < 40; i++) {
			if (global.quest[i] != -1) {
				var que = instance_create(-50, -50, global.quest[i])
				with (que) {
					if (targetObject != pointer_null and global.questScore[i] != global.questMaxScore[i])
						ds_list_add(global.questTargetObjects, targetObject)
				}
				instance_destroy(que)
		
				global.activeQuestCount++
			}
		}
	}

	with (parTarget)
		test_quest_target()


}
