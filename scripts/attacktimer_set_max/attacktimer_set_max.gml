function attacktimer_set_max() {
	var postActiveAttackSpeed = activeAttackSpeed

	if (object_get_parent(object_index) == parCreature) {
		if (extension_exists(ext_nearslow) and point_distance(x, y, objPlayer.x, objPlayer.y) < 500)
			postActiveAttackSpeed = round(postActiveAttackSpeed*0.85)
	}

	if (postActiveAttackSpeed != 0)
		attackTimer = floor(sec/postActiveAttackSpeed)
	else
		attackTimer = 1


}
