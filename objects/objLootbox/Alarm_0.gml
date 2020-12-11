if (type == 1) {
	light = follow_light(id, 1, 1, true)
	light.sl_light_color = c_fuchsia
} else if (type == 2) {
	light = follow_light(id, 1, 1.3, true)
	light.sl_light_color = c_aqua
}

if (type == 0 and abs(get_dayhour()-dropTime) < 2 and global.level > 4)
	enrich_droplist()

if (type == 0 or ds_list_find_index(global.takenLootboxes, lootNo) == -1) {
	if (global.level > 7) {
		if (type == 1) {
			update_droplist(objSilver, 0, -1, -1, 500)
			update_droplist(objPlatinum, 0, -1, -1, 250)
			update_droplist(objGoldPiece, 0, -1, -1, 50)
		} else if (type == 2) {
			update_droplist(objPlatinum, 0, -1, -1, 500)
			update_droplist(objCrystal, 0, -1, -1, 50)
			update_droplist(objPlatinum, 0, -1, -1, 100)
			update_droplist(objSilver, 0, -1, -1, 100)
		}
	}
	
	drop_items()
}

event_perform(ev_other, ev_user0)