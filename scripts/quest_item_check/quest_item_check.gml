/// @param quest
function quest_item_check() {

	if (argument[0].isForQuest != false and argument[0].isForQuest_directMode) {
		quest_progress(argument[0].isForQuest, 1)
	
		if (argument[0].isForQuest == objQuest_mineralCave) {
			if (quest_exists(objChallenge_bloodyRolf) and test_effectbox(efboxDeath, objPlayer.id))
				quest_progress(objChallenge_bloodyRolf, 1000)
		}
	}

	if (argument[0].object_index == objBloodMineral_second and !is_quest_finished(objQuest_bloodMineral) and !quest_exists(objQuest_bloodMineral)) {
		add_quest(objQuest_bloodMineral)
	
		with (parAi) {
			if (hasDropList) {
				var foundIndex = ds_list_find_index(droppedList, objBloodMineral_second)
				if (foundIndex != -1) {
					ds_list_delete(droppedList, foundIndex)
					ds_list_delete(droppedUpgradeList, foundIndex)
					ds_list_delete(droppedCountList, foundIndex)
		
					ds_list_delete(droppedExtension0List, foundIndex)
					ds_list_delete(droppedExtension1List, foundIndex)
				}
			}
		}
	}


}
