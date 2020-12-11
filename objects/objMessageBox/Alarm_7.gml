delta_alarm(7, sec/20)

if (owner != -1 and !specialDesign and instance_exists(owner) and point_distance(owner.x, owner.y, objPlayer.x, objPlayer.y) > NPC_CLICKDISTANCE)
	close_window()