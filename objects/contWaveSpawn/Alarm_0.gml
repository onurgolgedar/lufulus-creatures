var isHard1Creature = wave_no != wave_maxNo and wave_no != 1 and wave_maxCycle-1 == wave_cycle
var isHard2Creature = wave_no == wave_maxNo and wave_maxCycle-2 == wave_cycle

if (!isHard1Creature and !isHard2Creature) {
	for (var angle = 0; angle < 360; angle += isDestroyedMap ? 48 : 72) {
		var resultX, resultY
		var center_x = room_width/2
		var center_y = room_height/2
		var squareLength = radius*2
		
		if (angle >= 315 or angle < 45) {
			resultX = center_x+squareLength/2
			resultY = center_y+squareLength/2*tan(angle)
		}
		else if (angle >= 45 and angle < 135) {
			resultX = center_x-squareLength/2*sin(angle-45)
			resultY = center_y-squareLength/2
		}
		else if (angle >= 135 and angle < 225) {
			resultX = center_x-squareLength/2
			resultY = center_y+squareLength/2*cos((angle-135)*2)
		}
		else if (angle >= 225 and angle < 315) {
			resultX = center_x-squareLength/2*cos((angle-225)*2)
			resultY = center_y+squareLength/2
		}
		
		var creatureIndex
		if (!isDestroyedMap) {
			if (wave_cycle <= 3)
				creatureIndex = (angle % 144 == 0) ? c_normal_1 : c_normal_1
			else if (wave_cycle <= 5)
				creatureIndex = (angle % 144 == 0) ? c_normal_1 : c_normal_2
			else if (wave_cycle <= 7)
				creatureIndex = (angle % 144 == 0) ? c_normal_2 : c_normal_3
		}
		else {
			if (wave_cycle <= 3)
				creatureIndex = (angle % 96 == 0) ? c_normal_1 : c_normal_1
			else if (wave_cycle <= 5)
				creatureIndex = (angle % 96 == 0) ? c_normal_1 : c_normal_2
			else if (wave_cycle <= 7)
				creatureIndex = (angle % 96 == 0) ? c_normal_2 : c_normal_3
		}
		
		var spawnedCreature = instance_create_layer(resultX, resultY, "lyBelowPlayer", creatureIndex)
	
		with (spawnedCreature) {
			if (object_index == other.c_normal_1 and chance(other.c_normal_1_darkChance, 10)
				or object_index == other.c_normal_2 and chance(other.c_normal_2_darkChance, 10)
				or object_index == other.c_normal_3 and chance(other.c_normal_3_darkChance, 10))
				make_creature_dark()
			
			attacked(0, objPlayer.id, false, false)
			stop_moving(irandom(1.5*sec))
			phy_rotation = -point_direction(x, y, objPlayer.x, objPlayer.y)
			drop_lists_destroy()
		}
	}
}
else {
	var creatureIndex
	var creature_isLeader
	if (isHard2Creature) {
		creatureIndex = c_hard_2
		creature_isLeader = c_hard_2_isLeader
	}
	else if (isHard1Creature) {
		creatureIndex = c_hard_1
		creature_isLeader = c_hard_1_isLeader
	}
		
	var angle = 90
	var resultX = room_width/2
	var resultY = room_height/2-radius
		
	var spawnedCreature = instance_create_layer(resultX, resultY, "lyBelowPlayer", creatureIndex)
	
	with (spawnedCreature) {
		if (creature_isLeader)
			make_creature_leader(true)
		
		ai_reaction(objPlayer.id, true)
		stop_moving(irandom(1.5*sec))
		phy_rotation = point_direction(x, y, objPlayer.x, objPlayer.y)
	}
}

#region FOR QUESTS
if (blacksmithQuest_exists and !blacksmithQuest_dropped) {
	with (spawnedCreature) {
		other.blacksmithQuest_dropped = true
		
		if (!hasDropList)
			init_droplist()
			
		update_droplist(objSw_001Q, 0, -1, -1, 1000)
	}
}
#endregion

if (wave_cycle != wave_maxCycle) {
	delta_alarm(0, 7*sec)
	delta_alarm(11, 7*sec+4*sec, id, true)
	wave_cycle++
}