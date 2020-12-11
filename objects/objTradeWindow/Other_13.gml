for (i = 0; i < global.bagBoxCount_horizontal*global.bagMaxPage; i++) {
	for (j = 0; j < global.bagBoxCount_vertical+(i == 0)*5; j++)
	{     
		if (global.item[i, j] != -1)
		{
			im_item[i, j] = instance_create(-50, -50, global.item[i, j])
			im_item[i, j].from = window_imtrade
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

if (!owner.hasDropList and (owner.object_index == objAdam_npc or owner.object_index == objUpgrader_npc or owner.object_index == objBanker_npc)) {
	for (i = 0; i < horizontalBoxCount*maxPage; i++)
	{
	    for (j = 0; j < verticalBoxCount; j++)
	    {        
	        if (owner.item[i, j] != -1)
	        {
	            item[i, j] = instance_create(-50, -50, owner.item[i, j])
	            item[i, j].from = window_trade
	            item[i, j].i = i
	            item[i, j].j = j
	            item[i, j].depth = depth-5
	            item[i, j].upgrade = owner.itemUpgrade[i, j]
	            item[i, j].extension[0] = owner.itemExtension0[i, j]
	            item[i, j].extension[1] = owner.itemExtension1[i, j]
	            item[i, j].count = owner.itemCount[i, j]
	            item[i, j].owner = id
				item[i, j].worth *= owner.priceRatio*(100-discount)/100
				
				with (item[i, j]) {
					item_self_calculate()
					
					// Special for materials
					if (type == type_material) {
						cWorth *= other.owner.priceRatio
						cWorth = round(cWorth)
					}
				}
	        }
	        else
	            item[i, j] = -1
	    }
	}
} else {
	for (i = 0; i < horizontalBoxCount*maxPage; i++)
	    for (j = 0; j < verticalBoxCount; j++)
	            item[i, j] = -1

    var ds_size = ds_list_size(owner.droppedList)
	for (var t = 0; t < ds_size; t++) {
		i = t mod horizontalBoxCount
		j = t div horizontalBoxCount
		
		var upgrade = ds_list_find_value(owner.droppedUpgradeList, t)
		var ext0 = ds_list_find_value(owner.droppedExtension0List, t)
		var ext1 = ds_list_find_value(owner.droppedExtension1List, t)
		
		item[i, j] = instance_create(-50, -50, ds_list_find_value(owner.droppedList, t))
		item[i, j].from = "Loot"
		item[i, j].i = i
		item[i, j].j = j
		item[i, j].depth = depth-5
		item[i, j].upgrade = upgrade
		
		if (ext0 != -1)
			item[i, j].extension[0] = ext0 != 0 ? ext0 : -1
		if (ext1 != -1)
			item[i, j].extension[1] = ext1 != 0 ? ext1 : -1
		
		item[i, j].count = ds_list_find_value(owner.droppedCountList, t)
		item[i, j].owner = id
		with (item[i, j])
			item_self_calculate()
	}
}

event_perform(ev_other, ev_user6)