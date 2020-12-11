for (var i = 0; i < horizontalBoxCount*maxPage; i++) {
    for (var j = 0; j < verticalBoxCount; j++) {
        box_x[i, j] = floor(offset_x+((i mod horizontalBoxCount)+1/2)*boxEdge+boxBetween*(i mod horizontalBoxCount))
        box_y[i, j] = floor(offset_yTop+(j+1/2)*boxEdge+boxBetween*j)

		item[i, j] = -1
	}
}

for (var i = 0; i < 5; i++) {
	var v_type, boxI, boxJ
	if (i == 0) { v_type = type_necklace boxI = 1 boxJ = 0 }
	else if (i == 1) { v_type = type_sweapon boxI = 0 boxJ = 1 }
	else if (i == 2) { v_type = type_clothes boxI = 1 boxJ = 1 }
	else if (i == 3) { v_type = type_mweapon boxI = 2 boxJ = 1 }
	else if (i == 4) { v_type = type_medallion boxI = 1 boxJ = 2 }
	
	if (get_active_item_ij(v_type, 0) != -1) {
		var itemI = get_active_item_ij(v_type, 0)
		var itemJ = get_active_item_ij(v_type, 1)
	
		item[boxI, boxJ] = instance_create(0, 0, global.item[itemI, itemJ])
		item[boxI, boxJ].from = window_actives
		item[boxI, boxJ].i = boxI
		item[boxI, boxJ].j = boxJ
		item[boxI, boxJ].depth = depth-5
		item[boxI, boxJ].upgrade = global.itemUpgrade[itemI, itemJ]
		item[boxI, boxJ].extension[0] = global.itemExtension0[itemI, itemJ]
		item[boxI, boxJ].extension[1] = global.itemExtension1[itemI, itemJ]
		item[boxI, boxJ].count = 1
		item[boxI, boxJ].owner = id
		with (item[boxI, boxJ])
			item_self_calculate()
	}
}