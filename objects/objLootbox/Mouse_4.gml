if (!test_upperclick_window() and ds_list_size(droppedList) > 0/* and is_outfight()*/) {
	if (point_distance(x, y, objPlayer.x, objPlayer.y) <= NPC_CLICKDISTANCE
	and !collision_line(x, y, objPlayer.x, objPlayer.y, parSolid, 1, 1)) {
		if (instance_exists(objTradeWindow)) {			
		    with (objTradeWindow)
				close_table()
		}	
		
		var tradeWindow = instance_create_layer(device_mouse_x_to_gui(0)+10, device_mouse_y_to_gui(0)-45, "lyWindows", objTradeWindow)
		tradeWindow.owner = id
		tradeWindow.loot = true
	
		if (type != 0) {
			if (ds_list_find_index(global.takenLootboxes, lootNo) == -1) {
				ds_list_add(global.takenLootboxes, lootNo)
				save_general(global.saveNo)
			
				if (ds_list_size(global.takenLootboxes) >= 5 and !steam_get_achievement("treasure_hunter"))
					steam_set_achievement("treasure_hunter")
			}
		}
	}
	else {
		instance_create_layer(x, y, "lyBelowGUI", objNPCDistanceCircle)
		show_messagebox(250, 250, eng() ? "You must be near and there\nmust be no obstacles between you." : "Yakınında olmalısın.\nAranızda engel olmamalı.", eng() ? "Not Allowed" : "İşlem Gerçekleştirilemedi", 1.5*sec)
	}
}