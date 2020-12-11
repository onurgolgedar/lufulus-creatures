/// @param saveKey*
function save_fms() {

	if (can_save()) {
		if (argument_count == 1) ini_open(string(global.steamID)+"\\save_"+argument[0]+".lufsav")	
			ini_write_string("g1g4c6c32a", "h6i63", ds_list_write(global.fixedMessageNos))
			ini_write_string("g1g4c6c32a", "673lfs3va", ds_list_write(global.fixedMessageActivations))
		if (argument_count == 1) ini_close()
	}


}
