if (global.itemSelected != -1 and global.itemSelected.from == window_items) {
	if (anim_end(objPlayer)) {
		if (instance_exists(objTradeWindow) and !objTradeWindow.loot) {
			with (global.itemSelected) {
				qKey = 1
				chosenButton = 1
				event_perform(ev_other, ev_user12)
			}
		}
		else {
			with (global.itemSelected) {
				qKey = 1
				chosenButton = 2
				event_perform(ev_other, ev_user12)
			}
		}
		
		global.itemSelected = -1
	}
}