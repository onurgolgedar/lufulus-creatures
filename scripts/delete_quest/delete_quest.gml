/// @param questNo
function delete_quest() {

	if (argument[0] != -1) {
		if (global.quest[argument[0]] != -1) {
			var qInstance = instance_create(0, 0, global.quest[argument[0]])
			if (qInstance.challenge != pointer_null)
				delete_quest(get_quest_number(qInstance.challenge))
			instance_destroy(qInstance)
		}
	
		global.quest[argument[0]] = -1
		global.questScore[argument[0]] = -1
		global.questMaxScore[argument[0]] = -1

		for (var i = argument[0]+1; i < 40; i++) {		
			global.quest[i-1] = global.quest[i]
			global.questScore[i-1] = global.questScore[i]
			global.questMaxScore[i-1] = global.questMaxScore[i]
		
			global.quest[i] = -1
			global.questScore[i] = -1
			global.questMaxScore[i] = -1
		}

		with (parNPC)
			if (quests != false)
				event_perform(ev_other, ev_user1)
	
		with (objAdam_npc)
			if (tag == (eng() ? "Challenger" : "Söz Muhafızı"))
				event_user(14)
		
		save_quests(global.saveNo)
	
		itembag_refresh()
		
		define_quest_targets()
		questtable_refresh()
	}


}
