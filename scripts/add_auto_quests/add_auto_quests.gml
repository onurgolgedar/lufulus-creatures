function add_auto_quests() {
	var added_auto = false

	if (is_quest_available(objQuest_meetSenior, false)) {
		add_quest(objQuest_meetSenior)
		added_auto = true
	}
	
	if (is_quest_available(objQuest_rival, false)) {
		add_quest(objQuest_rival)
		added_auto = true
	}
	
	if (is_quest_available(objQuest_rival2, false)) {
		add_quest(objQuest_rival2)
		added_auto = true
	}
	
	if (is_quest_available(objQuest_rival3, false)) {
		add_quest(objQuest_rival3)
		added_auto = true
	}
	
	if (is_quest_available(objQuest_rival4, false)) {
		add_quest(objQuest_rival4)
		added_auto = true
	}

	if (is_quest_available(objQuest_rival5, false)) {
		add_quest(objQuest_rival5)
		added_auto = true
	}
	
	if (is_quest_available(objQuest_rival6, false)) {
		add_quest(objQuest_rival6)
		added_auto = true
	}

	if (is_quest_available(objQuest_rival6_2, false)) {
		add_quest(objQuest_rival6_2)
		added_auto = true
	}
	
	if (is_quest_available(objQuest_rival7, false)) {
		add_quest(objQuest_rival7)
		added_auto = true
	}
	
	if (is_quest_available(objQuest_rival8, false)) {
		add_quest(objQuest_rival8)
		added_auto = true
	}
	
	if (is_quest_available(objQuest_rival9, false)) {
		add_quest(objQuest_rival9)
		added_auto = true
	}

	if (is_quest_available(objQuest_rival10, false)) {
		add_quest(objQuest_rival10)
		added_auto = true
	}

	if (is_quest_available(objQuest_item, false)) {
		add_quest(objQuest_item)
		added_auto = true
	}

	if (is_quest_available(objQuest_runes_prep, false)) {
		add_quest(objQuest_runes_prep)
		added_auto = true
	}

	if (is_quest_available(objQuest_wave, false)) {
		add_quest(objQuest_wave)
		added_auto = true
	}

	if (is_quest_available(objQuest_wisdom, false)) {
		add_quest(objQuest_wisdom)
		added_auto = true
	}

	return added_auto


}
