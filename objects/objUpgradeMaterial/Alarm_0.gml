if (upgrade == 2 and quest_exists(objQuest_blacksmith2)) {
	#region FOR QUEST
	isForQuest = objQuest_blacksmith2
	isDeletable = is_quest_finished(isForQuest)
	#endregion
}