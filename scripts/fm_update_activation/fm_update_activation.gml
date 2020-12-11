/// @param fMNo
function fm_update_activation() {

	var __obligation = false

	if (argument[0] == 0)
		__obligation = has_active_sweapon()
	else if (argument[0] == 2)
		__obligation = quest_exists(objQuestRoad_scout2) or is_quest_finished(objQuestRoad_scout2)
	else if (argument[0] == 4)
		__obligation = global.level >= 3
	else if (argument[0] == 5)
		__obligation = is_quest_finished(objQuest_meetSenior)
	else if (argument[0] == 10)
		__obligation = is_quest_finished(objQuest_blacksmith2)

	if (__obligation)
		fm_activate(argument[0])


}
