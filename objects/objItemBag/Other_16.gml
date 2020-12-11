for (i = 0; i < horizontalBoxCount*maxPage; i++) {
    for (j = 0; j < verticalBoxCount+5*(i == 0); j++) {
		if (global.item[i, j] != -1) {
			// Compare item
            compare_item[i, j] = instance_create(-50, -50, global.item[i, j])
			
			if (get_active_item_ij(compare_item[i, j].type, 0) != -1) {
				var compare_upgrade
				compare_upgrade = global.itemUpgrade[get_active_item_ij(compare_item[i, j].type, 0), get_active_item_ij(compare_item[i, j].type, 1)]
			
		        compare_item[i, j].from = window_items
	            compare_item[i, j].i = i
	            compare_item[i, j].j = j
	            compare_item[i, j].depth = depth-5
	            compare_item[i, j].upgrade = compare_upgrade
				compare_item[i, j].imaginary = true
	            compare_item[i, j].extension[0] = global.itemExtension0[i, j]
	            compare_item[i, j].extension[1] = global.itemExtension1[i, j]
	            compare_item[i, j].count = global.itemCount[i, j]
	            compare_item[i, j].owner = id
			
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