greenPage = is_page_empty_bank(page)

for (i = 0; i < global.bagBoxCount_horizontal*global.bagMaxPage; i++) {
	for (j = 0; j < global.bagBoxCount_vertical+(i == 0)*5; j++)
	{     
		if (global.item[i, j] != -1)
		{
			im_item[i, j] = instance_create(-50, -50, global.item[i, j])
			im_item[i, j].from = window_imbank
			im_item[i, j].i = i
			im_item[i, j].j = j
			im_item[i, j].depth = depth-5
			im_item[i, j].upgrade = global.itemUpgrade[i, j]
			im_item[i, j].extension[0] = global.itemExtension0[i, j]
			im_item[i, j].extension[1] = global.itemExtension1[i, j]
			im_item[i, j].count = global.itemCount[i, j]
			im_item[i, j].owner = id
			im_item[i, j].imaginary = true
			with (im_item[i, j])
				item_self_calculate()
		}
		else 
			im_item[i, j] = -1
	}
}

for (i = 0; i < horizontalBoxCount*maxPage; i++) {
    for (j = 0; j < verticalBoxCount; j++) {
        box_x[i, j] = floor(offset_x+((i mod horizontalBoxCount)+1/2)*boxEdge+boxBetween*(i mod horizontalBoxCount))
        box_y[i, j] = floor(offset_yTop+(j+1/2)*boxEdge+boxBetween*j)
        
        if (global.item_bank[i, j] != -1) {
            item[i, j] = instance_create(-50, -50, global.item_bank[i, j])
            item[i, j].from = window_bank
            item[i, j].i = i
            item[i, j].j = j
            item[i, j].depth = depth-5
            item[i, j].upgrade = global.itemUpgrade_bank[i, j]
            item[i, j].extension[0] = global.itemExtension0_bank[i, j]
            item[i, j].extension[1] = global.itemExtension1_bank[i, j]
            item[i, j].count = global.itemCount_bank[i, j]
			item[i, j].rentTime = global.itemRentTime_bank[i, j]
            item[i, j].owner = id
			with (item[i, j])
				item_self_calculate()
        }
        else
            item[i, j] = -1
    }
}

event_user(6)
event_user(8)