/// @param saveKey*
function save_bag() {

	if (can_save()) {
		global.grid_item = ds_grid_recreate(global.grid_item, global.bagBoxCount_horizontal*global.bagMaxPage, global.bagBoxCount_vertical+5, -1)
		global.grid_itemActive = ds_grid_recreate(global.grid_itemActive, global.bagBoxCount_horizontal*global.bagMaxPage, global.bagBoxCount_vertical+5, false)
		global.grid_itemUpgrade = ds_grid_recreate(global.grid_itemUpgrade, global.bagBoxCount_horizontal*global.bagMaxPage, global.bagBoxCount_vertical+5, -1)
		global.grid_itemExtension[0] = ds_grid_recreate(global.grid_itemExtension[0], global.bagBoxCount_horizontal*global.bagMaxPage, global.bagBoxCount_vertical+5, -1)
		global.grid_itemExtension[1] = ds_grid_recreate(global.grid_itemExtension[1], global.bagBoxCount_horizontal*global.bagMaxPage, global.bagBoxCount_vertical+5, -1)
		global.grid_itemCount = ds_grid_recreate(global.grid_itemCount, global.bagBoxCount_horizontal*global.bagMaxPage, global.bagBoxCount_vertical+5, -1)

		if (argument_count == 1) ini_open(string(global.steamID)+"\\save_"+argument[0]+".lufsav")
			for (var i = 0; i < global.bagBoxCount_horizontal*global.bagMaxPage; i++)
			    for (var j = 0; j < global.bagBoxCount_vertical+5; j++) {
					if (j >= global.bagBoxCount_vertical and i == 0 or j < global.bagBoxCount_vertical) {
						ds_grid_set(global.grid_item, i, j, global.item[i, j] == -1 ? -1 : object_get_name(global.item[i, j]))
						ds_grid_set(global.grid_itemActive, i, j, global.itemActive[i, j])
				        ds_grid_set(global.grid_itemUpgrade, i, j, global.itemUpgrade[i, j])
				        ds_grid_set(global.grid_itemExtension[0], i, j, global.itemExtension0[i, j])
				        ds_grid_set(global.grid_itemExtension[1], i, j, global.itemExtension1[i, j])
						ds_grid_set(global.grid_itemCount, i, j, global.itemCount[i, j])
					}
					else {
						ds_grid_set(global.grid_item, i, j, -1)
						ds_grid_set(global.grid_itemActive, i, j, false)
				        ds_grid_set(global.grid_itemUpgrade, i, j, -1)
				        ds_grid_set(global.grid_itemExtension[0], i, j, -1)
				        ds_grid_set(global.grid_itemExtension[1], i, j, -1)
						ds_grid_set(global.grid_itemCount, i, j, -1)
					}
			    }


			ini_write_real("55s5a5gz", "6w3aa53", encyrpt(min(global.money, 999999)))
	
			ini_write_string("55s5a5gz", "25a6ui", ds_grid_write(global.grid_item))
			ini_write_string("55s5a5gz", "797fgfo", ds_grid_write(global.grid_itemActive))
			ini_write_string("55s5a5gz", "2a5aagv", ds_grid_write(global.grid_itemUpgrade))
			ini_write_string("55s5a5gz", "hgf4jxa2", ds_grid_write(global.grid_itemExtension[0]))
			ini_write_string("55s5a5gz", "x526aan", ds_grid_write(global.grid_itemExtension[1]))
			ini_write_string("55s5a5gz", "jjtyd33av", ds_grid_write(global.grid_itemCount))
		if (argument_count == 1) ini_close()
	}


}
