for (i = 0; i < horizontalBoxCount*maxPage; i++) {
    for (j = 0; j < verticalBoxCount+5*(i == 0); j++) {
        box_x[i, j] = floor(offset_x+((i mod horizontalBoxCount)+1/2)*boxEdge+boxBetween*(i mod horizontalBoxCount))
        box_y[i, j] = floor(offset_yTop+(j+1/2)*boxEdge+boxBetween*j)
        
        if (global.item[i, j] != -1) {
            item[i, j] = instance_create(-50, -50, global.item[i, j])
            item[i, j].from = window_items
            item[i, j].i = i
            item[i, j].j = j
            item[i, j].depth = depth-5
            item[i, j].upgrade = global.itemUpgrade[i, j]
            item[i, j].extension[0] = global.itemExtension0[i, j]
            item[i, j].extension[1] = global.itemExtension1[i, j]
            item[i, j].count = global.itemCount[i, j]
            item[i, j].owner = id
			with (item[i, j])
				item_self_calculate()
        }
        else
            item[i, j] = -1
    }
}

event_perform(ev_other, ev_user6)