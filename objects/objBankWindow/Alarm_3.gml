alarm[3] = sec/10

if (!is_outfight()) {
	close_table()
	alarm[3] = -1
}

if (instance_exists(owner)) {
	if (point_distance(owner.x, owner.y, objPlayer.x, objPlayer.y) > NPC_CLICKDISTANCE)
		close_window()
}
else {
	close_table()
	alarm[3] = -1
}