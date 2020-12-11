/// @param saveKey*
function save_general() {

	if (can_save()) {
		if (argument_count == 1) ini_open(string(global.steamID)+"\\save_"+argument[0]+".lufsav")	
			ini_write_string("b534uxoo7", "2agj3as", sprite_get_name(global.hair))
			ini_write_string("b534uxoo7", "52ga23x", ds_list_write(global.titles))
			ini_write_string("b534uxoo7", "v4v46x1", ds_list_write(global.takenLootboxes))
			ini_write_string("b534uxoo7", "63b2ssu", ds_list_write(global.takenBosses))
			ini_write_string("b534uxoo7", "cv58gsp", ds_list_write(global.takenTutorials))
			ini_write_string("b534uxoo7", "y65i45xa12", ds_list_write(global.gameChoices))
		
			var destroyedMaps_convert = ds_list_create()
			ds_list_copy(destroyedMaps_convert, global.destroyedMaps)
			var ds_size = ds_list_size(destroyedMaps_convert)
			for (var i = 0; i < ds_size; i++)
				ds_list_replace(destroyedMaps_convert, i, room_get_name(ds_list_find_value(global.destroyedMaps, i)))
			ini_write_string("b534uxoo7", "2v15678a", ds_list_write(destroyedMaps_convert))
			ds_list_destroy(destroyedMaps_convert)

			ini_write_string("b534uxoo7", "2556217asx", ds_map_write(global.goldTaken_creature))
			ini_write_real("b534uxoo7", "bx56x342jk", encyrpt(global.clothesStyle))
			ini_write_real("b534uxoo7", "v256gige", encyrpt(global.gameTime))
			ini_write_real("b534uxoo7", "fu45axooy", encyrpt(global.totalHours))
			ini_write_real("b534uxoo7", "j6vv843d", encyrpt(global.debt))
			ini_write_real("b534uxoo7", "o8p6sdsn", encyrpt(global.debtCount))
			ini_write_real("b534uxoo7", "4cx14c16ds", encyrpt(global.debtPayingTime))
		if (argument_count == 1) ini_close()
	}


}
