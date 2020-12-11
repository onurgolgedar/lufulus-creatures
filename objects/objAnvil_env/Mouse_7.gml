with (parWindow) {
	event_perform(ev_other, ev_user1)
	if (mouseOnBody)
		exit
}

if (global.itemSelected != -1 and (global.itemSelected.from == window_items or global.itemSelected.from == window_actives)
/*and is_item_upgradable(global.itemSelected)*/) {
	if (point_distance(npc.x, npc.y, objPlayer.x, objPlayer.y) < 300 and
	!collision_line(npc.x, npc.y, objPlayer.x, objPlayer.y, parSolid, 1, 1)) {
		with (npc) {
			event_perform(ev_other, ev_user1)
		}
	}
}