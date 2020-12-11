/// @param value
function change_exp() {

	var givenExp = calculate_givenexperience(argument[0])
	var showBar = givenExp/global.targetExperience > 0.0033

	if (global.previousExperience != global.experience)
		global.previousExperience = global.experience

	if (global.experience+givenExp < 0)
		global.experience = 0
	else if (global.experience+givenExp < global.targetExperience)
		global.experience += givenExp
	else if (global.level < LEVEL_MAX) {
		global.experience += givenExp
		global.experience -= global.targetExperience
		global.level += 1
	
		global.statPoints += 3
		global.virtual_stat_points += 3
	
		if (global.level > 9)
			global.skillPoints += 1
	
		global.anticheat_skillPoints = recalculate_sha_skillPoints()
		global.anticheat_stats = recalculate_sha_stats()
	
	#region ADDITIONAL
		if (!global.isCheated) {
			if (global.level >= 10 and !steam_get_achievement("reach_level10"))
				steam_set_achievement("reach_level10")
			if (global.level >= 20 and !steam_get_achievement("reach_level20"))
				steam_set_achievement("reach_level20")
			if (global.level >= 30 and !steam_get_achievement("reach_level30"))
				steam_set_achievement("reach_level30")
			if (global.level >= 40 and !steam_get_achievement("reach_level40"))
				steam_set_achievement("reach_level40")
		}
		fm_update_all()
		
		with(objPlayer)
			add_effectbox(efboxLevelBonus)
		
		if (!instance_exists(objLevelUpEffect)) {
			audio_play_sound(sndLevelUp, 1, 0)
			instance_create_layer(objPlayer.x, objPlayer.y, "lyAbovePlayer", objLevelUpEffect)
			burst_light(objPlayer, sec*2, 1, 2.5)
		}
	
		for (var i = 0; i < 40; i++) {
			if (global.quest[i] != -1) {
				var qInstance = instance_create(0, 0, global.quest[i])
			
				if (qInstance.isChallenge and (global.level > qInstance.maxLevel_challenge or global.level < qInstance.minLevel_challenge)) {
					delete_quest(i)
					i--
				}
				
				instance_destroy(qInstance)
			}
		}
	
		var availableQuestsCount_before = global.availableQuestsCount
	
		npc_define_quests()
		add_auto_quests()
	
		global.availableQuestsCount = 0
		var ds_size = ds_list_size(global.allQuests)
		for (var i = 0; i < ds_size; i++) {
			var q = ds_list_find_value(global.allQuests, i)
		
			if (is_quest_available(q, false)) {
				var qInstance = instance_create(0, 0, q)
			
				if (!qInstance.isSimpleQuest and !qInstance.isPrepQuest)
					global.availableQuestsCount++
				
				instance_destroy(qInstance)
			}
		}
	
		if (availableQuestsCount_before < global.availableQuestsCount) {
			var text
		
			text[0] = eng() ? "Quest offers are shown on the map(M)." : "Görev teklifleri harita(M) üzerinde görünür."
			text[1] = eng() ? ("New: [c="+string(c_nicered)+"]Quest Offer[/c]"): ("Yeni: [c="+string(c_nicered)+"]Görev Teklifi[/c]")
	
			show_messagebox(display_get_gui_width()-555+!IS_MOBILE*30, 370+!IS_MOBILE*40, text[0], text[1], 5*sec)
		}
	#endregion
	
	#region NOTIFICATION
		contGUI.hlCLogoColor = c_lime
		contGUI.hlCDis = 80
		contGUI.hlSLogoColor = c_lime
		contGUI.hlSDis = 80
		contGUI.alarm[2] = 1
	#endregion
	
		global.targetExperience = calculate_level_exp(global.level)
		global.previousExperience = 0
	
		if (global.level > 10) {
			global.levels_withoutDying++
		
			if (global.levels_withoutDying > 2 and !steam_get_achievement("immortal"))
				steam_set_achievement("immortal")
			
			if (global.levels_withoutDying > 0 and global.levels_withoutDying mod 2 == 0) {
				global.levels_withoutDying_rewardCount++
			
				global.statPoints += 1
				global.virtual_stat_points += 1
				global.skillPoints += 1
	
				global.anticheat_skillPoints = recalculate_sha_skillPoints()
				global.anticheat_stats = recalculate_sha_stats()
			
				var text = eng() ? ("WP!\nYou have completed 2 levels without death effect.\n\nYou gain [c="+string(c_orange)+"]1 stat point.[/c]\nYou gain [c="+string(c_orange)+"]1 skill point.[/c]") : ("Tebrikler!\nHiç ölüm etkisinde kalmadan 2 seviye atladın.\n\n[c="+string(c_orange)+"]1 gelişim puanı[/c] kazandın.\n[c="+string(c_orange)+"]1 beceri puanı[/c] kazandın.")
				/*draw_set_font(fontMessageTitle)
					var text_pure = draw_text_colortags(0, 0, text)
					var text_width = string_width(text_pure)
				draw_set_default()*/
				show_messagebox(display_get_gui_width()-460, 431, text, eng() ? "Bonus: Well Played" : "Bonus: İyi Oynandı")
			}
		
			save_dyings(global.saveNo)
		}
	
		with (objAdam_npc)
			if (tag == (eng() ? "Challenger" : "Söz Muhafızı"))
				event_user(14)
	
		if (global.level == LEVEL_MAX)
			global.experience = global.targetExperience
	
		if (global.experience > global.targetExperience)
			change_exp(0)
		else
			update_character()
	}
	else {
		global.experience = global.targetExperience
		showBar = false
	}

	with (contPlayer)
		saveLevel_needed = true

#region SHOW EXP BAR
	if (showBar) {
		with (contGUI) {
			expBarAlpha = 1
			delta_alarm(1, 1)
		}
	}
#endregion


}
