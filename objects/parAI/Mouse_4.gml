if (death and !test_upperclick_window() and hasDropList and ds_list_size(droppedList) > 0 and !objPlayer.death) {
	if (point_distance(x, y, objPlayer.x, objPlayer.y) < NPC_CLICKDISTANCE) {
		if (instance_exists(objTradeWindow)) {			
		    with (objTradeWindow)
				close_table()
		}	
		
		var tradeWindow = instance_create_layer(device_mouse_x_to_gui(0)+10, device_mouse_y_to_gui(0)-45, "lyWindows", objTradeWindow);
		tradeWindow.owner = id
		tradeWindow.loot = true
	}
	else {
		instance_create_layer(x, y, "lyBelowGUI", objNPCDistanceCircle)
		show_messagebox(250, 250, eng() ? "You must be near and there\nmust be no obstacles between you." : "Yakınında olmalısın.\nAranızda engel olmamalı.", eng() ? "Not Allowed" : "İşlem Gerçekleştirilemedi", 1.5*sec)
	}
}