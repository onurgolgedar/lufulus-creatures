/// @param quest
function add_quest() {

	for (var i = 0; i < 40; i++) {
		var addedQuest = instance_create(0, 0, argument[0])
		var addedQuest_isSimple = addedQuest.isSimpleQuest
		var addedQuest_isPrep = addedQuest.isPrepQuest
		var addedQuest_isChallenge = addedQuest.isChallenge
		var addedQuest_isNormal = !addedQuest_isPrep and !addedQuest_isSimple and !addedQuest_isChallenge
		instance_destroy(addedQuest)
	
		if (global.quest[i] != -1) {
			var quest_ins = instance_create(0, 0, global.quest[i])
			var quest_isSimple = quest_ins.isSimpleQuest
			var quest_isPrep = quest_ins.isPrepQuest
			var quest_isChallenge = quest_ins.isChallenge
			var quest_isNormal = !quest_isPrep and !quest_isSimple and !quest_isChallenge
			instance_destroy(quest_ins)
		}
	
		var sameCategory = global.quest[i] != -1 and ((quest_isSimple and addedQuest_isSimple) or (quest_isPrep and addedQuest_isPrep) or (quest_isChallenge and addedQuest_isChallenge) or (quest_isNormal and addedQuest_isNormal))
		var higherCategory = addedQuest_isNormal or global.quest[i] != -1 and ((quest_isSimple and addedQuest_isPrep) or (quest_isSimple and addedQuest_isChallenge) or (quest_isPrep and addedQuest_isChallenge))
	
		if (global.quest[i] == -1 or sameCategory or higherCategory) {
			// Slide Quests
			if (global.quest[i] != -1) {
				for (var j = 38; j >= i; j--) {
					if (global.quest[j] != -1) {
						global.quest[j+1] = global.quest[j]
						global.questScore[j+1] = global.questScore[j]
						global.questMaxScore[j+1] = global.questMaxScore[j]
		
						global.quest[j] = -1
						global.questScore[j] = -1
						global.questMaxScore[j] = -1
					}
				}
			}
		
			var aq_quest = instance_create(-50, -50, argument[0])
			global.quest[i] = argument[0]
			global.questScore[i] = 0
			global.questMaxScore[i] = aq_quest.maxScore
			instance_destroy(aq_quest)
		
			if (argument[0] == objQuest_mineralCave)
				fm_add(15, true)
	
			if (!contMain.isRoomOut) {
			#region NOTIFICATION
				contGUI.hlQLogoColor = c_yellow
				contGUI.hlQDis = 80
				contGUI.alarm[2] = 1
		
				audio_play_sound(sndNewQuest, 1, 0)
			#endregion
			
				questtable_refresh()
				define_quest_targets()
		
			#region FMs
				fm_update_activation(2)
				fm_update_activation(5)
			#endregion
			}
		
			save_quests(global.saveNo)
		
			itembag_refresh()
		
			// ? New
			for (var i = 0; i < global.bagBoxCount_horizontal*global.bagMaxPage; i++) {
				for (var j = 0; j < global.bagBoxCount_vertical+5*(i == 0); j++) {
					if (global.item[i, j] != -1) {
						var possibleQuestItem = instance_create(-50, -50, global.item[i, j])
					
						if (possibleQuestItem.isForQuest == argument[0] and possibleQuestItem.isForQuest_directMode)
							quest_progress(argument[0], global.itemCount[i, j])
						
						instance_destroy(possibleQuestItem)
					}
				}
			}
		
		#region Finish Preparation Quests
			if (argument[0] == objQuest_meetSenior)
				quest_progress(objQuest_meetSenior_prep, 1)
			else if (argument[0] == objQuest_mineralCave)
				quest_progress(objQuest_mineralCave_prep, 1)
		#endregion
		
			if (!addedQuest_isChallenge or !instance_exists(objTradeWindow)) {
				with (objAdam_npc)
					if (tag == (eng() ? "Challenger" : "Söz Muhafızı"))
						event_user(14)
			}
		
			return true
		}
	}
	
	return false


}
