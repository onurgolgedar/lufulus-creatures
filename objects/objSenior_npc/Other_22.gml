var statPrice = global.level > 19 ? floor(150+power(global.level, 1.7)*4.5) : 0
var skillPrice = global.level > 19 ? floor(280+power(global.level, 1.75)*5) : 0

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
		ask_npc(eng() ? "What do you want to change?" : "Ne değiştirmek istiyorsun?", 5, eng() ? "[RESET STATS]" : "[GELİŞİM SIFIRLA]", eng() ? "[RESET SKILLS]" : "[BECERİ SIFIRLA]", "Cancel")
	}
}
else if (isQuestion(2)) {
	if (isButton(0)) {
		// Adds the first available quest
		add_quest(ds_list_find_value(availableQuests, 0))
		
		ds_list_delete(availableQuests, 0)
		ds_list_delete(availableQuests_desc, 0)
		event_perform(ev_other, ev_user1)
	}
}
else if (isQuestion(3)) {
	if (isButton(0)) {
		if (global.money >= statPrice) {
			show_messagebox(200, 200, eng() ? "Stats have been reseted." : "Gelişim puanları sıfırlandı.", eng() ? "Stats": "Gelişim Puanları", sec)
		
			global.statPoints += global.givenStr+global.givenDex+global.givenMp+global.givenSta+global.givenVit
			global.virtual_stat_points = global.statPoints
			
			global.givenStr = 0
			global.givenDex = 0
			global.givenVit = 0
			global.givenMp = 0
			global.givenSta = 0
			
			global.virtual_str = 0
			global.virtual_dex = 0
			global.virtual_vit = 0
			global.virtual_mp = 0
			global.virtual_sta = 0
		
			change_money(-statPrice, true)
		
			update_character()
			
			if (ds_list_find_index(global.takenTutorials, 25) == -1)
				ds_list_add(global.takenTutorials, 25)
			
			save_general(global.saveNo)
			
			global.anticheat_stats = recalculate_sha_stats()
		}
		else
			show_messagebox(600, 90, eng() ? "You have not enough money." : "Yeterince altının yok.", eng() ? "Operation Failed" : "İşlem Gerçekleştirilemedi", sec)
	}
}
else if (isQuestion(4)) {
	if (isButton(0)) {
		if (global.money >= skillPrice) {
			show_messagebox(200, 200, eng() ? "Skills have been reseted." : "Beceriler sıfırlandı.", eng() ? "Skills": "Beceriler", sec)
			
			for (var i = 0; i < 4; i++) {
				global.selectedSkill[i] = -1
				global.selectedSkillRem[i] = -1
				global.selectedSkillMaxRem[i] = -1
				global.selectedSkillMana[i] = -1
			}
			
			for (var i = 0; i < 20; i++)
			    for (var j = 0; j < 6; j++)
			        global.skillUpgrade[i, j] = 0
					
			with (objSkillTable)
				localbag_refresh()
		
			global.skillPoints += global.givenSkillPoints
			global.givenSkillPoints = 0
		
			with (contPlayer)
				event_perform(ev_other, ev_user1)
				
			change_money(-skillPrice, true)
			
			if (ds_list_find_index(global.takenTutorials, 25) == -1)
				ds_list_add(global.takenTutorials, 25)
				
			save_general(global.saveNo)
			
			global.anticheat_skillPoints = recalculate_sha_skillPoints()
		}
		else
			show_messagebox(600, 90, eng() ? "You have not enough money." : "Yeterince altının yok.", eng() ? "Operation Failed" : "İşlem Gerçekleştirilemedi", sec)
	}
}
else if (isQuestion(5)) {
	if (isButton(0)) {
		ask_npc(eng() ? ("You can reset your stats.\n[c="+string(c_gold)+"]Price: "+string(statPrice)+" gold[/c]")
		: ("Gelişim puanlarını sıfırlayabilirsin.\n[c="+string(c_gold)+"]Ücret: "+string(statPrice)+" altın[/c]"), 3,
		eng() ? "[RESET]" : "[SIFIRLA]", "Cancel")
	}
	else if (isButton(1)) {
		ask_npc(eng() ? ("You can reset your skills.\n[c="+string(c_gold)+"]Price: "+string(skillPrice)+" gold[/c]")
		: ("Becerilerini sıfırlayabilirsin.\n[c="+string(c_gold)+"]Ücret: "+string(skillPrice)+" altın[/c]"), 4,
		eng() ? "[RESET]" : "[SIFIRLA]", "Cancel")
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