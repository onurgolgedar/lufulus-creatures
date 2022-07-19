#region Meet Elise Quest
if (room == roomCreature3) {
	if (!is_quest_available(objQuest_meetElise, 0)) {
		if (!quest_exists(objQuest_meetElise)) {
			with (objElise_npc)
				ai_direct_delete()
		}
		
		with (objCA2)
			ai_direct_delete()
		
		with (objC8)
			ai_direct_delete()
			
		with (objBlood_env)
			instance_destroy()
	}
	else {
		with (objCA2)
			ai_direct_death()
		
		with (objC8)
			ai_direct_death()
	}
}
else if (room == roomCreature4 and quest_exists(objQuest_meetElise))
	instance_create(-50, -50, contMeetEliseQuest)
#endregion
	
#region First Fight Quest
if (room == roomCamp1) {
	with (objPlayer) {
		var torchGiven = true
		
		var protectors = ds_list_create()
		var protector = pointer_null

		protector = target_spawn_protectors(objWarrior_melee, 400)
		if (protector != pointer_null) {
			with (protector) {
				init_warrior(melee_xlight)
				shoulders.sprite_index = sprClot_002
				teamNo = team_player
				hasTorch = torchGiven
				torchGiven = false
			}
		
			ds_list_add(protectors, protector)
		}

		if (!quest_exists(objChallenge_firstFight)) {
			protector = target_spawn_protectors(objWarrior_melee, 400)
			if (protector != pointer_null) {
				with (protector) {
					init_warrior(melee_xlight)
					shoulders.sprite_index = sprClot_002
					teamNo = team_player
				}
		
				ds_list_add(protectors, protector)
			}
		}
	
		#region Allies Construction
		var ds_size = ds_list_size(protectors)
		for (var i = 0; i < ds_size; i++)
			with (ds_list_find_value(protectors, i)) {
				ds_list_copy(allies, protectors)
				ai_protectors_remove(id)
			}
		#endregion
	}
}
#endregion
	
#region Rebel War Quests
if (room == roomRebelWar or room == roomRebelWar2) {
	with (parAi) {
		if (type == type_npc) {
			if (teamNo == team_player) {
				shoulders.sprite_index = sprClothes4_npc
				hair = choose(sprHair, sprHair2, sprHair3, sprHair6, sprHair5, sprHair12)
			}
			else {
				shoulders.sprite_index = sprClot_002
				leftArm[0].sprite_index = sprClothesArm5
				rightArm[0].sprite_index = sprClothesArm5
				hair = choose(sprHair13, sprHair16, sprHair9, sprHair7, sprHair11, sprHair8)
			}
		}
	}
		
	with (parAi) {
		if (teamNo == team_player) {
			maxHp *= 2
			hp = maxHp
			spd *= 1.15
			physicalPower *= 0.7
			lifesteal += 35
			hair = sprHair2
		}
		else {
			if (room == roomRebelWar) {
				physicalPower *= 0.7
				if (isRanged)
					physicalPower *= 0.7
			}
				
			lifesteal += 20
			
			if (room == roomRebelWar) {
				if (!isRanged)
					weapon = sprSw_006D
				else
					weapon = sprCrossbow_009
			}
			else {
				if (!isRanged)
					weapon = sprSw_009D
				else
					weapon = sprCrossbow_011D
			}
		}
	}
}
#endregion

if (instance_exists(contCreatureSpawn) and (chance(2, 5) or global.debugMode)) {
	var hunter = target_spawn(objWarrior_melee, irandom_range(80, room_width-80), irandom_range(80, room_height-80), 200)
	
	if (hunter != pointer_null) {
		ds_list_add(temp_hunters, hunter)
	
		with (hunter) {
			set_hunter()
			
			hasTorch = chance(3, 5)
		}
	}
}

