delta_alarm(3, sec/20)

if (!loot and !instance_exists(objitemBag))
	offset_yDown = 45
else
	offset_yDown = offset_yDown_base
	
if (instance_exists(owner)) {
	if (point_distance(owner.x, owner.y, objPlayer.x, objPlayer.y) > NPC_CLICKDISTANCE)
			close_window()
	
	if (loot and owner.object_index != objLootbox) {
		if (owner.alarm[9] > sec/5)
			owner.alarm[9] = 30*sec
		else {
			close_table()
			alarm[3] = -1
		}
	}
}
else {
	close_table()
	alarm[3] = -1
}
	
/*if (!is_outfight()) {
	//show_messagebox(200, 200, eng() ? "It is not allowed when you are in fight." : "Bu işlem savaş sırasında yapılamaz.", eng() ? "Not Allowed" : "İşlem Gerçekleştirilemedi", sec)
	
	close_table()
	alarm[3] = -1
}*/