if (keyboard_check(vk_alt)) {
	with (contView)
		event_perform(ev_keypress, vk_f11)
	exit
}

with (objMessageBox)
	if (front)
		exit
	
if (global.pause or room == roomCinematic)
	exit

if (global.consoleMode) {
	#region INPUT
	var command = keyboard_string
	var value = 1
	
	var spaceIndex = string_pos(" ", command)
	if (spaceIndex != 0) {
		value = string_copy(command, spaceIndex+1, string_length(command)-spaceIndex)
		command = string_lower(string_copy(command, 1, spaceIndex-1))
		
		var negative = string_char_at(value, 0) == "-"
		if (negative)
			value = string_replace(value, "-", "")
		
		if (value != string_digits(value) or string_length(value) == 0)
			command = ""
		else
			value = real(value)*(1-2*negative)
	}
	#endregion

	if (command == "nodie" and global.cheatCodes) {
		global.isCheated = true
		
		global.immortality = value
		audio_play_sound(sndWindowTick, 0, false)
		with (objPlayer)
			slide_text(x, y, eng() ? "Executed" : "Uygulandı", c_white, true)
	}
	else if (command == "-showgui") {
		global.showGUI = value
		audio_play_sound(sndWindowTick, 0, false)
		with (objPlayer)
			slide_text(x, y, eng() ? "Executed" : "Uygulandı", c_white, true)
		if (value == 1) {
			with (objAim)
				image_alpha = 0.6
				
			controlled_window_set_cursor_sprite(sprCursor, 0)
		}
	}
	else if (command == "cheatcodes") {
		global.cheatCodes = value
		audio_play_sound(sndWindowTick, 0, false)
		with (objPlayer)
			slide_text(x, y, eng() ? "Executed" : "Uygulandı", c_white, true)
	}
	else if (command == "anticheat.ischeated") {
		if (global.isCheated)
			show_messagebox(250, 250, eng() ? "You cheated." : "Hile yaptın.", eng() ? "Info" : "Bilgi", sec*2)
		else
			show_messagebox(250, 250, eng() ? "You did not cheat." : "Hile yapmadın.", eng() ? "Info" : "Bilgi", sec*2)
	}
	else if (command == "anticheat.clear") {
		global.isCheated = false
		recalculate_sha_all()
		save_anticheat(global.saveNo)
		audio_play_sound(sndWindowTick, 0, false)
		with (objPlayer)
			slide_text(x, y, eng() ? "Executed" : "Uygulandı", c_white, true)
	}
	else if (command == "hp" and global.cheatCodes) {
		global.isCheated = true
		
		with (efboxDeath)
			instance_destroy()
		
		with (objPlayer)
			change_hp(global.maxHp)
			
		audio_play_sound(sndWindowTick, 0, false)
		with (objPlayer)
			slide_text(x, y, eng() ? "Executed" : "Uygulandı", c_white, true)
	}
	else if (command == "fps" and global.cheatCodes) {
		global.isCheated = true
		
		global.manualRefreshRate_mode = true
		global.refreshRate = value
		change_verticalSync(false)
		game_set_fps(global.refreshRate)
		totalDFPS = 0
		totalDFPS_count = 0
		alarm[2] = sec
			
		audio_play_sound(sndWindowTick, 0, false)
		with (objPlayer)
			slide_text(x, y, eng() ? "Executed" : "Uygulandı", c_white, true)
	}
	else if (command == "phy_update_speed" and global.cheatCodes) {
		global.isCheated = true
		
		physics_world_sync(value)
			
		audio_play_sound(sndWindowTick, 0, false)
		with (objPlayer)
			slide_text(x, y, eng() ? "Executed" : "Uygulandı", c_white, true)
	}
	else if (command == "resetfps" and global.cheatCodes) {
		global.manualRefreshRate_mode = false
		
		ini_open("display.ini")
			global.refreshRate = ini_read_real("Display", "refreshRate", IS_MOBILE ? 30 : 60)
			global.displayRefreshRate = global.refreshRate
		ini_close()
		
		change_verticalSync(false)
		game_set_fps(global.refreshRate)
		
		totalDFPS = 0
		totalDFPS_count = 0
		alarm[2] = sec
			
		audio_play_sound(sndWindowTick, 0, false)
		with (objPlayer)
			slide_text(x, y, eng() ? "Executed" : "Uygulandı", c_white, true)
	}
	else if (command == "-hardwarecursor") {
		global.useHardwareCursor = !value
		audio_play_sound(sndWindowTick, 0, false)
		with (objPlayer)
			slide_text(x, y, eng() ? "Executed" : "Uygulandı", c_white, true)
	}
	else if (command == "-drawcursor") {
		global.drawCursor = value
		audio_play_sound(sndWindowTick, 0, false)
		with (objPlayer)
			slide_text(x, y, eng() ? "Executed" : "Uygulandı", c_white, true)
	}
	else if (command == "-fix") {
		audio_play_sound(sndWindowTick, 0, false)
		if (quest_exists(objQuest_lordLoves) and !item_exists(objPotion_001Q))
			add_item(objPotion_001Q)
	}
	else if (command == "phy_fast_sync" and global.cheatCodes) {
		global.fastPhysicsSync_mode = value
		audio_play_sound(sndWindowTick, 0, false)
		with (objPlayer)
			slide_text(x, y, eng() ? "Executed" : "Uygulandı", c_white, true)
	}
	else if (command == "mana" and global.cheatCodes) {
		global.isCheated = true
		
		with (objPlayer)
			change_mana(global.maxMana)
			
		audio_play_sound(sndWindowTick, 0, false)
		with (objPlayer)
			slide_text(x, y, eng() ? "Executed" : "Uygulandı", c_white, true)
	}
	else if (command == "-light") {
		global.lightActive = value

		if (instance_exists(contLight)) {
		    free_surface(contLight.sl_buffer_surface1)
		    free_surface(contLight.sl_buffer_surface2)
		}
		
		audio_play_sound(sndWindowTick, 0, false)
		with (objPlayer)
			slide_text(x, y, eng() ? "Executed" : "Uygulandı", c_white, true)
	}
	else if (command == "select" and global.cheatCodes) {
		global.isCheated = true
		
		global.selectTarget_mode = true
		audio_play_sound(sndWindowTick, 0, false)
		with (objPlayer)
			slide_text(x, y, eng() ? "Executed" : "Uygulandı", c_white, true)
	}
	else if (command == "petmode" and global.cheatCodes) {
		global.isCheated = true
		
		global.petMode = value
		audio_play_sound(sndWindowTick, 0, false)
		with (objPlayer)
			slide_text(x, y, eng() ? "Executed" : "Uygulandı", c_white, true)
	}
	else if (command == "prog.skills" and global.cheatCodes) {
		global.isCheated = true
		
		var neededQuests = ds_list_create()
		ds_list_add(neededQuests, objQuestRoad_scout)
		ds_list_add(neededQuests, objQuestRoad_scout2)
		ds_list_add(neededQuests, objQuest_meetSenior)
		ds_list_add(neededQuests, objQuest_mineralCave)
		ds_list_add(neededQuests, objQuest_rival)
		ds_list_add(neededQuests, objQuest_rival2)
		ds_list_add(neededQuests, objQuest_rival3)
		ds_list_add(neededQuests, objQuest_rival4)
		ds_list_add(neededQuests, objQuest_rival5)
		ds_list_add(neededQuests, objQuest_rival6)
		ds_list_add(neededQuests, objQuest_item)
		ds_list_add(neededQuests, objQuest_cunning)
		ds_list_add(neededQuests, objQuest_blacksmith)
		ds_list_add(neededQuests, objQuest_blacksmith2)
		ds_list_add(neededQuests, objQuest_mineralCave_prep)
		ds_list_add(neededQuests, objQuest_meetSenior_prep)
		ds_list_add(neededQuests, objQuest_lordLoves)
		ds_list_add(neededQuests, objQuest_firstFight)
		ds_list_add(neededQuests, objQuest_bloodMineral)
		ds_list_add(neededQuests, objQuest_trustProblems)
		ds_list_add(neededQuests, objQuest_meetElise)
		
		var ds_size = ds_list_size(neededQuests)
		for (var i = 0; i < ds_size; i++) {
			var quest = ds_list_find_value(neededQuests, i)
			if (ds_list_find_index(global.questsFinished, quest) == -1)
				ds_list_add(global.questsFinished, quest)
			delete_quest(get_quest_number(quest))
		}
		ds_list_destroy(neededQuests)
		
		if (!is_quest_finished(objQuest_bloodMineral_2) and !quest_exists(objQuest_bloodMineral_2))
			add_quest(objQuest_bloodMineral_2)
		
		if (!test_title(title_lordstrust))
			add_title(title_lordstrust)
		if (!test_title(title_lordstrust))
			add_title(title_strong)
		if (ds_list_find_value(global.gameChoices, 0) == -1)
			set_gamechoice(0, choice_1)
		
		while (global.level < 16)
			change_exp(100)
		
		global.selectedSkill[4] = objMainBS
		
		save_all(global.saveNo)
		recalculate_sha_all()
		
		change_location(roomCastle_area, loc_hawmgrad)
		
		audio_play_sound(sndWindowTick, 0, false)
		with (objPlayer)
			slide_text(x, y, eng() ? "Executed" : "Uygulandı", c_white, true)
	}
	else if (command == "set20" and global.cheatCodes) {
		global.isCheated = true
		
		add_item(objSw_001S, value)
		add_item(objBow_005D, value)
		add_item(objSh_005, value)
		add_item(objClot_005, value)
		add_item(objNeck_005, value)
		
		audio_play_sound(sndWindowTick, 0, false)
		with (objPlayer)
			slide_text(x, y, eng() ? "Executed" : "Uygulandı", c_white, true)
	}
	else if (command == "debug" and global.cheatCodes) {
		global.isCheated = true
		global.debugMode = value
		audio_play_sound(sndWindowTick, 0, false)
		with (objPlayer)
			slide_text(x, y, eng() ? "Executed" : "Uygulandı", c_white, true)
	}
	else if (command == "-safe") {
		global.defenseLock = value
		audio_play_sound(sndWindowTick, 0, false)
		with (objPlayer)
			slide_text(x, y, eng() ? "Executed" : "Uygulandı", c_white, true)
	}
	else if (command == "-zeroexp") {
		change_exp(-global.experience)
		audio_play_sound(sndWindowTick, 0, false)
		with (objPlayer)
			slide_text(x, y, eng() ? "Executed" : "Uygulandı", c_white, true)
	}
	else if (command == "zoom" and global.cheatCodes) {
		global.isCheated = true
		
		global.zoomMode = value
		audio_play_sound(sndWindowTick, 0, false)
		with (objPlayer)
			slide_text(x, y, eng() ? "Executed" : "Uygulandı", c_white, true)
	}
	else if (command == "addhours" and global.cheatCodes) {
		global.isCheated = true
		
		change_hours(value)
		audio_play_sound(sndWindowTick, 0, false)
		with (objPlayer)
			slide_text(x, y, eng() ? "Executed" : "Uygulandı", c_white, true)
	}
	else if (command == "taunt" and global.cheatCodes) {
		global.isCheated = true
		
		with (parCreature)
			attacked(0, objPlayer.id, false, false)
			
		audio_play_sound(sndWindowTick, 0, false)
		with (objPlayer)
			slide_text(x, y, eng() ? "Executed" : "Uygulandı", c_white, true)
	}
	else if (command == "exp" and global.cheatCodes) {
		global.isCheated = true
		change_exp(global.targetExperience*value/100)
		audio_play_sound(sndWindowTick, 0, false)
		with (objPlayer)
			slide_text(x, y, eng() ? "Executed" : "Uygulandı", c_white, true)
	}
	else if (command == "gold" and global.cheatCodes) {
		global.isCheated = true
		change_money(value)
		audio_play_sound(sndWindowTick, 0, false)
		with (objPlayer)
			slide_text(x, y, eng() ? "Executed" : "Uygulandı", c_white, true)
	}
	else if (command == "-deletesave") {
		audio_play_sound(sndWindowTick, 0, false)
		file_delete(string(global.steamID)+"\\save_"+string(value)+".lufsav")
	}
	else if (command == "-deletesaves") {
		audio_play_sound(sndWindowTick, 0, false)
		for (var i = 1; i < 5; i++)
			file_delete(string(global.steamID)+"\\save_"+string(i)+".lufsav")
	}
	else if (command == "-refresh") {
		event_perform(ev_keypress, vk_f4)
		
		audio_play_sound(sndWindowTick, 0, false)
		with (objPlayer)
			slide_text(x, y, eng() ? "Executed" : "Uygulandı", c_white, true)
	}
	else if (command == "ghost" and global.cheatCodes) {
		global.isCheated = true
		global.invisibility = value
		
		if (global.invisibility) {
			with (objPlayer.id)
				add_effectbox(efboxinvisibility, -1, 3*sec)
		}
		
		audio_play_sound(sndWindowTick, 0, false)
		with (objPlayer)
			slide_text(x, y, eng() ? "Executed" : "Uygulandı", c_white, true)
	}
	else if (command == "upgrade" and global.cheatCodes) {
		global.isCheated = true
		global.upgradeTickets += value
		audio_play_sound(sndWindowTick, 0, false)
		with (objPlayer)
			slide_text(x, y, eng() ? "Executed" : "Uygulandı", c_white, true)
	}
	/*else if (command == "quest.complete") {
		global.isCheated = true
		var quest = ds_list_find_value(global.list_quest, value)
		
		while (!is_quest_finished(quest))
			quest_progress(quest, 1)
			
		audio_play_sound(sndWindowTick, 0, false)
	}*/
	else if (command == "stat" and global.cheatCodes) {
		global.isCheated = true
		global.virtual_stat_points += value
		audio_play_sound(sndWindowTick, 0, false)
		with (objPlayer)
			slide_text(x, y, eng() ? "Executed" : "Uygulandı", c_white, true)
	}
	else if (command == "skillpoint" and global.cheatCodes) {
		global.isCheated = true
		global.skillPoints += value
		audio_play_sound(sndWindowTick, 0, false)
		with (objPlayer)
			slide_text(x, y, eng() ? "Executed" : "Uygulandı", c_white, true)
	}
	else if (command == "spawntime" and global.cheatCodes) {
		global.isCheated = true
		global.spawnFreq = value
		audio_play_sound(sndWindowTick, 0, false)
		with (objPlayer)
			slide_text(x, y, eng() ? "Executed" : "Uygulandı", c_white, true)
	}
	else if (command == "cooldown" and global.cheatCodes) {
		global.isCheated = true
		for (var i = 0; i < 5; i++)
			global.selectedSkillRem[i] = 1
			
		audio_play_sound(sndWindowTick, 0, false)
		with (objPlayer)
			slide_text(x, y, eng() ? "Executed" : "Uygulandı", c_white, true)
	}
	else if (command == "physicalpower" and global.cheatCodes) {
		global.isCheated = true
		global.add_physicalPower = value
		global.anticheat_adds = recalculate_sha_adds()
		audio_play_sound(sndWindowTick, 0, false)
		with (objPlayer)
			slide_text(x, y, eng() ? "Executed" : "Uygulandı", c_white, true)
	}
	else if (command == "magicalpower" and global.cheatCodes) {
		global.isCheated = true
		global.add_magicalPower = value
		global.anticheat_adds = recalculate_sha_adds()
		audio_play_sound(sndWindowTick, 0, false)
		with (objPlayer)
			slide_text(x, y, eng() ? "Executed" : "Uygulandı", c_white, true)
	}
	else if (command == "speed" and global.cheatCodes) {
		global.isCheated = true
		global.add_speed = value
		global.anticheat_adds = recalculate_sha_adds()
		audio_play_sound(sndWindowTick, 0, false)
		with (objPlayer)
			slide_text(x, y, eng() ? "Executed" : "Uygulandı", c_white, true)
	}
	else if (command == "attackspeed" and global.cheatCodes) {
		global.isCheated = true
		global.add_attackSpeed = value
		global.anticheat_adds = recalculate_sha_adds()
		audio_play_sound(sndWindowTick, 0, false)
		with (objPlayer)
			slide_text(x, y, eng() ? "Executed" : "Uygulandı", c_white, true)
	}
	else if (command == "debugod" and global.cheatCodes) {	
		global.isCheated = true
		global.add_speed = 10
		global.add_physicalPower += 10000
		global.add_attackSpeed += 3
		global.anticheat_adds = recalculate_sha_adds()
		audio_play_sound(sndWindowTick, 0, false)
		with (objPlayer)
			slide_text(x, y, eng() ? "Executed" : "Uygulandı", c_white, true)
	}
	else if (command == "surrender" and global.cheatCodes) {
		global.isCheated = true
		with (parTarget)
			if (target == objPlayer.id)
				ai_target_destroy(true)
				
		audio_play_sound(sndWindowTick, 0, false)
		with (objPlayer)
			slide_text(x, y, eng() ? "Executed" : "Uygulandı", c_white, true)
	}
	else if (command == "maxhp" and global.cheatCodes) {
		global.isCheated = true
		global.add_maxHp = value
		global.anticheat_adds = recalculate_sha_adds()
		audio_play_sound(sndWindowTick, 0, false)
		with (objPlayer)
			slide_text(x, y, eng() ? "Executed" : "Uygulandı", c_white, true)
	}
	else if (command == "-impulse") {
		if (value < 0 or value > 100)
			value = 50
			
		global.impulseRatio = value/100
		audio_play_sound(sndWindowTick, 0, false)
		with (objPlayer)
			slide_text(x, y, eng() ? "Executed" : "Uygulandı", c_white, true)
	}
	else if (command == "maxmana" and global.cheatCodes) {
		global.isCheated = true
		global.add_maxMana = value
		global.anticheat_adds = recalculate_sha_adds()
		audio_play_sound(sndWindowTick, 0, false)
		with (objPlayer)
			slide_text(x, y, eng() ? "Executed" : "Uygulandı", c_white, true)
	}
	else if (command == "doubleexp" and global.cheatCodes) {
		global.isCheated = true
		global.add_expRatio = value ? 100 : 0
		global.anticheat_adds = recalculate_sha_adds()
		audio_play_sound(sndWindowTick, 0, false)
		with (objPlayer)
			slide_text(x, y, eng() ? "Executed" : "Uygulandı", c_white, true)
	}
	else if (command == "criticalchance" and global.cheatCodes) {
		global.isCheated = true
		global.add_criticalChance = value
		global.anticheat_adds = recalculate_sha_adds()
		audio_play_sound(sndWindowTick, 0, false)
		with (objPlayer)
			slide_text(x, y, eng() ? "Executed" : "Uygulandı", c_white, true)
	}
	else if (command == "deatheffect" and global.cheatCodes) {
		global.isCheated = true
		instance_destroy(efboxDeath)
		audio_play_sound(sndWindowTick, 0, false)
		with (objPlayer)
			slide_text(x, y, eng() ? "Executed" : "Uygulandı", c_white, true)
	}
		
	save_anticheat(global.saveNo)
	
	if (command == "cheatcodes") {
		show_messagebox(300, 100,
		"[c="+string(c_aqua)+"]nodie [1 or 0]:[/c] Immortality"+"\n"+
		"[c="+string(c_aqua)+"]set20 [Number]:[/c] Gives +X Item Set"+"\n"+
		"[c="+string(c_aqua)+"]debug [1 or 0]:[/c] Debug Mode"+"\n"+
		"[c="+string(c_aqua)+"]taunt:[/c] Taunts All Enemies"+"\n"+
		"[c="+string(c_aqua)+"]exp [Number]:[/c] Gives X% Experience"+"\n"+
		"[c="+string(c_aqua)+"]gold [Number]:[/c] Gives X Gold"+"\n"+
		"[c="+string(c_aqua)+"]upgrade [Number]:[/c] Gives X Upgrade Tickets"+"\n"+
		"[c="+string(c_aqua)+"]physicalpower [Number]:[/c] 0 Bonus Physical Power"+"\n"+
		"[c="+string(c_aqua)+"]magicalpower [Number]:[/c] X Bonus Magical Power"+"\n"+
		"[c="+string(c_aqua)+"]speed [Number]:[/c] X Bonus Movement Speed"+"\n"+
		"[c="+string(c_aqua)+"]maxhp [Number]:[/c] X Bonus Maximum HP"+"\n"+
		"[c="+string(c_aqua)+"]maxmana [Number]:[/c] X Bonus Maximum Mana"+"\n"+
		"[c="+string(c_aqua)+"]attackspeed [Number]:[/c] X Bonus Attack Speed"+"\n"+
		"[c="+string(c_aqua)+"]criticalchance [Number]:[/c] X% Bonus Critical Chance"
		, "Commands")
		
		show_messagebox(display_get_gui_width()-550, 100,
		"[c="+string(c_aqua)+"]hp:[/c] Full HP"+"\n"+
		"[c="+string(c_aqua)+"]mana:[/c] Full Mana"+"\n"+
		"[c="+string(c_aqua)+"]zoom [1-0]:[/c] Limitless Zoom"+"\n"+
		"[c="+string(c_aqua)+"]surrender:[/c] Surrender"+"\n"+
		"[c="+string(c_aqua)+"]spawntime [Number]:[/c] X Spawn Frequency Ratio"+"\n"+
		"[c="+string(c_aqua)+"]cooldown:[/c] Resets Cooldowns"+"\n"+
		"[c="+string(c_aqua)+"]ghost [1-0]:[/c] Invisibility"+"\n"+
		"[c="+string(c_aqua)+"]deatheffect:[/c] Clears The Death Effect"+"\n"+
		"[c="+string(c_aqua)+"]doubleexp [1-0]:[/c] +100% Bonus Experience"+"\n"+
		"[c="+string(c_aqua)+"]addhours [Number]:[/c] Adds Hours"+"\n"+
		"[c="+string(c_aqua)+"]skillpoint [1-0]:[/c] Gives Skill Point(s)"+"\n"+
		"[c="+string(c_aqua)+"]stat [1-0]:[/c] Gives Stat Point(s)"
		, "Commands")
	}
	else if (command == "-help") {
		show_messagebox(300, 100,
		"[c="+string(c_aqua)+"]-hardwarecursor [1 or 0]:[/c] Hardware Cursor"+"\n"+
		"[c="+string(c_aqua)+"]-drawcursor [1 or 0]:[/c] Visible/Invisible Cursor"+"\n"+
		"[c="+string(c_aqua)+"]-safe [1 or 0]:[/c] Shows GUI"+"\n"+
		"[c="+string(c_aqua)+"]-impulse [0-100]:[/c] %X Basic Attack Impulse"+"\n"+
		"[c="+string(c_aqua)+"]-showgui [1 or 0]:[/c] Shows GUI"+"\n"+
		"[c="+string(c_aqua)+"]-refresh [1 or 0]:[/c] Refresh"+"\n"+
		"[c="+string(c_aqua)+"]-light [1 or 0]:[/c] Enables/Disables Lightning"
		, "Commands")
	}
	
	update_character()
	
	save_config(global.saveNo)
	
	global.consoleMode = false
}