/// @param questNo
/// @param value
/// @param isSet*
function change_quest_score() {

	var isSet = false
	if (argument_count > 2)
		isSet = argument[2]

	if (global.questScore[argument[0]] < global.questMaxScore[argument[0]]) {
		if(isSet)
			global.questScore[argument[0]] = argument[1]
		else
			global.questScore[argument[0]] += argument[1]
		
		var questObject = global.quest[argument[0]]

	#region COMPELETED
		if (global.questScore[argument[0]] >= global.questMaxScore[argument[0]] or global.questScore[argument[0]] <= -333 or global.questScore[argument[0]] >= 333) {
			var isFailure = global.questScore[argument[0]] <= -333
			var finishedQuest = global.quest[argument[0]]
		
			global.questScore[argument[0]] = global.questMaxScore[argument[0]]
	
			if (!contMain.isRoomOut) {
			#region NOTIFICATION
				contGUI.hlQLogoColor = isFailure ? c_red : c_lime
				contGUI.hlQDis = 80
				contGUI.alarm[2] = 1
			#endregion
			}
	
		#region FM ADDITIONS
			if (finishedQuest == objQuestRoad_scout)
				fm_add(7, true)
			else if (finishedQuest == objQuestRoad_scout2) {
				fm_add(8, true)
				fm_add(4)
			}
		#endregion
			fm_update_all()
			
			if (!isFailure) {
				if (finishedQuest == objQuest_meetElise) {
					global.selectedSkill[4] = objMainBS
					save_skills(global.saveNo)
	
					with (objSkillTable)
						close_table()
				}
				else if (finishedQuest == objQuest_mineralCave)
					show_messagebox(400, 300, eng() ? "You've found the blood mineral!" : "Kan Mineralini buldun!", eng() ? "Blood Mineral" : "Kan Minerali", sec*2)
				else if (finishedQuest == objQuest_blacksmith)
					show_messagebox(400, 300, eng() ? ("You've found "+npc_goore+"'s sword!") : (npc_goore+"'un kılıcını buldun!"), eng() ? (npc_goore+"'s Sword") : (npc_goore+"'un Kılıcı"), sec*2)
				
				var finishedQuest_inst = instance_create(0, 0, finishedQuest)
				if (!finishedQuest_inst.isPrepQuest)
					audio_play_sound(sndQuestCompleted, 1, 0)
				instance_destroy(finishedQuest_inst)		
			}
			
		#region CHALLENGE INTERACTIONS
			if (finishedQuest == objQuest_mineralCave) {
				var qNumber_bloodyRolf = get_quest_number(objChallenge_bloodyRolf)
				if (quest_exists(objChallenge_bloodyRolf))
					change_quest_score(qNumber_bloodyRolf, !global.defenseLock ? 999 : -999)
			}
			else if (finishedQuest == objQuest_rebelWar) {
				if (quest_exists(objChallenge_rebelWar))
					change_quest_score(get_quest_number(objChallenge_rebelWar), 999)
			}
			else if (finishedQuest == objQuest_rebelWar2) {
				if (quest_exists(objChallenge_rebelWar2))
					change_quest_score(get_quest_number(objChallenge_rebelWar2), 999)
			}
			else if (finishedQuest == objQuest_firstFight) {
				if (quest_exists(objChallenge_firstFight))
					change_quest_score(get_quest_number(objChallenge_firstFight), 999)
			}
		#endregion
	
		#region AUTO FINISH
			var cq_quest = instance_create(-50, -50, questObject)
			with (cq_quest) {
				if (isFailure)
					id.isFailure = true
					
				if (autoFinish)
					event_perform(ev_other, ev_user2)
			}
			instance_destroy(cq_quest)
		#endregion
		
			check_finished_challenges(finishedQuest)
		
			npc_define_quests()
			define_quest_targets()
		}
	#endregion
	
		save_quests(global.saveNo)

		questtable_refresh()
	}


}
