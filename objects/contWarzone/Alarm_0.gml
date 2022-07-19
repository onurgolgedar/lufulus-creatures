broke_outfight()

with (parAi) {
	nearList = ds_list_create()
	var _nearList = nearList
	
	for (var dis = 150; dis < 5000; dis *= 1.5) {
		with (parAi)
			if (teamNo != other.teamNo and point_distance(x, y, other.x, other.y) < dis)
				ds_list_add(_nearList, id)
				
		if (ds_list_size(_nearList) > 0)
			break
	}
}

with (parAi) {
	if (nearList != pointer_null) {
		var ds_size = ds_list_size(nearList)
	
		if (ds_size > 0) {
			ai_reaction(ds_list_find_value(nearList, irandom(ds_size-1)), true)
			targetLock = max(targetLock, 50)
		}
		
		ds_list_destroy(nearList)
	}
}