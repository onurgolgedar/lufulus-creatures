/// @param saveKey*
function save_permanentefboxes() {

	if (can_save()) {
			for (var i = 0; i < ds_list_size(global.permanentEfboxes); i++) {
				var efbox = asset_get_index(ds_list_find_value(global.permanentEfboxes, i))
	
				if (instance_exists(efbox))
					ds_list_set(global.permanentEfboxes_time, i, efbox.time)
				else {
					ds_list_delete(global.permanentEfboxes, i)
					ds_list_delete(global.permanentEfboxes_time, i)
					i--;
				}
			}

		if (argument_count == 1) ini_open(string(global.steamID)+"\\save_"+argument[0]+".lufsav")
			ini_write_string("t5t5334ba", "t2u5x54sdh", ds_list_write(global.permanentEfboxes))
			ini_write_string("t5t5334ba", "bi51xg17fx", ds_list_write(global.permanentEfboxes_time))
		if (argument_count == 1) ini_close()
	}


}
