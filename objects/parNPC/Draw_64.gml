if (isSellActive and inView) {
	if (object_index == objAdam_npc) {
		if (global.itemSelected != -1 and (global.itemSelected.from == window_items or global.itemSelected.from == window_actives)) {
			var text = eng() ? ("Sell: "+string(global.itemSelected.cWorth)) : ("Sat: "+string(global.itemSelected.cWorth))
			show_infobox(screen_point(x, 0), screen_point(y, 1)+contMain.period/2, text, c_green)
		}
	}
}