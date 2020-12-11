if (is_outfight()) {
	if (place_meeting(x, y, objPlayer) and active) {
		if (!opensMap) {
			contMain.player_goto_x = goto_x
			contMain.player_goto_y = goto_y

			if (roomIndex == roomCastle_area and global.level == 1 and room == roomRoad) {
				global.totalHours = 4
				global.anticheat_hour = recalculate_sha_time()
			}
				
			change_location(roomIndex, name, 1)
		
			active = false
		}
		else if (alarm[0] == -1 and !instance_exists(objMap)) {
			with (contMain)
				event_perform(ev_keypress, ord("M"))
			
			mapOpened = true
	
			alarm[0] = 0.5*sec
		}
	} else {
		alarm[0] = -1
	
		if (mapOpened) {
			with (contMain)
				event_perform(ev_keypress, ord("M"))
		}
	}
}

alarm[2] = 4