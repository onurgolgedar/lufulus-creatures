function itembag_refresh() {
	with (objitemBag) {
	    event_perform(ev_other, ev_user4)
	    event_perform(ev_other, ev_user3)
	}

	with (objEquipmentBag) {
	    event_perform(ev_other, ev_user4)
	    event_perform(ev_other, ev_user3)
	}

	// ?
	with (objUpgrader_npc) {
		with (objMessageBox)
			if (draw_text_colortags(x, y, title) == "New Item:")
				close_window()
			
		itemI = -1
		itemJ = -1
		itemUpgradeCost = 0
		itemUpgradeChance = 0
	}


}
