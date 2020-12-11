/// @param quest (exits if it's not a challenge)
/// @param isDirect (overrides first parameter)
function check_finished_challenges() {

	var isDirect = false
	if (argument_count > 1)
		isDirect = argument[1]

	var finishedQuest = -1
	var finishedChallenges_count = 0
	var finishedQuest_instance = pointer_null

	if (!isDirect) {
		finishedQuest = argument[0]
		finishedQuest_instance = instance_create(0, 0, finishedQuest)
	}

	if (isDirect or finishedQuest_instance.isChallenge) {
		var ds_size = ds_list_size(global.questsFinished)
		for (var i = 0; i < ds_size; i++) {
			var quest_instance = instance_create(0, 0, ds_list_find_value(global.questsFinished, i))
			if (quest_instance.isChallenge)
				finishedChallenges_count++
			instance_destroy(quest_instance)
		}
	
		if (finishedQuest_instance != pointer_null)
			instance_destroy(finishedQuest_instance)
	}

	if (finishedChallenges_count > 2)
		if (!global.isCheated and !steam_get_achievement("challenger"))
			steam_set_achievement("challenger")
		
	return finishedChallenges_count


}
