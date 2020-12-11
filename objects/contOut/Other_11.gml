if (page < maxPage) {
	page++
	
	draw_set_font(fontCinematic) draw_set_alpha(0)
		cinematicText_width = string_width(draw_text_colortags(0, 0, cinematicText[page-1]))
	draw_set_font(global.mainFont) draw_set_alpha(1)
	
	image_alpha = 0
	blackScreenAlpha = 1
	
	if (page == 1)
		backButton_isActive = false
	else
		backButton_isActive = true
}
else {
	if (global.cinematicIndex == 0) {
		with (contMain) {
			targetRoom = roomBeforeRoad
			targetRoomName = loc_beforeroad
			alarm[5] = 1
		}
	}
	else if (global.cinematicIndex == 1) {		
		if (ds_list_find_index(global.takenTutorials, 16) == -1)
			ds_list_add(global.takenTutorials, 16)
		
		quest_progress(objQuest_meetElise, 1)
		
		with (contMain) {
			targetRoom = roomCreature3
			targetRoomName = loc_spawn3
			alarm[5] = 1
		}
	}
}