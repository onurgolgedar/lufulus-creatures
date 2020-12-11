if (isQuestion(1)) {
	if (isButton(0)) {
		// Asks for the first available quest
		if (ds_list_size(availableQuests) > 0) {
			var quest = ds_list_find_value(availableQuests, 0)
			var questDialogue = dialogue_progress_quest(quest, 1, id)
			
			if (questDialogue == pointer_null) {
				ask_npc(ds_list_find_value(availableQuests_desc, 0), 2,
				"Accept", "Cancel")
			}
		}
	}
	else if (isButton(1)) {
		if (test_title(title_lordstrust)) {
			quest_progress(objQuest_bloodMineral_2, 1)
			//show_messagebox(200, 200, eng() ? "Note: There are other quests available." : "Not: Başka görevler mevcut.", eng() ? "[UNDER DEVELOPMENT]" : "[YAPIM AŞAMASINDA]", 2*sec)
			dialogue_progress_quest(objQuest_rebelWar, 1, id)
		}
		else {
			show_messagebox(200, 200, eng() ? ("Why should I trust you?\n\n[c="+string(c_aqua)+"]You need to complete the\nquest(Trust Problems).[/c]") : ("Sana neden güveneyim?\n\n[c="+string(c_aqua)+"]Güven Problemleri adlı görevi tamamla.[/c]"), eng() ? "Trust Problems" : "Güven Problemleri", sec*4)
		
			if (!quest_exists(objQuest_trustProblems))
				add_quest(objQuest_trustProblems)
		}
	}
	else if (isButton(2)) {
		var dialogueBox = ask_npc(eng() ? "These are my eligible soldiers.\nYou can set free the warrior you have\npurchased at any time.\n\n[c="+string(c_customred_compare)+"]You can recruit at most [c="+string(c_aqua)+"]"+string(ds_list_size(global.titles))+"[c="+string(c_customred_compare)+"] warriors.\n[c="+string(c_aqua)+"]Each new title you have increases your\nmaximum party size.[/c]" : "Uygun durumdaki askerlerim bunlar.\nSatın aldığın savaşçıyı istediğinde serbest\nbırakabilirsin.\n\n[c="+string(c_customred_compare)+"]Aynı anda en fazla [c="+string(c_aqua)+"]"+string(ds_list_size(global.titles))+"[c="+string(c_customred_compare)+"] kiralik savaşçı tutabilirsin.\n[c="+string(c_aqua)+"]Sahip olduğun her ünvan parti kapasiteni\n1 artırır.[/c]", 3
		, eng() ? "Level 3 Warrior\nPrice: [c="+string(c_gold)+"]"+string(warrior1_price)+" gold[/c]\nDaily Expense: [c="+string(c_gold)+"]"+string(warrior1_expense)+" gold[/c]" : "Seviye 3 Savaşçı\nÜcret: [c="+string(c_gold)+"]"+string(warrior1_price)+" altın[/c]\nGünlük Gider: [c="+string(c_gold)+"]"+string(warrior1_expense)+" altın[/c]"
		, eng() ? "Level 6 Warrior\nPrice: [c="+string(c_gold)+"]"+string(warrior2_price)+" gold[/c]\nDaily Expense: [c="+string(c_gold)+"]"+string(warrior2_expense)+" gold[/c]" : "Seviye 6 Savaşçı\nÜcret: [c="+string(c_gold)+"]"+string(warrior2_price)+" altın[/c]\nGünlük Gider: [c="+string(c_gold)+"]"+string(warrior2_expense)+" altın[/c]"
		, "Cancel")
		dialogueBox.buttonWidth += 40
	}
}
else if (isQuestion(2)) {
	if (isButton(0)) {
		// Adds the first available quest
		var _questObject = ds_list_find_value(availableQuests, 0)
		var _quest = add_quest(_questObject)
		
		#region ADDITIONAL
		if (_questObject == objQuest_theyAreRight) {
			quest_progress(objQuest_lordBusy_prep, 1)
			change_money(10000, true)
		}
		#endregion
		
		ds_list_delete(availableQuests, 0)
		ds_list_delete(availableQuests_desc, 0)
		event_perform(ev_other, ev_user1)
	}
}
else if (isQuestion(3)) {
	if (isButton(0)) {
		var dialogueBox = ask_npc(eng() ? "Level 3 Warrior\nPrice: [c="+string(c_gold)+"]"+string(warrior1_price)+" gold[/c]\nDaily Expense: [c="+string(c_gold)+"]"+string(warrior1_expense)+" gold[/c]" : "Seviye 3 Savaşçı\nÜcret: [c="+string(c_gold)+"]"+string(warrior1_price)+" altın[/c]\nGünlük Gider: [c="+string(c_gold)+"]"+string(warrior1_expense)+" altın[/c]", 4
		, eng() ? "Recruit" : "Kirala"
		, "Cancel")
	}
	
	if (isButton(1)) {
		var dialogueBox = ask_npc(eng() ? "Level 6 Warrior\nPrice: [c="+string(c_gold)+"]"+string(warrior2_price)+" gold[/c]\nDaily Expense: [c="+string(c_gold)+"]"+string(warrior2_expense)+" gold[/c]" : "Seviye 6 Savaşçı\nÜcret: [c="+string(c_gold)+"]"+string(warrior2_price)+" altın[/c]\nGünlük Gider: [c="+string(c_gold)+"]"+string(warrior2_expense)+" altın[/c]", 5
		, eng() ? "Recruit" : "Kirala"
		, "Cancel")
	}
}
else if (isQuestion(4)) {
	if (isButton(0)) {
		if (global.money >= warrior1_price) {
			change_money(-warrior1_price, true)
				
			add_item(objLowRecruit_001)
		}
		else
			show_messagebox(600, 90, eng() ? "You have not enough money." : "Yeterince altının yok.", eng() ? "Operation Failed" : "İşlem Gerçekleştirilemedi", sec)
	}
}
else if (isQuestion(5)) {
	if (isButton(0)) {
		if (global.money >= warrior2_price) {
			change_money(-warrior2_price, true)
				
			add_item(objLowRecruit_002)
		}
		else
			show_messagebox(600, 90, eng() ? "You have not enough money." : "Yeterince altının yok.", eng() ? "Operation Failed" : "İşlem Gerçekleştirilemedi", sec)
	}
}

#region FIXED FOR QUEST
if (ds_list_size(availableQuests) > 0) {
	if (is_qKey_dialogueEnd(qKey) and is_qKey_fromQuestDialogue(qKey)) {
		/*if (isButton(0))*/ {
			ask_npc(ds_list_find_value(availableQuests_desc, 0), 2,
			"Accept", "Cancel")
		}
	}
}
#endregion