#region Information Circles
if (room == roomBeforeRoad) {
	with (objRoomChanger)
		set_special_quest_target()
		
	if (!global.gamepad_active and !IS_MOBILE) {
		var title = eng() ? "Movement" : "Hareket"
		var text = eng() ? (title+"\n"+"You can move with [c="+string(c_white)+"]W A S D[/c].\nIf you have stamina, press [c="+string(c_white)+"]<Shift>[/c] to be faster.") :
		(title+"\n"+"[c="+string(c_white)+"]W A S D[/c] tuşları ile hareket\nedebilirsin. Enerji harcayarak\n[c="+string(c_white)+"]<Shift>[/c] ile daha hızlı olabilirsin.")
		tutorial_box_point(display_get_gui_width()/2, 30, title, text, 1)
	}
}
else if (room == roomWave) {
	if (!global.gamepad_active and !IS_MOBILE) {
		var title = eng() ? "Be Faster" : "Hızlı Ol"
		var text = eng() ? (title+"\n"+"If you have stamina, press [c="+string(c_white)+"]<Shift>[/c]\nto be faster.") :
		(title+"\n"+"Enerji harcayarak [c="+string(c_white)+"]<Shift>[/c]\nile daha hızlı olabilirsin.")
		var tutorialBox = tutorial_box_point(display_get_gui_width()-443, 40, title, text, 23)
				if (tutorialBox != pointer_null)
			tutorialBox.offset_x -= 70
	}
}
else if (room == roomCreature0) {
	if (!global.gamepad_active and !IS_MOBILE) {
		var title = eng() ? "Fighting" : "Mücadele"
		var text = eng() ? (title+"\n"+"Always keep your distance.\n[c="+string(c_white)+"]Hold <Left Click>[/c] to attack.\nLocate the aim on the enemies.") :
		(title+"\n"+"Düşmanla mesafeni hep koru.\nSaldırmak için [c="+string(c_white)+"]<Sol Fare>[/c] tuşuna basılı tut.\nSaldırı göstergesi ile rakipleri hedefle.")
		var tutorialBox = tutorial_box_point(display_get_gui_width()-443, 40, title, text, 9)
		if (tutorialBox != pointer_null) {
			tutorialBox.offset_x -= 100
		}
	}
}
else if (room == roomCreature) {
	var title = eng() ? "Multi Kill" : "Çoklu Öldürme"
	var text = eng() ? (title+"\n"+"Kill multiple enemies serially\nto gain [c="+string(c_aqua)+"]bonus experience[/c].\n\nBesides, creatures that have\na circle area with the same\ncolors form a team.") :
	(title+"\n"+"[c="+string(c_aqua)+"]Bonus tecrübe[/c] kazanmak için\nrakipleri art arda öldür.\n\nAyrıca, altında aynı renk çember\nbulunan yaratıklar takım halindedir.")
	var tutorialBox = tutorial_box_point(display_get_gui_width()-443, 40, title, text, 10)
	if (tutorialBox != pointer_null) {
		if (!eng())
			tutorialBox.offset_x -= 70
		else
			tutorialBox.offset_y += 15
	}
}
else if (room == roomCastle_area) {
	if (!global.gamepad_active and !IS_MOBILE) {
		var title = eng() ? "Switch Weapons" : "Silah Değiştir"
		var text = eng() ? (title+"\n[c="+string(c_white)+"]Press <Q>[/c] to switch between weapons.\nHold to lower your weapon.") : 
		(title+"\n[c="+string(c_white)+"]<Q>[/c] ile silahını değiştirebilirsin.\nSilahını indirmek için ise basılı tut.")
		var tutorialBox = tutorial_box_point(display_get_gui_width()/2, 30, title, text, 14)
	}
}

if (global.level > 1) {
	var text = eng() ? ("Stat Points\nUse your stat points\nafter you level up.") :
	("Gelişim Puanları\nSeviye atladıktan sonra\ngelişim puanlarını kullan.")
	var tutorialBox = tutorial_box_point(contGUi.cLogoX, display_get_gui_height()-103, "", text, 11)
	if (tutorialBox != pointer_null) {
		tutorialBox.offset_y -= 149
		tutorialBox.image_xscale = 0.85
		tutorialBox.image_yscale = tutorialBox.image_xscale
		tutorialBox.imageNumber = 1
	}
}

