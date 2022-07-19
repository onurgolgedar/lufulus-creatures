for (var i = 0; i < horizontalBoxCount*maxPage; i++) {
    for (var j = 0; j < verticalBoxCount; j++) {
		if (item[i, j] != -1 and item[i, j].object_index != objNoitem) {
			// Compare item
			compare_item[i, j] = instance_create(-50, -50, item[i, j].object_index)
			if (get_active_item_ij(compare_item[i, j].type, 0) != -1) {
				var compare_upgrade
				compare_upgrade = global.itemUpgrade[get_active_item_ij(compare_item[i, j].type, 0), get_active_item_ij(compare_item[i, j].type, 1)]
				
				compare_item[i, j].from = window_trade
				compare_item[i, j].i = i
				compare_item[i, j].j = j
				compare_item[i, j].depth = depth-5
				compare_item[i, j].upgrade = compare_upgrade
				compare_item[i, j].imaginary = true
				compare_item[i, j].extension[0] = item[i, j].extension[0]
				compare_item[i, j].extension[1] = item[i, j].extension[1]
				compare_item[i, j].count = item[i, j].count
				compare_item[i, j].owner = id
				compare_item[i, j].worth = item[i, j].worth
				
				with (compare_item[i, j])
					item_self_calculate()
			}
			else {
				instance_destroy(compare_item[i, j])
				compare_item[i, j] = -1
			}
		}
		else
			compare_item[i, j] = -1
	}
}