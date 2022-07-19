if (room == roomCamp1 or room == roomRebelWar or room == roomRebelWar2) {
	var mapQuest = pointer_null
	if (room == roomCamp1)
		mapQuest = objQuest_firstFight
	else if (room == roomRebelWar)
		mapQuest = objQuest_rebelWar
	else if (room == roomRebelWar2)
		mapQuest = objQuest_rebelWar2
	
	if (mapQuest != pointer_null) {
		var enemyCount = 0
		with (parAi)
			if (teamNo == team_enemy and !death)
				enemyCount++
			
		if (enemyCount == 0)
			quest_progress(mapQuest, 1)
	}
}
else if (room == roomCave and quest_exists(objChallenge_bloodyRolf)) {
	global.defenseLock = false
	
	with (efboxDefenseLock)
		event_user(3)
		
	with (parCreature)
		if (!isAggressive)
		
		ai_set_aggressive()
}

with (objWarrior_melee) {
	var _warrior = id
	if (mode == md_calm) {
		with (parCreature) {
			if (mode == md_calm and !boss and !isLeader_hard and global.gameTime-contMain.startTime > 15 and !isLeader and leader == pointer_null and point_distance(x, y, _warrior.x, _warrior.y) < 500 and irandom(7) == 0) {
				ai_reaction(_warrior)
				break
			}
		}
	}
}

if (global.bankRentMessage_value > 0) {
	show_messagebox(400, 400, eng() ? ("You earned [c="+string(c_gold)+"]"+string(global.bankRentMessage_value)+"[/c] gold(s) as a return of item renting.\nYou can take your earnings from the bank.")
									: ("Eşya kiralama getirisi olarak bankanda\n[c="+string(c_gold)+"]"+string(global.bankRentMessage_value)+" altın[/c] daha birikti.\nBu altınları bankadan alabilirsin.")
					, eng() ? "Rent Payment" : "Kira Getirisi")
	global.bankRentMessage_value = 0
}

if (global.recruitText != "") {
	show_messagebox(440, 180, global.recruitText, eng() ? "Party Summary" : "Ekip Özeti")
	global.recruitText = ""
}

if (instance_exists(contWaveSpawn)) {
	with (parCreature)
		if (!canSee and (isSearching or !is_in_room() or (!inView and point_distance(x, y, targetPosX, targetPosY) < 150))) {
			if (!is_in_room() and irandom(4)) {
				var dirToCenter = point_direction(phy_com_x, phy_com_y, room_width/2, room_height/2)
				physics_apply_impulse(phy_com_x, phy_com_y, forceFactor*lengthdir_x(1, dirToCenter),
				forceFactor*lengthdir_y(1, dirToCenter))
			}
		}
}

delta_alarm(1, sec*1.25)