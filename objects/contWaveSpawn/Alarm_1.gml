for (var angle = 0; angle < 360; angle += isDestroyedMap ? 48 : 72) {
	var resultX, resultY
	var center_x = room_width/2
	var center_y = room_height/2
	var squareLength = radius*2+110
		
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
	if (!isDestroyedMap)
		creatureIndex = (angle % 144 == 0) ? c_ranged_1 : c_ranged_2
	else
		creatureIndex = (angle % 96 == 0) ? c_ranged_1 : c_ranged_2
		
	var spawnedCreature = instance_create_layer(resultX, resultY, "lyBelowPlayer", creatureIndex)
	
	with (spawnedCreature) {		
		ai_reaction(objPlayer.id, true)
		stop_moving(irandom(1.5*sec))
		phy_rotation = -point_direction(x, y, objPlayer.x, objPlayer.y)
		drop_lists_destroy()
	}
	
	if (wave_no == wave_maxNo and wave_cycle == wave_maxCycle-2 and angle == 144 and !isDestroyedMap) {
		var spawnedHardestCreature = instance_create_layer(resultX+70, resultY, "lyBelowPlayer", c_hardest)
	
		with (spawnedHardestCreature) {		
			make_creature_leader(true)
			ai_reaction(objPlayer.id, true)
			phy_rotation = -point_direction(x, y, objPlayer.x, objPlayer.y)
		}
	}
}

if (wave_cycle != wave_maxCycle) {
	delta_alarm(1, 7*sec)
	delta_alarm(11, 7*sec+4*sec, id, true)
	wave_cycle++
}