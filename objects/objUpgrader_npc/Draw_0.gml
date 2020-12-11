event_inherited()

if (inView and global.itemSelected != -1 and (global.itemSelected.from == window_items or global.itemSelected.from == window_actives)
and is_item_upgradabletype(global.itemSelected)) {
	if (point_distance(x, y, objPlayer.x, objPlayer.y) < NPC_CLICKDISTANCE and
	!collision_line(x, y, objPlayer.x, objPlayer.y, parSolid, 1, 1)) {
		draw_highlight()
	}
}