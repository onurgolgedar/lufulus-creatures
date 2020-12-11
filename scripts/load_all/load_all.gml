/// @param saveKey
function load_all() {

	global.noSave_mode = true
		var _temp = default_string
		var _tempGrid = ds_grid_create(0, 0)
	#region RESET
		ds_list_clear(global.questsFinished)

		ds_list_clear(global.list_quest)
		ds_list_clear(global.list_questScore)

		ds_list_clear(global.list_selectedSkill)

		ds_list_clear(global.fixedMessages)
		ds_list_clear(global.fixedMessageNos)
		ds_list_clear(global.fixedMessageActivations)
	
		ds_list_clear(global.takenLootboxes)
		ds_list_clear(global.takenBosses)
		ds_list_clear(global.destroyedMaps)
		ds_list_clear(global.takenTutorials)
		ds_list_clear(global.titles)
	
		ds_list_clear(global.permanentEfboxes)
		ds_list_clear(global.permanentEfboxes_time)
	
		ds_map_clear(global.goldTaken_creature)
	
		var ds_size = ds_list_size(global.gameChoices)
		for (var i = 0; i < ds_size; i++)
			ds_list_set(global.gameChoices, i, -1)
	
	#region RESET CHEATS
		global.immortality = false
		global.showGUI = true
		global.cheatCodes = false
		global.selectTarget_mode = false
		global.petMode = false
		global.defenseLock = true
		global.zoomMode = false
		global.invisibility = false
		global.upgradeTickets = 0
		global.spawnFreq = 0.7*sec
		global.add_physicalPower = 0
		global.add_magicalPower = 0
		global.add_speed = 0
		global.add_attackSpeed = 0
		global.add_maxHp = 0
		global.impulseRatio = 0.5
		global.add_maxMana = 0
		global.add_expRatio = 0
		global.add_criticalChance = 0
	#endregion
	
		global.medallionI = -1
		global.medallionJ = -1

		global.weaponI = -1
		global.weaponJ = -1
		global.weaponSprite = sprNothingness
		global.weaponType = pointer_null
		global.weaponSlow = 0

		global.sWeaponI = -1
		global.sWeaponJ = -1
		global.sWeaponSprite = sprNothingness
		global.sWeaponType = pointer_null
		global.secondaryActive = false

		global.necklaceI = -1
		global.necklaceJ = -1

		global.clothesI = -1
		global.clothesJ = -1
		global.clothesSlow = 0
		global.clothesArm = sprArm
		global.clothesFrontArm = sprFrontArm
		global.clothesStyle = 0.0
	
		global.grid_item = ds_grid_recreate(global.grid_item, global.bagBoxCount_horizontal*global.bagMaxPage, global.bagBoxCount_vertical+5, -1)
		global.grid_itemActive = ds_grid_recreate(global.grid_itemActive, global.bagBoxCount_horizontal*global.bagMaxPage, global.bagBoxCount_vertical+5, false)
		global.grid_itemUpgrade = ds_grid_recreate(global.grid_itemUpgrade, global.bagBoxCount_horizontal*global.bagMaxPage, global.bagBoxCount_vertical+5, -1)
		global.grid_itemExtension[0] = ds_grid_recreate(global.grid_itemExtension[0], global.bagBoxCount_horizontal*global.bagMaxPage, global.bagBoxCount_vertical+5, -1)
		global.grid_itemExtension[1] = ds_grid_recreate(global.grid_itemExtension[1], global.bagBoxCount_horizontal*global.bagMaxPage, global.bagBoxCount_vertical+5, -1)
		global.grid_itemCount = ds_grid_recreate(global.grid_itemCount, global.bagBoxCount_horizontal*global.bagMaxPage, global.bagBoxCount_vertical+5, -1)
		
		global.grid_item_bank = ds_grid_recreate(global.grid_item_bank, global.bagBoxCount_horizontal*global.bagMaxPage, global.bagBoxCount_vertical, -1)
		global.grid_itemUpgrade_bank = ds_grid_recreate(global.grid_itemUpgrade_bank, global.bagBoxCount_horizontal*global.bagMaxPage, global.bagBoxCount_vertical, -1)
		global.grid_itemExtension_bank[0] = ds_grid_recreate(global.grid_itemExtension_bank[0], global.bagBoxCount_horizontal*global.bagMaxPage, global.bagBoxCount_vertical, -1)
		global.grid_itemExtension_bank[1] = ds_grid_recreate(global.grid_itemExtension_bank[1], global.bagBoxCount_horizontal*global.bagMaxPage, global.bagBoxCount_vertical, -1)
		global.grid_itemCount_bank = ds_grid_recreate(global.grid_itemCount_bank, global.bagBoxCount_horizontal*global.bagMaxPage, global.bagBoxCount_vertical, -1)
	
		global.grid_skillUpgrade = ds_grid_recreate(global.grid_skillUpgrade, 20, 6, 0)

		for (var i = 0; i < global.bagBoxCount_horizontal*global.bagMaxPage; i++) {
		    for (var j = 0; j < global.bagBoxCount_vertical+5*(i == 0); j++) {
		        global.item[i, j] = -1
				global.itemActive[i, j] = false
		        global.itemUpgrade[i, j] = -1
		        global.itemExtension0[i, j] = -1
		        global.itemExtension1[i, j] = -1
		        global.itemType[i, j] = pointer_null
		        global.itemCount[i, j] = -1
		    }
		}

		for (var i = 0; i < global.bagBoxCount_horizontal*global.bagMaxPage; i++) {
		    for (var j = 0; j < global.bagBoxCount_vertical; j++) {
		        global.item_bank[i, j] = -1
		        global.itemUpgrade_bank[i, j] = -1
		        global.itemExtension0_bank[i, j] = -1
		        global.itemExtension1_bank[i, j] = -1
		        global.itemType_bank[i, j] = pointer_null
		        global.itemCount_bank[i, j] = -1
				global.itemRentTime_bank[i, j] = -1
		    }
		}
		
		for (var i = 0; i < 40; i++) {
			global.quest[i] = -1
			global.questScore[i] = -1
			global.questMaxScore[i] = -1
		}
	
		for (var i = 0; i < 5; i++) {
			global.selectedSkill[i] = -1
			global.selectedSkillRem[i] = -1
			global.selectedSkillMaxRem[i] = -1
			global.selectedSkillMana[i] = -1
		}
	
		for (var i = 0; i < ds_grid_width(global.grid_skillUpgrade); i++)
			for (var j = 0; j < ds_grid_height(global.grid_skillUpgrade); j++)
				global.skillUpgrade[i, j] = 0
	#endregion

	#region LOAD
		ini_open(string(global.steamID)+"\\save_"+argument[0]+".lufsav")
			global.antiCheat_forSaveFiles = ini_read_real("v5xu12xuds", "gqx3gs62x", false)
		
			// Temporary for compatibility issues
			var locationName = ini_read_string("n5n58e4s", "n8653kg", "roomBeforeRoad")
			global.locationName = get_location(asset_get_index(locationName))
		
			global.hair = asset_get_index(ini_read_string("b534uxoo7", "2agj3as", "sprHair"))
		
			global.gameTime = decyrpt(ini_read_real("b534uxoo7", "v256gige", encyrpt(0)))
			global.totalHours = decyrpt(ini_read_real("b534uxoo7", "fu45axooy", encyrpt(0)))
		
			global.debt = decyrpt(ini_read_real("b534uxoo7", "j6vv843d", encyrpt(0)))
			global.debtPayingTime = decyrpt(ini_read_real("General", "debtTime", encyrpt(-1)))
			global.debtCount = decyrpt(ini_read_real("b534uxoo7", "o8p6sdsn", encyrpt(0)))
	
			global.level = decyrpt(ini_read_real("j32a52a", "6a2ayj3vc", encyrpt(1)))
			global.experience = decyrpt(ini_read_real("j32a52a", "2a7754xd", encyrpt(0)))
			global.targetExperience = decyrpt(ini_read_real("j32a52a", "52tx32ab1", encyrpt(calculate_level_exp(1))))
			global.previousExperience = decyrpt(ini_read_real("j32a52a", "2at36jdx2", encyrpt(0)))
		
			global.levels_withoutDying = decyrpt(ini_read_real("52a5hs2x", "131sz5ds", encyrpt(0)))
			global.levels_withoutDying_rewardCount = decyrpt(ini_read_real("52a5hs2x", "125fw62ax", encyrpt(0)))
			global.maxCreatureScore = decyrpt(ini_read_real("52a5hs2x", "h23x3ht7", encyrpt(0)))
		
			global.clothesStyle = decyrpt(ini_read_real("b534uxoo7", "bx56x342jk", encyrpt(0)))
			var beforeClothesStyle = global.clothesStyle
	
			global.givenStr = decyrpt(ini_read_real("3u56xgh", "3t21sjj3k", encyrpt(0)))
			global.givenDex = decyrpt(ini_read_real("3u56xgh", "25ihgx3x", encyrpt(0)))
			global.givenVit = decyrpt(ini_read_real("3u56xgh", "je43sbw3", encyrpt(0)))
			global.givenMp = decyrpt(ini_read_real("3u56xgh", "25ucs6s", encyrpt(0)))
			global.givenSta = decyrpt(ini_read_real("3u56xgh", "62asy3trc", encyrpt(0)))
			global.statPoints = decyrpt(ini_read_real("3u56xgh", "25t2axvn3t", encyrpt(0)))
		
			global.virtual_stat_points = global.statPoints
	
			global.impulseRatio = decyrpt(ini_read_real("x2vxcx51", "2ba6dujk", encyrpt(0.5)))
			global.impulseRatio = clamp(global.impulseRatio, 0, 1)
	
			global.rentGold = decyrpt(ini_read_real("42af476", "h3hh3cssj", encyrpt(0)))
			global.money = decyrpt(ini_read_real("55s5a5gz", "6w3aa53", encyrpt(0)))
		
			_temp = ini_read_string("b534uxoo7", "y65i45xa12", default_string)
			var _gameChoices = ds_list_create()
			if (_temp != default_string) {
				ds_list_read(_gameChoices, _temp)
			}
		
			_temp = ini_read_string("55s5a5gz", "25a6ui", default_string)
			if (_temp != default_string) {
				ds_grid_read(_tempGrid, _temp)
				ds_grid_overwrite(global.grid_item, _tempGrid)
			}
		
			_temp = ini_read_string("55s5a5gz", "797fgfo", default_string)
			if (_temp != default_string) {
				ds_grid_read(_tempGrid, _temp)
				ds_grid_overwrite(global.grid_itemActive, _tempGrid)
			}
		
			_temp = ini_read_string("55s5a5gz", "2a5aagv", default_string)
			if (_temp != default_string) {
				ds_grid_read(_tempGrid, _temp)
				ds_grid_overwrite(global.grid_itemUpgrade, _tempGrid)
			}
		
			_temp = ini_read_string("55s5a5gz", "hgf4jxa2", default_string)
			if (_temp != default_string) {
				ds_grid_read(_tempGrid, _temp)
				ds_grid_overwrite(global.grid_itemExtension[0], _tempGrid)
			}
		
			_temp = ini_read_string("55s5a5gz", "x526aan", default_string)
			if (_temp != default_string) {
				ds_grid_read(_tempGrid, _temp)
				ds_grid_overwrite(global.grid_itemExtension[1], _tempGrid)
			}
		
			_temp = ini_read_string("55s5a5gz", "jjtyd33av", default_string)
			if (_temp != default_string) {
				ds_grid_read(_tempGrid, _temp)
				ds_grid_overwrite(global.grid_itemCount, _tempGrid)
			}
		
			_temp = ini_read_string("42af476", "saf4nt5wa", default_string)
			if (_temp != default_string) {
				ds_grid_read(_tempGrid, _temp)
				ds_grid_overwrite(global.grid_item_bank, _tempGrid)
			}
			
			_temp = ini_read_string("42af476", "52agjjz", default_string)
			if (_temp != default_string) {
				ds_grid_read(_tempGrid, _temp)
				ds_grid_overwrite(global.grid_itemUpgrade_bank, _tempGrid)
			}
			
			_temp = ini_read_string("42af476", "25axgj3hl", default_string)
			if (_temp != default_string) {
				ds_grid_read(_tempGrid, _temp)
				ds_grid_overwrite(global.grid_itemExtension_bank[0], _tempGrid)
			}
			
			_temp = ini_read_string("42af476", "652f26j", default_string)
			if (_temp != default_string) {
				ds_grid_read(_tempGrid, _temp)
				ds_grid_overwrite(global.grid_itemExtension_bank[1], _tempGrid)
			}
			
			_temp = ini_read_string("42af476", "3abj4d", default_string)
			if (_temp != default_string) {
				ds_grid_read(_tempGrid, _temp)
				ds_grid_overwrite(global.grid_itemCount_bank, _tempGrid)
			}
			
			_temp = ini_read_string("42af476", "5xf36u8s", default_string)
			if (_temp != default_string) {
				ds_grid_read(_tempGrid, _temp)
				ds_grid_overwrite(global.grid_itemRentTime_bank, _tempGrid)
			}
	
			_temp = ini_read_string("u4u4sch", "b3b5saju2", default_string)
			if (_temp != default_string)
				ds_list_read(global.questsFinished, _temp)
			_temp = ini_read_string("u4u4sch", "gfbn3an4e", default_string)
			if (_temp != default_string)
				ds_list_read(global.list_quest, _temp)
			_temp = ini_read_string("u4u4sch", "62adt34te", default_string)
			if (_temp != default_string)
				ds_list_read(global.list_questScore, _temp)
		
			_temp = ini_read_string("t5t5334ba", "t2u5x54sdh", default_string)
			if (_temp != default_string)
				ds_list_read(global.permanentEfboxes, _temp)
			_temp = ini_read_string("t5t5334ba", "bi51xg17fx", default_string)
			if (_temp != default_string)
				ds_list_read(global.permanentEfboxes_time, _temp)
	
			_temp = ini_read_string("b534uxoo7", "52ga23x", default_string)
			if (_temp != default_string)
				ds_list_read(global.titles, _temp)
			_temp = ini_read_string("b534uxoo7", "v4v46x1", default_string)
			if (_temp != default_string)
				ds_list_read(global.takenLootboxes, _temp)
			_temp = ini_read_string("b534uxoo7", "63b2ssu", default_string)
			if (_temp != default_string)
				ds_list_read(global.takenBosses, _temp)
		
			_temp = ini_read_string("b534uxoo7", "2556217asx", default_string)
			if (_temp != default_string)
				ds_map_read(global.goldTaken_creature, _temp)
		
			_temp = ini_read_string("b534uxoo7", "2v15678a", default_string)
			if (_temp != default_string)
				ds_list_read(global.destroyedMaps, _temp)
			// That's extra. Delete after Early Access.
			else {
				_temp = ini_read_string("General", "destroyedSpawnMaps", default_string)
			
				if (_temp != default_string)
					ds_list_read(global.destroyedMaps, _temp)
			}
			
			var ds_size = ds_list_size(global.destroyedMaps)
			for (var i = 0; i < ds_size; i++)
				ds_list_replace(global.destroyedMaps, i, asset_get_index(ds_list_find_value(global.destroyedMaps, i)))
		
			_temp = ini_read_string("b534uxoo7", "cv58gsp", default_string)
			if (_temp != default_string)
				ds_list_read(global.takenTutorials, _temp)
	
			_temp = ini_read_string("bf4b3sx5", "y3as6fa", default_string)
			if (_temp != default_string)
				ds_list_read(global.list_selectedSkill, _temp)
			
			var ds_size = ds_list_size(global.list_selectedSkill)
			for (var i = 0; i < ds_size; i++) {
				var _selectedSkill = ds_list_find_value(global.list_selectedSkill, i)
		
				if (_selectedSkill != -1)
					global.selectedSkill[i] = asset_get_index(_selectedSkill)
				else
					global.selectedSkill[i] = -1
			}
	
			_temp = ini_read_string("bf4b3sx5", "2x5a4hjk", default_string)
			if (_temp != default_string) {
				ds_grid_read(_tempGrid, _temp)
				ds_grid_overwrite(global.grid_skillUpgrade, _tempGrid)
			}
			
			for (var i = 0; i < ds_grid_width(global.grid_skillUpgrade); i++)
				for (var j = 0; j < ds_grid_height(global.grid_skillUpgrade); j++)
					global.skillUpgrade[i, j] = ds_grid_get(global.grid_skillUpgrade, i, j)
			
			global.skillPoints = decyrpt(ini_read_real("bf4b3sx5", "8664f36ax", encyrpt(0)))
			global.givenSkillPoints = decyrpt(ini_read_real("bf4b3sx5", "25aa3atyx5", encyrpt(0)))
		
			global.isCheated = decyrpt(ini_read_real("5b287sdx", "35b8ks", encyrpt(0)))
	
			var _fixedMessageNos = ds_list_create()
			var _fixedMessageActivations = ds_list_create()
			_temp = ini_read_string("g1g4c6c32a", "h6i63", default_string)
			if (_temp != default_string)
				ds_list_read(_fixedMessageNos, _temp)
			_temp = ini_read_string("g1g4c6c32a", "673lfs3va", default_string)
			if (_temp != default_string)
				ds_list_read(_fixedMessageActivations, _temp)
			var ds_size = ds_list_size(_fixedMessageNos)
			for (var i = 0; i < ds_size; i++) {
				var _fixedMessageActivation = ds_list_find_value(_fixedMessageActivations, i)
		
				if (_fixedMessageActivation == -1)
					fm_add(ds_list_find_value(_fixedMessageNos, i))
				else
					fm_add(ds_list_find_value(_fixedMessageNos, i), !_fixedMessageActivation)
			}
			ds_list_destroy(_fixedMessageNos)
			ds_list_destroy(_fixedMessageActivations)
	
			global.lastWeaponChoice = decyrpt(ini_read_real("2a5n5ax", "52a99785d", encyrpt(0)))
		ini_close()
	#endregion
	
	#region PROCESS	
		var beforeLanguage = global.language
	
		var ds_size = ds_list_size(global.list_quest)
		for (var i = ds_size-1; i >= 0; i--) {
			var _quest = ds_list_find_value(global.list_quest, i)
			if (_quest != -1) {
				_quest = asset_get_index(_quest)
		
				add_quest(_quest)
		
				change_quest_score(get_quest_number(_quest), ds_list_find_value(global.list_questScore, i))
			}
		}
	
		ds_size = ds_list_size(global.questsFinished)
		for (var i = 0; i < ds_size; i++) {
			var questIndex = asset_get_index(ds_list_find_value(global.questsFinished, i))
		
			if (questIndex != -1)
				ds_list_replace(global.questsFinished, i, questIndex)
		}
	
		ds_size = ds_grid_width(global.grid_item)
		for (var i = 0; i < ds_size; i++) {
			for (var j = 0; j < ds_grid_height(global.grid_item); j++) {
				var _item = ds_grid_get(global.grid_item, i, j)
				if (_item != -1) {			
					repeat (ds_grid_get(global.grid_itemCount, i, j))
						add_item(asset_get_index(_item),
						ds_grid_get(global.grid_itemUpgrade, i, j),
						ds_grid_get(global.grid_itemExtension[0], i, j),
						ds_grid_get(global.grid_itemExtension[1], i, j),
						i,
						j)
				}
			}
		}
	
		// Tag translation
		ds_size = ds_list_size(global.titles)
		for (var i = 0; i < ds_size; i++) {
			global.language = lang_english
		
			repeat (2) {			
				// List all the titles			
				if (ds_list_find_value(global.titles, i) == title_strong) {
					global.language = beforeLanguage
					ds_list_replace(global.titles, i, title_strong)
					break
				}
				else if (ds_list_find_value(global.titles, i) == title_lordstrust) {
					global.language = beforeLanguage
					ds_list_replace(global.titles, i, title_lordstrust)
					break
				}
				else if (ds_list_find_value(global.titles, i) == title_loyal) {
					global.language = beforeLanguage
					ds_list_replace(global.titles, i, title_loyal)
					break
				}
				else if (ds_list_find_value(global.titles, i) == title_honorable) {
					global.language = beforeLanguage
					ds_list_replace(global.titles, i, title_honorable)
					break
				}
		
				global.language = lang_turkish
			}
		}
	
		global.language = beforeLanguage
	
		ds_size = ds_list_size(_gameChoices)
		for (var i = 0; i < ds_size; i++) {
			var _gameChoice = ds_list_find_value(_gameChoices, i)
			if (ds_list_size(global.gameChoices) > i)
				ds_list_set(global.gameChoices, i, _gameChoice)
			else
				ds_list_add(global.gameChoices, _gameChoice)
		}
		ds_list_destroy(_gameChoices)
	
		ds_size = ds_grid_width(global.grid_item_bank)
		for (var i = 0; i < ds_size; i++) {
			for (var j = 0; j < ds_grid_height(global.grid_item_bank); j++) {
				var _item = ds_grid_get(global.grid_item_bank, i, j)
				if (_item != -1) {			
					repeat (ds_grid_get(global.grid_itemCount_bank, i, j))
						add_item_bank(asset_get_index(_item),
						ds_grid_get(global.grid_itemUpgrade_bank, i, j),
						ds_grid_get(global.grid_itemExtension_bank[0], i, j),
						ds_grid_get(global.grid_itemExtension_bank[1], i, j),
						i,
						j)
					
					global.itemRentTime_bank[i, j] = ds_grid_get(global.grid_itemRentTime_bank, i, j)
				}
			}
		}
		
		ds_size = ds_grid_width(global.grid_item)
		for (var i = 0; i < ds_size; i++) {
			for (var j = 0; j < ds_grid_height(global.grid_item); j++) {
				if (ds_grid_get(global.grid_itemActive, i, j))
					change_active(global.itemType[i, j], i, j, true, true)
			}
		}
	
		global.clothesStyle = beforeClothesStyle
	#endregion
		ds_grid_destroy(_tempGrid)
	
		recalculate_sha_all()
	global.noSave_mode = false


}
