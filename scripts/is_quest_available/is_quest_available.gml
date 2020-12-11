/// @param quest
/// @param repeatable
function is_quest_available() {

#region SET OBLIGATIONS
#region ROAD 1
	if (argument[0] == objQuestRoad_scout)
			var obligations = true
#endregion
#region ROAD 2
	else if (argument[0] == objQuestRoad_scout2)
			var obligations = is_quest_finished(objQuestRoad_scout)
#endregion
#region QUEST Broccoli
	else if (argument[0] == objQuest_broccoli)
			var obligations = false
#endregion
#region QUEST Meet Senior
	else if (argument[0] == objQuest_meetSenior)
			var obligations = is_quest_finished(objQuestRoad_scout2) and global.level >= 3
#endregion
#region QUEST Item
	else if (argument[0] == objQuest_item)
			var obligations = global.level >= 4
#endregion
#region QUEST Runes
	else if (argument[0] == objQuest_runes_prep)
			var obligations = global.level >= 16
#endregion
#region QUEST Blacksmith
	else if (argument[0] == objQuest_blacksmith)
			var obligations = global.level >= 5
#endregion
#region QUEST Blacksmith 2
	else if (argument[0] == objQuest_blacksmith2)
			var obligations = is_quest_finished(objQuest_blacksmith)
#endregion
#region QUEST Mineral Cave
	else if (argument[0] == objQuest_mineralCave)
			var obligations = is_quest_finished(objQuest_meetSenior) and global.level >= 7
#endregion
#region QUEST Lord Loves
	else if (argument[0] == objQuest_lordLoves)
			var obligations = false // need to complete the mineral cave quest
#endregion
#region QUEST Blood Mineral
	else if (argument[0] == objQuest_bloodMineral)
			var obligations = false // need to find the blood mineral outside
#endregion
#region QUEST Blood Mineral 2
	else if (argument[0] == objQuest_bloodMineral_2)
			var obligations = is_quest_finished(objQuest_bloodMineral) and global.level >= 10
#endregion
#region QUEST First Fight
	else if (argument[0] == objQuest_firstFight)
			var obligations = is_quest_finished(objQuest_lordLoves) and global.level >= 14
#endregion
#region QUEST Cunning
	else if (argument[0] == objQuest_cunning)
			var obligations = global.level >= 14
#endregion
#region QUEST Trust Problems
	else if (argument[0] == objQuest_trustProblems)
			var obligations = false // after asking the lord about the blood mineral
#endregion
#region QUEST Meet Elise (Skills)
	else if (argument[0] == objQuest_meetElise)
			var obligations = quest_exists(objQuest_trustProblems) and global.level > 11
#endregion
#region QUEST Rebel War
	else if (argument[0] == objQuest_rebelWar)
			var obligations = is_quest_finished(objQuest_bloodMineral_2)
#endregion
#region QUEST Rebel War 2
	else if (argument[0] == objQuest_rebelWar2)
			var obligations = is_quest_finished(objQuest_rebelWar) and is_quest_finished(objQuest_firstFight) and global.level >= 17
#endregion
#region QUEST Wave
	else if (argument[0] == objQuest_wave)
			var obligations = global.level >= 9
#endregion
#region QUEST Wisdom
	else if (argument[0] == objQuest_wisdom)
			var obligations = global.level >= 10
#endregion
#region QUEST They Are Right
	else if (argument[0] == objQuest_theyAreRight)
			var obligations = global.level >= 19
#endregion

#region QUEST Rival
	else if (argument[0] == objQuest_rival)
			var obligations = global.level >= 2
#endregion
#region QUEST Rival 2
	else if (argument[0] == objQuest_rival2)
			var obligations = global.level >= 6
#endregion
#region QUEST Rival 3
	else if (argument[0] == objQuest_rival3)
			var obligations = global.level >= 10
#endregion
#region QUEST Rival 4
	else if (argument[0] == objQuest_rival4)
			var obligations = global.level >= 12
#endregion
#region QUEST Rival 5
	else if (argument[0] == objQuest_rival5)
			var obligations = global.level >= 14
#endregion
#region QUEST Rival 6
	else if (argument[0] == objQuest_rival6)
			var obligations = global.level >= 16
#endregion
#region QUEST Rival 6_2
	else if (argument[0] == objQuest_rival6_2)
			var obligations = global.level >= 17
#endregion
#region QUEST Rival 7
	else if (argument[0] == objQuest_rival7)
			var obligations = global.level >= 18
#endregion
#region QUEST Rival 8
	else if (argument[0] == objQuest_rival8)
			var obligations = global.level >= 19
#endregion
#region QUEST Rival 9
	else if (argument[0] == objQuest_rival9)
			var obligations = global.level >= 20
#endregion
#region QUEST Rival 10
	else if (argument[0] == objQuest_rival10)
			var obligations = global.level >= 22
#endregion
#endregion

	var available = !quest_exists(argument[0])
					and ds_list_find_index(global.allQuests, argument[0]) != -1
					and (argument[1] or ds_list_find_index(global.questsFinished, argument[0]) == -1)
					and obligations
			
	return available


}
