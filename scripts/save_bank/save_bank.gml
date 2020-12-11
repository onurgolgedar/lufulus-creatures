/// @param saveKey*
function save_bank() {

	if (can_save()) {
		global.grid_item_bank = ds_grid_recreate(global.grid_item_bank, global.bagBoxCount_horizontal*global.bagMaxPage, global.bagBoxCount_vertical, -1)
		global.grid_itemUpgrade_bank = ds_grid_recreate(global.grid_itemUpgrade_bank, global.bagBoxCount_horizontal*global.bagMaxPage, global.bagBoxCount_vertical, -1)
		global.grid_itemExtension_bank[0] = ds_grid_recreate(global.grid_itemExtension_bank[0], global.bagBoxCount_horizontal*global.bagMaxPage, global.bagBoxCount_vertical, -1)
		global.grid_itemExtension_bank[1] = ds_grid_recreate(global.grid_itemExtension_bank[1], global.bagBoxCount_horizontal*global.bagMaxPage, global.bagBoxCount_vertical, -1)
		global.grid_itemCount_bank = ds_grid_recreate(global.grid_itemCount_bank, global.bagBoxCount_horizontal*global.bagMaxPage, global.bagBoxCount_vertical, -1)
		global.grid_itemRentTime_bank = ds_grid_recreate(global.grid_itemRentTime_bank, global.bagBoxCount_horizontal*global.bagMaxPage, global.bagBoxCount_vertical, -1)

		if (argument_count == 1) ini_open(string(global.steamID)+"\\save_"+argument[0]+".lufsav")
	
			for (var i = 0; i < global.bagBoxCount_horizontal*global.bagMaxPage; i++) {
			    for (var j = 0; j < global.bagBoxCount_vertical; j++) {
					ds_grid_set(global.grid_item_bank, i, j, global.item_bank[i, j] == -1 ? -1 : object_get_name(global.item_bank[i, j]))
			        ds_grid_set(global.grid_itemUpgrade_bank, i, j, global.itemUpgrade_bank[i, j])
			        ds_grid_set(global.grid_itemExtension_bank[0], i, j, global.itemExtension0_bank[i, j])
			        ds_grid_set(global.grid_itemExtension_bank[1], i, j, global.itemExtension1_bank[i, j])
					ds_grid_set(global.grid_itemCount_bank, i, j, global.itemCount_bank[i, j])
					ds_grid_set(global.grid_itemRentTime_bank, i, j, global.itemRentTime_bank[i, j])
			    }
			}
	
			ini_write_string("42af476", "saf4nt5wa", ds_grid_write(global.grid_item_bank))
			ini_write_string("42af476", "52agjjz", ds_grid_write(global.grid_itemUpgrade_bank))
			ini_write_string("42af476", "25axgj3hl", ds_grid_write(global.grid_itemExtension_bank[0]))
			ini_write_string("42af476", "652f26j", ds_grid_write(global.grid_itemExtension_bank[1]))
			ini_write_string("42af476", "3abj4d", ds_grid_write(global.grid_itemCount_bank))
			ini_write_string("42af476", "5xf36u8s", ds_grid_write(global.grid_itemRentTime_bank))
		
			ini_write_real("42af476", "h3hh3cssj", encyrpt(min(global.rentGold, 999999)))
		
		if (argument_count == 1) ini_close()
	}


}