if (global.level > 3) {
	var text = eng() ? ("CTRL Skill\nThe fifth skill box is special, it is for a special\nskill called [c="+string(c_white)+"]"+sk_0+"[/c]. The skill is activated\nwhen the character discovers himself.") :
	("Kontrol Yeteneği\nBeşinci yetenek kutusu [c="+string(c_white)+"]"+sk_0+"[/c] adında bir beceri\niçin ayrılmıştır. Bu beceri karakter kendini keşfettiğinde\naktif olacak.")
	var tutorialBox = tutorial_box_point(display_get_gui_width()/2-117+4*2*29.5, display_get_gui_height()-109, "", text, 15)
	if (tutorialBox != pointer_null) {
		tutorialBox.offset_y -= 170
		tutorialBox.image_xscale = 0.85
		tutorialBox.image_yscale = tutorialBox.image_xscale
		tutorialBox.imageNumber = 1
	}
}

if (global.level > 5) {
	var text = eng() ? ("Skill Boxes\nWhen you learn a new skill, drag&drop\nthe skill here to use.") :
	("Yetenek Kutuları\nYeni bir yetenek öğrendiğinde yeteneği\nbu kutulara taşı ve bırak.")
	var tutorialBox = tutorial_box_point(display_get_gui_width()/2-117+1*2*29.5, display_get_gui_height()-109, "", text, 16)
	if (tutorialBox != pointer_null) {
		tutorialBox.offset_y -= 149
		tutorialBox.image_xscale = 0.85
		tutorialBox.image_yscale = tutorialBox.image_xscale
		tutorialBox.imageNumber = 1
	}
}

if (global.level > 1) {
	var text = eng() ? ("Quests\nYou can check your quests here.\nSome quests are added automatically.\nCheck this frequently.") :
	("Görevler\nBuradan görevlerine bakabilirsin, bazı\ngörevler otomatik olarak eklenir.\nBurayı sıkça kontrol et.")
	var tutorialBox = tutorial_box_point(contGUi.qLogoX, display_get_gui_height()-106, "", text, 18)
	if (tutorialBox != pointer_null) {
		tutorialBox.offset_y -= 170
		tutorialBox.image_xscale = 0.85
		tutorialBox.image_yscale = tutorialBox.image_xscale
		tutorialBox.imageNumber = 1
	}
}

if (global.selectedSkill[4] == objMainBS) {
	var text = eng() ? ("Skill Points\nUse your skill points\nafter you level up.") :
	("Beceri Puanları\nSeviye atladıktan sonra\nbeceri puanlarını kullan.")
	var tutorialBox = tutorial_box_point(contGUi.sLogoX, display_get_gui_height()-103, "", text, 12)
	if (tutorialBox != pointer_null) {
		tutorialBox.offset_y -= 149
		tutorialBox.image_xscale = 0.85
		tutorialBox.image_yscale = tutorialBox.image_xscale
		tutorialBox.imageNumber = 1
	}
}
#endregion

if (room == roomCreatureTest) {
	var _list = ds_list_create()
	with (parCreature) {
		if (!isLeader_hard and ds_list_find_index(_list, object_index) == -1) {
			make_creature_leader(true)
			ds_list_add(_list, object_index)
		}
	}
	ds_list_destroy(_list)
}

#region Recruit
if (!is_castle(room) and room != roomCamp1) {
	with (objPlayer) {
		var protectors = ds_list_create()
		var protector = pointer_null
	
		var torchGiven = true
	
		with (parEfbox_RecruitedWarrior) {
			var _type
			if (level == 10)
				_type = recruited_1
			else if (level == 15)
				_type = recruited_2
			else if (level == 20)
				_type = recruited_3
			else if (level == 25)
				_type = recruited_4
			else if (level == 3)
				_type = recruited_low_1
			else if (level == 6)
				_type = recruited_low_2
			
			with (objPlayer) {
				protector = target_spawn_protectors(objWarrior_melee, 400)
				if (protector != pointer_null) {
					with (protector) {
						init_warrior(_type)
						hasTorch = torchGiven
						torchGiven = false
					}
				
					ds_list_add(protectors, protector)
				}
			}
		}
	
		#region Allies Construction
		var ds_size = ds_list_size(protectors)
		for (var i = 0; i < ds_size; i++)
			with (ds_list_find_value(protectors, i)) {
				teamNo = team_player
				ds_list_copy(allies, protectors)
				ai_protectors_remove(id)
			}
		#endregion
	
		ds_list_destroy(protectors)
	}
}
#endregion