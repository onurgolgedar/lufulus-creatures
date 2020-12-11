draw_self()

if (global.itemSelected != -1 and (global.itemSelected.from == window_items or global.itemSelected.from == window_actives)
and is_item_upgradabletype(global.itemSelected)) {
	if (point_distance(npc.x, npc.y, objPlayer.x, objPlayer.y) < 300 and
	!collision_line(npc.x, npc.y, objPlayer.x, objPlayer.y, parSolid, 1, 1)) {
		draw_highlight()
	}
}